function getURLVar(key) {
	var value = [];

	var query = String(document.location).split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

$(document).ready(function() {
	//Form Submit for IE Browser
	$('button[type=\'submit\']').on('click', function() {
		$("form[id*='form-']").submit();
	});

	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();
		
		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});
	
	// Set last page opened on the menu
	$('#menu a[href]').on('click', function() {
		sessionStorage.setItem('menu', $(this).attr('href'));
	});

	if (!sessionStorage.getItem('menu')) {
		$('#menu #dashboard').addClass('active');
	} else {
		// Sets active and open to selected page in the left column menu.
		$('#menu a[href=\'' + sessionStorage.getItem('menu') + '\']').parents('li').addClass('active open');
	}

	if (localStorage.getItem('column-left') == 'active') {
		$('#button-menu i').replaceWith('<i class="fa fa-dedent fa-lg"></i>');
		
		$('#column-left').addClass('active');
		
		// Slide Down Menu
		$('#menu li.active').has('ul').children('ul').addClass('collapse in');
		$('#menu li').not('.active').has('ul').children('ul').addClass('collapse');
	} else {
		$('#button-menu i').replaceWith('<i class="fa fa-indent fa-lg"></i>');
		
		$('#menu li li.active').has('ul').children('ul').addClass('collapse in');
		$('#menu li li').not('.active').has('ul').children('ul').addClass('collapse');
	}

	// Menu button
	$('#button-menu').on('click', function() {
		// Checks if the left column is active or not.
		if ($('#column-left').hasClass('active')) {
			localStorage.setItem('column-left', '');

			$('#button-menu i').replaceWith('<i class="fa fa-indent fa-lg"></i>');

			$('#column-left').removeClass('active');

			$('#menu > li > ul').removeClass('in collapse');
			$('#menu > li > ul').removeAttr('style');
		} else {
			localStorage.setItem('column-left', 'active');

			$('#button-menu i').replaceWith('<i class="fa fa-dedent fa-lg"></i>');
			
			$('#column-left').addClass('active');

			// Add the slide down to open menu items
			$('#menu li.open').has('ul').children('ul').addClass('collapse in');
			$('#menu li').not('.open').has('ul').children('ul').addClass('collapse');
		}
	});

	// Menu
	$('#menu').find('li').has('ul').children('a').on('click', function() {
		if ($('#column-left').hasClass('active')) {
			$(this).parent('li').toggleClass('open').children('ul').collapse('toggle');
			$(this).parent('li').siblings().removeClass('open').children('ul.in').collapse('hide');
		} else if (!$(this).parent().parent().is('#menu')) {
			$(this).parent('li').toggleClass('open').children('ul').collapse('toggle');
			$(this).parent('li').siblings().removeClass('open').children('ul.in').collapse('hide');
		}
	});
	
	// Override summernotes image manager
	$('button[data-event=\'showImageDialog\']').attr('data-toggle', 'image').removeAttr('data-event');
	
	$(document).delegate('button[data-toggle=\'image\']', 'click', function() {
		$('#modal-image').remove();
		
		$(this).parents('.note-editor').find('.note-editable').focus();
				
		$.ajax({
			url: 'index.php?route=common/filemanager&token=' + getURLVar('token'),
			dataType: 'html',
			beforeSend: function() {
				$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
				$('#button-image').prop('disabled', true);
			},
			complete: function() {
				$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
				$('#button-image').prop('disabled', false);
			},
			success: function(html) {
				$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
	
				$('#modal-image').modal('show');
			}
		});	
	});

	// Image Manager
	$(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
		e.preventDefault();
	
		var element = this,
			panImage = $(element).closest('.pan-image'),
			numImage = panImage.find('.image-box').length,
			currOrder = parseInt($(element).parent().find('input[type="hidden"]').data('order'));

		$(element).popover({
			html: true,
			placement: 'bottom',
			trigger: 'manual',
			content: function() {
				var tmpControl = $('<div>'),
					btnGroup = $('<div class="btn-group cbo-order" role="group" aria-label="..."></div>'),
					btnEdit = $('<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button>'),
					btnDelete = $('<button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>'),
					dropdown = $('<div class="btn-group" role="group"><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Order <span class="caret"></span></button></div>'),
					orderList = $('<ul class="dropdown-menu" role="menu"></ul>');

				for (var i = 1; i <= numImage; i++) {
					var li = $('<li class="order-item"><a href="#">' + i + '</a></li>');
					if (i == currOrder) {
						li.addClass('active');
					}
					orderList.append(li);
				}
				dropdown.append(orderList);
				btnGroup.append(dropdown, btnEdit, btnDelete);
				tmpControl.append(btnGroup);

				return tmpControl.html();
			}
		});
		
		$(element).popover('toggle');

		$('.cbo-order').on('click', 'li', function(e) {
			e.preventDefault();
			$(element).popover('hide');
		});
	
		$('#button-image').on('click', function() {
			$('#modal-image').remove();
	
			$.ajax({
				url: 'index.php?route=common/filemanager&token=' + getURLVar('token') + '&target=' + $(element).parent().find('input').attr('id') + '&thumb=' + $(element).attr('id'),
				dataType: 'html',
				beforeSend: function() {
					$('#button-image i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
					$('#button-image').prop('disabled', true);
				},
				complete: function() {
					$('#button-image i').replaceWith('<i class="fa fa-upload"></i>');
					$('#button-image').prop('disabled', false);
				},
				success: function(html) {
					$('body').append('<div id="modal-image" class="modal">' + html + '</div>');
	
					$('#modal-image').modal('show');
				}
			});
	
			$(element).popover('hide');
		});
	
		$('#button-clear').on('click', function() {
			var row = $(this).closest('tr');
			$(element).closest('.image-box').remove();
			// update json image
			var cell = row.find('.pan-image'),
				color = row.find('.color-round').data('color'),
				hidQuantity = $('#input-quantity-detail'),
				quantityDetail = hidQuantity.val();

			if (hidQuantity.length > 0) {
				var imageList = new Array();
				cell.find('input[type="hidden"]').each(function() {
					var hidInput = $(this);
					if (hidInput.val() != '') {
						var img = {
							name: hidInput.val(),
							url: hidInput.val(),
							order: hidInput.data('order')
						};
						imageList.push(img);
					}
				});
				var productList = JSON.parse(quantityDetail.replace(/_nn_/g, '"'));
				for (var i=0; i<productList.length; i++) {
					if (productList[i].color == color) {
						productList[i].images = imageList;
					}
				}

				var json = JSON.stringify(productList);
				json = json.replace(/"/g, '_nn_');
				hidQuantity.val(json);
			}

			$(element).popover('hide');
		});

		$('#txt-order').on('change', function() {
			var order = $(this).val();
			console.log(order);
		});
	});
	
	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body', html: true});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});

	// my custom script
	Store.run();
});

var Store = {
	init: function() {
		this._sizeOrder = {
			S: 1,
			M: 2,
			L: 3,
			XL: 4,
			XXL: 5,
			XXXL: 6
		};
		this._colorpicker = $('.colorpicker');
		this._panColor = $('#pan-color-row');
		this._btnSave = $('#btn-save-change-quantity');
		this._dialogQuantity = $('#dialog-quantity');
	},

	renderUI: function() {
		var self = this;

		self._colorpicker.each(function() {
			var btnColorPicker = $(this),
				color = btnColorPicker.val();
			btnColorPicker.colorpicker({
				color: color
			});
			btnColorPicker.colorpicker('disable');
		});
	},

	eventHandle: function() {
		var self = this,
			panColor = self._panColor;

		$('.btn-add-color').click(function() {
			self._addColorRow();
			// button save
			self._btnSave.prop('disabled', true);
		});

		// control for select size
		panColor.on('click', '.select-item', function(e) {
			e.preventDefault();
			var item = $(this),
				size = item.text(),
				panSelect = item.closest('.input-group'),
				label = panSelect.find('.select-label');

			label.text(size);
			panSelect.find('li').removeClass('active');
			item.closest('li').addClass('active');
		});

		// control for edit button
		panColor.on('click', '.btn-edit', function() {
			var btn = $(this),
				row = btn.closest('tr'),
				viewSize = row.find('.view-size'),
				size = viewSize.data('size'),
				sizeLabel = viewSize.data('label');

			row.addClass('editing');
			// size
			if (size == viewSize.text()) {
				row.find('.size-label').val('');
			} else {
				row.find('.size-label').val(viewSize.text());
			}			
			row.find('.select-label').text(size);
			row.find('li').each(function() {
				var li = $(this);
				if (li.find('.select-item').text() == size) {
					li.addClass('active');
				} else {
					li.removeClass('active');
				}
			});
			// quantity
			row.find('.edit-quantity').val(row.find('.view-quantity').text());
			// colorpicker
			row.find('.colorpicker').colorpicker('enable');
			// button save
			self._btnSave.prop('disabled', true);

			row.find('.view').addClass('hide');
			row.find('.edit').removeClass('hide');
		});

		// control for cancel button
		panColor.on('click', '.btn-cancel', function() {
			var row = $(this).closest('tr');
			self._cancelEdit(row);						
		});

		// control for delete button
		panColor.on('click', '.btn-delete', function() {
			var conf = window.confirm('Are you sure to delete this item?');
			if (conf) {
				$(this).closest('tr').remove();
				self._updateStatus();
			}
		});

		// control for ok button
		panColor.on('click', '.btn-ok', function() {
			var row = $(this).closest('tr'),
				sizeView = row.find('.view-size'),
				sizeLable = row.find('.size-label'),
				sizeSelect = row.find('.select-label'),
				quantityView = row.find('.view-quantity'),
				quantityEdit = row.find('.edit-quantity'),
				quantity = $.trim(quantityEdit.val()),
				colorpicker = row.find('.colorpicker'),
				image = row.find('.hid-product-image');

			// validate quantity 
			var patternNumber = /^\d*$/;
			if (quantity == '' || !patternNumber.test(quantity) || parseInt(quantity) <= 0) {
				self._showMessage('quantity_incorrect', 'error');
				return;
			}
			// validate duplicate
			var color = colorpicker.val(),
				error = false;
			panColor.find('tr').each(function() {
				var _row = $(this);
				if (!_row.hasClass('editing') && _row.find('.colorpicker').val() == color && (_row.find('.view-size').data('size') == sizeSelect.text() || _row.find('.view-size').data('label') == sizeLable.val())) {
					error = true;
					return false;
				}
			});
			if (error) {
				self._showMessage('product_duplicate', 'error');
				return;
			}

			// disable colorpicker
			colorpicker.colorpicker('disable');
			colorpicker.data('color', color);

			// set value for view size
			if ($.trim(sizeLable.val()) != '') {
				sizeView.text($.trim(sizeLable.val()));
				sizeView.data({
					label: $.trim(sizeLable.val()),
					size: sizeSelect.text()
				});
			} else {
				sizeView.text(sizeSelect.text());
				sizeView.data({
					label: sizeSelect.text(),
					size: sizeSelect.text()
				});
			}

			//set data for view quantity
			quantityView.text(quantity);

			// update this image
			panColor.find('tr').each(function() {
				var __currRow = $(this);
				if (__currRow.find('.colorpicker ').data('color') == colorpicker.val() && __currRow.find('.hid-product-image').val() != '') {
					image.val(__currRow.find('.hid-product-image').val());
				}
			});
			
			row.removeClass('new-row');
			row.removeClass('editing');
			row.find('.edit').addClass('hide');
			row.find('.view').removeClass('hide');
			self._updateStatus();	
		});

		// control for save change button
		self._btnSave.click(function() {
			var json = new Array();

			panColor.find('tr').each(function() {
				var row = $(this),
					obj = {};

				// color
				obj.color = row.find('.colorpicker').val();
				// size
				var size = {
					label: row.find('.view-size').data('label'),
					size: row.find('.view-size').data('size')
				};
				obj.size = size;
				// quantity
				obj.quantity = row.find('.view-quantity').text();
				// image
				var image = row.find('.hid-product-image').val();
				image = JSON.parse(image.replace(/_nn_/g, '"'));
				obj.images = image;

				// push to object
				json.push(obj);
			});

			json = JSON.stringify(json);
			json = json.replace(/"/g, '_nn_');

			// update value of product quantity detail
			$('#input-quantity-detail').val(json);
			// update value of product quantity
			$('#input-quantity').val($('#total-quantity').text());
			self._dialogQuantity.modal('hide');
		});

		// hide dialog change quantity
		self._dialogQuantity.on('hidden.bs.modal', function (e) {
			panColor.find('tr').remove();
		});

		// show dialog change quantity
		self._dialogQuantity.on('show.bs.modal', function (e) {
			var objQuantityDetail = self._getProductDetail(),
				i = 0;

			if (objQuantityDetail.length > 0) {
				for (i = 0; i < objQuantityDetail.length; i += 1) {
					panColor.append(self._makeRow(objQuantityDetail[i], i));
				}
			}

			self._updateStatus();		
		});

		// dismiss error message
		$('button.close').click(function() {
			$(this).closest('.alert').addClass('hide');
		});

		// show quantity detail
		$('.btn-view-quantity-detail').click(function() {
			var btn = $(this),
				cell = btn.closest('td'),
				hidQuantityDetail = $.trim(cell.find('.input-quantity-detail').val()) != '' ? $.trim(cell.find('.input-quantity-detail').val()) : '[]',
				panQuantityDetail = cell.find('.product-quantity-list'),
				quantityDetail = self._getProductDetail(hidQuantityDetail);

			panQuantityDetail.html('');
			if (quantityDetail.length > 0) {
				for (var i=0; i<quantityDetail.length; i++) {
					var currProduct = quantityDetail[i],
						row = $('<tr>'),
						order = $('<td class="text-center">' + (i + 1) + '</td>'),
						color = $('<td>'),
						colorDetail = $('<div>'),
						size = $('<td>' + currProduct.size.size + '</td>'),
						quantity = $('<td class="text-center">' + currProduct.quantity + '</td>');

					colorDetail.css({
						width: '20px',
						height: '20px',
						margin: 'auto',
						backgroundColor: currProduct.color
					});
					if (currProduct.color == '#ffffff') {
						colorDetail.css('border', '1px solid #cccccc');
					}
					colorDetail.addClass('color-round');
					color.append(colorDetail);
					row.append(order, color, size, quantity);
					if (parseInt(currProduct.quantity) <= 0) {
						row.addClass('warning');
					} else if (parseInt(currProduct.quantity) <= 5) {
						row.addClass('danger');
					}
					panQuantityDetail.append(row);
				}
			} else {
				var row = '<tr class="warning"><td class="text-center" colspan="4">No result!</td></tr>';
				panQuantityDetail.append(row);
			}

			// check top position to show
			var ul = btn.closest('.btn-group').find('ul'),
				tblResponsive = btn.closest('.table-responsive');
			if (tblResponsive.height() + tblResponsive.offset().top < (btn.offset().top + ul.height() + 60)) {
				var margin = (btn.offset().top + ul.height() + 60) - (tblResponsive.height() + tblResponsive.offset().top);
				if (ul.is(':visible')) {
					btn.closest('.table').css('marginBottom', '0px');
					btn.closest('tr').find('td').css('borderBottom', 'none');
				} else {
					btn.closest('.table').css('marginBottom', margin + 'px');
					btn.closest('tr').find('td').css('borderBottom', '1px solid #dddddd');	
				}				
			} else if (ul.is(':visible')) {
				btn.closest('.table').css('marginBottom', '0px');
				btn.closest('tr').find('td').css('borderBottom', 'none');
			}
		});

		// control for dropup
		$(document).click(function() {
			var dropup = $(this).find('.btn-view-quantity-detail');
	        dropup.closest('.table').css('marginBottom', '0px');
	        dropup.closest('tr').find('td').css('borderBottom', 'none');
	    });

		// change order of image
		$(document).on('click', '.order-item', function(e) {
			var item = $(this),
				row = item.closest('tr'),
				panImage = item.closest('.pan-image'),
				from = item.closest('.image-box'),
				fromOrder = parseInt(from.find('input[type="hidden"]').data('order')),
				targetOrder = parseInt(item.find('a').text()),
				target;

			if (item.hasClass('active')) {
				return
			}
			
			// change order of image
			panImage.find('.image-box').each(function() {
				var currImage = $(this),
					currImageOrder = parseInt(currImage.find('input[type="hidden"]').data('order'));

				if (currImageOrder == targetOrder) {
					if (fromOrder < targetOrder) {
						currImage.after(from.clone());	
					} else {
						currImage.before(from.clone());
					}
					
					from.remove();
				}
			});
			var n = 0;
			panImage.find('.image-box').each(function() {
				n += 1;
				$(this).find('input[type="hidden"]').data('order', n).attr('data-order', n);
			});			
			panImage.find('.popover').remove();
			// update json image
			var cell = row.find('.pan-image'),
				color = row.find('.color-round').data('color'),
				hidQuantity = $('#input-quantity-detail'),
				quantityDetail = hidQuantity.val();

			if (hidQuantity.length > 0) {
				var imageList = new Array();
				cell.find('input[type="hidden"]').each(function() {
					var hidInput = $(this);
					if (hidInput.val() != '') {
						var img = {
							name: hidInput.val(),
							url: hidInput.val(),
							order: hidInput.data('order')
						};
						imageList.push(img);
					}
				});
				var productList = JSON.parse(quantityDetail.replace(/_nn_/g, '"'));
				for (var i=0; i<productList.length; i++) {
					if (productList[i].color == color) {
						productList[i].images = imageList;
					}
				}

				var json = JSON.stringify(productList);
				json = json.replace(/"/g, '_nn_');
				hidQuantity.val(json);
			}
		});

		// control for show image tab
		$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
			if ($(e.target).attr('href') != '#tab-image') {
				return;
			}

			var quantityDetail = self._getProductDetail(),
				panImageColor = $('#pan-image-of-color'),
				colorList = new Array(),
				colorInTable = new Array();

			if (quantityDetail.length > 0) {
				// get color form json
				for (var i = 0; i < quantityDetail.length; i++) {
					var currColor = quantityDetail[i].color;
					if (colorList.indexOf(currColor) < 0) {
						colorList.push(currColor);
					}
				}

				// get color from table image
				panImageColor.find('.color-round').each(function() {
					var colorRow = $(this),
						color = colorRow.data('color');

					if (colorList.indexOf(color) < 0) {
						colorRow.closest('tr').remove();
					} else {
						colorInTable.push(color);
					}
				});

				// add new color to table
				if (colorList.length > 0) {
					for (var i = 0; i < colorList.length; i++) {
						var currColorInlist = colorList[i];
						if (colorInTable.indexOf(currColorInlist) >= 0) {
							continue;
						}

						var newColorRow = $('<tr>'),
							order = $('<td class="text-center">' + (colorInTable.length + i + 1) + '</td>'),
							colorCell = $('<td>'),
							colorView = $('<div class="color-round" data-color="' + currColorInlist + '"></div>'),
							image = $('<td class="pan-image"></td>'),
							button = $('<td><button type="button" onclick="addImage(this);" class="btn btn-primary" data-toggle="tooltip" title="" data-original-title="Add image"><span class="glyphicon glyphicon-plus-sign"></span></button></td>');
						
						colorView.css({
							width: '45px',
							height: '45px',
							margin: 'auto',
							backgroundColor: currColorInlist
						});
						if (currColorInlist == '#ffffff') {
							colorView.css('border', '1px solid #cccccc');
						}
						colorCell.append(colorView);
						newColorRow.append(order, colorCell, image, button);
						panImageColor.append(newColorRow);
					}
				}				
			}			
		});

		// control for button add zone
		$('#btn-add-zone').click(function() {
			var tableZone = $('#pan-table-zone'),
				newZone = $('<tr>'),
				zoneOrder = $('<td class="text-center">' + (tableZone.find('tr').length + 1) + '</td>'),
				zoneName = $('<td class="form-group"><input type="text" name="maguss_zone[name][]" class="form-control zone-name" placeholder="Zone name..."></td>'),
				zoneCost = $('<td class="form-group"><input type="text" name="maguss_zone[cost][]"  class="form-control zone-cost" placeholder="Cost" value="0"></td>'),
				zoneControl = $('<td class="text-center"><button type="button" class="btn btn-danger btn-sm btn-delete-zone"><span class="glyphicon glyphicon-trash"></span></button></td>');

			newZone.append(zoneOrder, zoneName, zoneCost, zoneControl);
			tableZone.append(newZone);
		});
		// control for button delete zone
		$('#pan-table-zone').on('click', '.btn-delete-zone', function() {
			var btn = $(this),
				conf = window.confirm(self._getMessage('confirm_delete_zone'));

			if (conf) {
				btn.closest('tr').remove();
			}

			var n = 0;
			$('#pan-table-zone').find('tr').each(function() {
				n += 1;
				$(this).find('td').first().text(n);
			});
		});
		// validate zone
		$('#form-maguss').submit(function(e) {
			var panTableZone = $('#pan-table-zone');
			panTableZone.find('.form-group').removeClass('has-error');
			panTableZone.find('.help-block').remove();
			$('#pan-table-zone').find('tr').each(function() {
				var row = $(this),
					zoneName = row.find('.zone-name'),
					name = $.trim(zoneName.val()),
					zoneCost = row.find('.zone-cost'),
					cost = $.trim(zoneCost.val()),
					numberRex = /^\d+$/;

				if (name == '') {
					e.preventDefault();
					zoneName.closest('.form-group').addClass('has-error');
					zoneName.after('<span class="help-block">' + self._getMessage('zone_name_invalid') + '</span>');
					return false;
				}

				if (name != '' && !numberRex.test(cost)) {
					e.preventDefault();
					zoneCost.closest('.form-group').addClass('has-error');
					zoneCost.after('<span class="help-block">' + self._getMessage('zone_cost_invalid') + '</span>');
					return false;
				}
			});			
		});
	},

	_addColorRow: function() {
		var self = this,
			panColorRow = self._panColor,
			numRow = panColorRow.find('tr').length + 1,
			newRow = $('<tr>'),
			order = $('<td>'),
			color = $('<td>'),
			size = $('<td>'),
			quantity = $('<td>'),
			control = $('<td>'),
			image = $('<input type="hidden" class="hid-product-image" value="[]">'),
			_colorpicker = $('<input type="hidden" class="colorpicker" value="#ffffff" data-color="#ffffff">'),
			_sizeView = $('<span class="view view-size hide"></span>'),
			_sizeEdit = self._getProductSize(),
			_quantityView = $('<span class="view hide view-quantity"></span>'),
			_quantityEdit = $('<input type="text" class="form-control input-sm w110 edit edit-quantity" placeholder="Quantity" value="">'),
			_btnEdit = $('<button type="button" class="btn-edit view btn btn-xs btn-default hide"><span class="glyphicon glyphicon-pencil"></span></button>'),
			_btnDelete = $('<button type="button" class="btn-delete view btn btn-xs btn-default hide"><span class="glyphicon glyphicon-trash"></span></button>'),
			_btnCancel = $('<button type="button" class="btn-cancel edit btn btn-xs btn-default"><span class="glyphicon glyphicon-remove"></span></button>'),
			_btnOk = $('<button type="button" class="btn-ok edit btn btn-xs btn-primary"><span class="glyphicon glyphicon-ok"></span></button>');

		control.addClass('text-right row-control');

		order.html(numRow);
		color.append(_colorpicker);
		size.addClass('mw180 word-break');
		size.append(_sizeView, _sizeEdit);
		quantity.addClass('mw130 word-break');
		quantity.append(_quantityView, _quantityEdit);
		control.append(_btnEdit, _btnDelete, _btnCancel, _btnOk);

		newRow.append(order, color, size, quantity, control, image);
		newRow.addClass('new-row editing');
		newRow.find('.colorpicker').colorpicker({
			color: "#ffffff"
		});

		panColorRow.append(newRow);
	},

	_makeRow: function(data) {
		var self = this,
			newRow = $('<tr>'),
			order = $('<td>'),
			color = $('<td>'),
			size = $('<td>'),
			quantity = $('<td>'),
			control = $('<td>'),
			image = $('<input type="hidden" class="hid-product-image">'),
			_colorpicker = $('<input type="hidden" class="colorpicker" value="' + data.color + '" data-color="' + data.color + '">'),
			_sizeView = $('<span class="view view-size" data-label="' + data.size.label + '" data-size="' + data.size.size + '">' + data.size.label + '</span>'),
			_sizeEdit = self._getProductSize(),
			_quantityView = $('<span class="view view-quantity">' + data.quantity + '</span>'),
			_quantityEdit = $('<input type="text" class="form-control input-sm w110 edit edit-quantity hide" placeholder="Quantity" value="' + data.quantity + '">'),
			_btnEdit = $('<button type="button" class="btn-edit view btn btn-xs btn-default"><span class="glyphicon glyphicon-pencil"></span></button>'),
			_btnDelete = $('<button type="button" class="btn-delete view btn btn-xs btn-default"><span class="glyphicon glyphicon-trash"></span></button>'),
			_btnCancel = $('<button type="button" class="btn-cancel edit btn btn-xs btn-default hide"><span class="glyphicon glyphicon-remove"></span></button>'),
			_btnOk = $('<button type="button" class="btn-ok edit btn btn-xs btn-primary hide"><span class="glyphicon glyphicon-ok"></span></button>');

		control.addClass('text-right row-control');

		// active size select
		_sizeEdit.find('.select-label').text(data.size.size);
		_sizeEdit.find('li').each(function() {
			var item = $(this);
			if (item.find('.select-item').text() == data.size.size) {
				item.addClass('active');
			} else {
				item.removeClass('active');
			}
		});

		color.append(_colorpicker);
		size.addClass('mw180 word-break');
		size.append(_sizeView, _sizeEdit);
		quantity.addClass('mw130 word-break');
		quantity.append(_quantityView, _quantityEdit);
		control.append(_btnEdit, _btnDelete, _btnCancel, _btnOk);

		var imageData = JSON.stringify(data.images);
		image.val(imageData.replace(/"/g, '_nn_'));

		newRow.append(order, color, size, quantity, control, image);
		newRow.find('.edit').addClass('hide');
		newRow.find('.view').removeClass('hide');
		newRow.find('.colorpicker').colorpicker({
			color: data.color
		});
		newRow.find('.colorpicker').colorpicker('disable');

		return newRow;
	},

	_cancelEdit: function(row) {
		var self = this,
			panColor = self._panColor,
			colorpicker = row.find('.colorpicker');

		row.removeClass('editing');
		colorpicker.colorpicker('disable');
		colorpicker.colorpicker('val', colorpicker.data('color'));
		if (row.hasClass('new-row')) {
			row.remove();
			self._updateStatus();
		} else {
			row.find('.edit').addClass('hide');
			row.find('.view').removeClass('hide');

			var li = row.find('li');
			li.removeClass('active');
			li.first().addClass('active');
			row.find('.select-label').text(li.first().find('.select-item').text());
			row.find('input[type="text"]').val('');
		}
		// button save
		if (panColor.find('.editing').length <= 0) {
			self._btnSave.prop('disabled', false);
		}
		// error message
		self._hideMessage();
	},

	_updateStatus: function() {
		var self = this,
			quantity = 0,
			colorList = new Array();
		self._panColor.find('tr').each(function(order) {
			var row = $(this),
				color = row.find('.colorpicker').colorpicker('val');
				
			if (colorList.indexOf(color) < 0) {
				colorList.push(color);
			}

			quantity += parseInt(row.find('.view-quantity').text());
			row.find('td').first().text(order + 1);
		});
		$('#total-quantity').text(quantity);
		$('#total-color').text(colorList.length);

		// button save
		if (self._panColor.find('.editing').length <= 0) {
			self._btnSave.prop('disabled', false);
		}
		self._hideMessage();
	},

	_getProductSize: function() {
		var listSize = $('#hidListSize').clone();
		listSize.removeAttr('id');
		
		return listSize;
	},

	_getProductDetail: function(quantityDetail) {
		var self = this;

		if (quantityDetail === undefined) {
			quantityDetail = $('#input-quantity-detail').val();
		}

		if (quantityDetail === null || $.trim(quantityDetail) == '') {
			quantityDetail = '[]';
		}

		// sort product by color
		var productList = JSON.parse(quantityDetail.replace(/_nn_/g, '"')),
			colorOrdered = new Array();
			productOrdered = new Array();
		if (productList.length > 0) {
			for (var i = 0; i < productList.length; i++) {
				var product = productList[i],
					productByColor = new Array();
				if (colorOrdered.indexOf(product.color) < 0) {
					colorOrdered.push(product.color);
					for (var j = 0; j < productList.length; j++) {
						var currProduct = productList[j];
						if (currProduct.color == product.color) {
							productByColor.push(currProduct);
						}
					};

					// sort by size
					if (productByColor.length > 0) {
						var productBySize = self._sortProductSize(productByColor);
						for (var tmpProduct in productBySize) {
							productOrdered.push(productBySize[tmpProduct]);
						}
					} else {
						productOrdered.push(product);
					}
				}				
			};
		}

		return productOrdered;
	},

	_sortProductSize: function(productList) {
		var self = this,
			productOrdered = new Array();

		for (var i=0; i < productList.length; i++) {
			var currProduct = productList[i],
				size = currProduct.size.size;
			productOrdered[self._sizeOrder[size]] = currProduct;
		}

		return productOrdered;
	},

	_showMessage: function(msgKey, type) {
		var self = this,
			panMsg = $('#quantity-msg'),
			msgType = panMsg.find('.msg-type'),
			msgContent = panMsg.find('.msg-content'),
			msg = self._getMessage(msgKey);

		if (type == 'error') {
			panMsg.removeClass('alert-warning').addClass('alert-danger');
			msgType.html(self._getMessage('error_text'));
		} else {
			panMsg.removeClass('alert-danger').addClass('alert-warning');
			msgType.html(self._getMessage('warning_text'));
		}
		msgContent.html(msg);
		panMsg.removeClass('hide');
	},

	_hideMessage: function() {
		$('#quantity-msg').addClass('hide');
	},

	_getMessage: function(key) {
		return $('#' + key).val();
	},

	run: function() {
		this.init();
		this.renderUI();
		this.eventHandle();
	}
};

// Autocomplete */
(function($) {
	$.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();
	
			$.extend(this, option);
	
			$(this).attr('autocomplete', 'off');
			
			// Focus
			$(this).on('focus', function() {
				this.request();
			});
			
			// Blur
			$(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);				
			});
			
			// Keydown
			$(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}				
			});
			
			// Click
			this.click = function(event) {
				event.preventDefault();
	
				value = $(event.target).parent().attr('data-value');
	
				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}
			
			// Show
			this.show = function() {
				var pos = $(this).position();
	
				$(this).siblings('ul.dropdown-menu').css({
					top: pos.top + $(this).outerHeight(),
					left: pos.left
				});
	
				$(this).siblings('ul.dropdown-menu').show();
			}
			
			// Hide
			this.hide = function() {
				$(this).siblings('ul.dropdown-menu').hide();
			}		
			
			// Request
			this.request = function() {
				clearTimeout(this.timer);
		
				this.timer = setTimeout(function(object) {
					object.source($(object).val(), $.proxy(object.response, object));
				}, 200, this);
			}
			
			// Response
			this.response = function(json) {
				html = '';
	
				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}
	
					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}
	
					// Get all the ones with a categories
					var category = new Array();
	
					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}
	
							category[json[i]['category']]['item'].push(json[i]);
						}
					}
	
					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';
	
						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}
	
				if (html) {
					this.show();
				} else {
					this.hide();
				}
	
				$(this).siblings('ul.dropdown-menu').html(html);
			}
			
			$(this).after('<ul class="dropdown-menu"></ul>');
			$(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));	
			
		});
	}
})(window.jQuery);
