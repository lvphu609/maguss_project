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
	// Adding the clear Fix
	cols1 = $('#column-right, #column-left').length;
	
	if (cols1 == 2) {
		//$('#content .product-layout:nth-child(2n+2)').after('<div class="clearfix visible-md visible-sm"></div>');
	} else if (cols1 == 1) {
		//$('#content .product-layout:nth-child(3n+3)').after('<div class="clearfix visible-lg"></div>');
	} else {
		//$('#content .product-layout:nth-child(4n+4)').after('<div class="clearfix"></div>');
	}
	
	// Highlight any found errors
	$('.text-danger').each(function() {
		var element = $(this).parent().parent();
		
		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});
		
	// Currency
	$('#currency .currency-select').on('click', function(e) {
		e.preventDefault();

		$('#currency input[name=\'code\']').attr('value', $(this).attr('name'));

		$('#currency').submit();
	});

	// Language
	$('#language a').on('click', function(e) {
		e.preventDefault();

		$('#language input[name=\'code\']').attr('value', $(this).attr('href'));

		$('#language').submit();
	});

	/* Search */
	$('#search input[name=\'search\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';

		var value = $('header input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	$('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('header input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	$('#menu .dropdown-menu').each(function() {
		var menu = $('#menu').offset();
		var dropdown = $(this).parent().offset();

		var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());

		if (i > 0) {
			$(this).css('margin-left', '-' + (i + 5) + 'px');
		}
	});

	// Product List
	$('#list-view').click(function() {
		$('#content .product-layout > .clearfix').remove();

		$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	$('#grid-view').click(function() {
		$('#content .product-layout > .clearfix').remove();

		// What a shame bootstrap does not take into account dynamically loaded columns
		cols = $('#column-right, #column-left').length;

		if (cols == 2) {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			$('#content .product-layout').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		 localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	} else {
		$('#grid-view').trigger('click');
	}

	// tooltips on hover
	$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});

	// Makes tooltips work on ajax generated content
	$(document).ajaxStop(function() {
		$('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1) + '&size=' + $('#hid-product-size').val() + '&color=' + $('#hid-product-color').val(),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			success: function(json) {
				$('.alert, .text-danger').remove();

				$('#cart > button').button('reset');

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#cart-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow');

					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	},
	'update': function(key, quantity) {
		$.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			success: function(json) {
				$('#cart > button').button('reset');

				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
                /*var panControl =$('#btn-control-' + key);
				panControl.prop('disabled', true);
				panControl.find('.btn-delete-product').addClass('loading');*/
			},
			success: function(json) {
				$('#cart > button').button('reset');

				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		$.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				$('#cart > button').button('loading');
			},
			complete: function() {
				$('#cart > button').button('reset');
			},
			success: function(json) {
				$('#cart-total').html(json['total']);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					$('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				if (json['info']) {
					$('#content').parent().before('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				$('#wishlist-total').html(json['total']);

				$('html, body').animate({ scrollTop: 0 }, 'slow');
			}
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		$.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				$('.alert').remove();

				if (json['success']) {
					$('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					$('#compare-total').html(json['total']);

					$('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			}
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
$(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	$('#modal-agree').remove();

	var element = this;

	$.ajax({
		url: $(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal fade">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title" style="font-size:18px; font-weight:bold;"> ĐIỀU KHOẢN VÀ ĐIỀU KIỆN</h4>';//' + $(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			$('body').append(html);

			$('#modal-agree').modal('show');
		}
	});
});

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


$(document).ready(function(){
	Maguss.run();
});

var Maguss = {
	stickyMenuTop: function(){
		$(window).load(function(){
      		$(".mn-bottom").sticky({ topSpacing: 0 });
      		// $("#custom-search-input").sticky({ topSpacing: 0 });
      		$('.mn-bottom').on('sticky-start', function() { 
      			$('#input_search_sticky').show();
      			$('#logo_sticky_maguss').show();
      		});    

      		$('.mn-bottom').on('sticky-end', function() { 
      			$('#input_search_sticky').hide();
      			$('#logo_sticky_maguss').hide();
      		});      		
    	});
	},
	hoverMenuTopItem: function(){
		var that = this;
		$('.mn-top-logo').tooltip({
		    items: '.mn-top-logo .mn-top-item',
		    content: function()
		    {
		        var $this = $(this);
		        var content = $this.find('.sub-menu-content').html();
		        return content;
		    },
		    tooltipClass:"ui-tooltip-content-menu-top",
		    show: null, // show immediately
    		extraClass:"i1",
		    open: function(event, ui)
		    {
		    	var that = this;
		        if (typeof(event.originalEvent) === 'undefined')
		        {
		            return false;
		        }
		        
		        var $id = $(ui.tooltip).attr('id');
		        $('#' + $id).css({
		        	"with" : "1000px",
		        	"opacity" : ".97"
		        });
		        // close any lingering tooltips
		        $('div.ui-tooltip').not('#' + $id).remove();
		        
		        ui.tooltip.css({ top: ui.tooltip.position().top - 14 });
		        // ajax function to pull in data and add it to the tooltip goes here
		    },
		    close: function(event, ui)
		    {
		        ui.tooltip.hover(function()
		        {
		            $(this).stop(true).fadeTo(1, 1); 
		        },
		        function()
		        {
		            $(this).fadeOut('1', function()
		            {
		                $(this).remove();
		            });
		        });
		    }
		});
	},
	clickColor: function(){
		var that = this;
		//product item
		$('.popper_color').popover({
	      placement: 'top',
	      container: 'body',
	      html: true,
	      trigger: 'click',
	      content: function () {
	          var colorSet = $(this).attr('data-color');
	          var content = "";
	          if(typeof colorSet != "undefined"){
	          	$(this).closest('.product-thumb').find('.popper-color-content').find('.color-item').removeClass('active');
	          	content = $(this).closest('.product-thumb').find('.popper-color-content').find('.color-item');
	          	$.each(content,function(key,div){
	          		if($(div).attr('data-color') == colorSet){
	          			$(div).addClass('active');
	          		}
	          	});
	          }
	          content = $(this).closest('.product-thumb').find('.popper-color-content').html();
	          return content;
	      }
		});

		$(document).on('click','.color-item',function(){
			var groupColorImage = $(this).find('.group-color').html(),
				currColor = $(this).data('color');

			$('.'+$(this).attr('data-root')).attr('data-color', currColor);
			$(this).closest('.popover-content').find('.color-item').removeClass('active');
			$(this).addClass('active');

			var imageUrl = $(this).attr('data-url');
			var productId = $(this).attr('data-root');
			var imageLoaderHtml = $('#image_loader').html();
			var divImage = $('.product-thumb.'+productId).find('.image');
			divImage.find('img').hide();
			divImage.append(imageLoaderHtml);
			//check url
			that.imageExists(imageUrl, function(exists) {
			  if(exists){
			  	divImage.find('img').attr('src',imageUrl);
			  	divImage.find('img').show();
			  }
			});

		});

		//product detail
		$('.popper_color_detail').popover({
	      placement: 'bottom',
	      container: 'body',
	      html: true,
	      trigger: 'click',
	      content: function () {
	          //return $(this).parent().parent().find('.popper-color-content').html();
	          return $('.popper-color-content').html();
	      }
		});
		//product detail
		$('.popper_color_detail_lg').popover({
	      placement: 'bottom',
	      container: 'body',
	      html: true,
	      trigger: 'click',
	      content: function () {
	          return $(this).parent().parent().find('.popper-color-content-lg').html();
	      }
		});
		$(document).on('click','.color-item-product-detail',function(){
			var groupColorImage = $(this).find('.group-color').html(),
				currColor = $(this).data('color');

			$(this).closest('.popper_color_detail').data('color', currColor);
			$(this).closest('.group-color-product').find('.color-item-product-detail').removeClass('active');
			$(this).addClass('active');

			var quantityDetail = $('#hid-quantity-detail').text(),
				productDetailSize = $('.product-detail-size'),
				panSizeSelect = productDetailSize.find('.pan-select-size'),
				sizeList = productDetailSize.find('ul'),
				keepCurrSize = false;

			quantityDetail = JSON.parse(quantityDetail);
			sizeList.html('');
			if (quantityDetail.length > 0) {
				for (var i = 0; i < quantityDetail.length; i++) {
					if (quantityDetail[i].color == currColor) {
						var itemActive = '';
						if (panSizeSelect.text() != '' && quantityDetail[i].size.label == panSizeSelect.text()) {
							keepCurrSize = true;
							itemActive = 'class="active"';
						}
						var li = $('<li ' + itemActive + '><a href="#" class="size-item">' + quantityDetail[i].size.label + '</a></li>');
						sizeList.append(li);
					}
				}
				if (!keepCurrSize) {
					panSizeSelect.text('');
				}
			}

			// append new image
			$('#box-product-image').html(groupColorImage);
		});

		$(document).on('click','.color-item-product-detail-lg',function(){			
			var groupColorImage = $(this).find('.group-color').html(),
				currColor = $(this).data('color');

			$('.popper_color_detail_lg').data('color', currColor);
			$(this).closest('.group-color-product').find('.color-item-product-detail-lg').removeClass('active');
			$(this).addClass('active');

            $('#hid-product-color').val(currColor);

			var quantityDetail = $('#hid-quantity-detail').text(),
				productDetailSize = $('.pro-option-select-size'),
				panSizeSelect = productDetailSize.find('.pan-select-size'),
				sizeList = productDetailSize,
				keepCurrSize = false;

			quantityDetail = JSON.parse(quantityDetail);
			sizeList.html('');
			if (quantityDetail.length > 0) {
				var option = '<option value="">Size</option>';
				for (var i = 0; i < quantityDetail.length; i++) {
					if (quantityDetail[i].color == currColor) {
						var itemActive = '';
						if (panSizeSelect.text() != '' && quantityDetail[i].size.label == panSizeSelect.text()) {
							keepCurrSize = true;
							itemActive = 'selected';
                            $('#hid-product-size').val(quantityDetail[i].size.label);
						}
						option +=  '<option ' + itemActive + ' value="'+quantityDetail[i].size.size+'" data-size="' + quantityDetail[i].size.size + '">'+quantityDetail[i].size.label+'</option>';
					}
				}
				sizeList.append(option);
				if (!keepCurrSize) {
					panSizeSelect.text('');
                    $('#hid-product-size').val('');
				}
			}

			// append new image
			$('#box-product-image-lg').html(groupColorImage);
			/*$('.img-first').magnificPopup({
		      type:'image',
		      delegate: 'a',
		      gallery: {
		        enabled:true
		      },
		        callbacks: {
		          open: function() {
		           $('.mfp-figure').zoom({
		              touch: true,
		              on: 'mouseover'
		              // url: 'https://nodogaboutit.files.wordpress.com/2012/10/j04310181.jpg'
		            });
		         }
		        }
		    });*/
			that.scrollImage();
		    that.zoomImage();

		});

		$('.popper_color_detail').click(function() {
			var color = $(this).data('color'),
				allColor = $(document).find('.color-item-product-detail');

			if (color != undefined) {
				allColor.removeClass('active');	
			}
			
			allColor.each(function() {
				if ($(this).data('color') == color) {
					$(this).addClass('active');
				}
			});
		});
		/*
		$(document).on('click', '.size-item', function(e) {
			e.preventDefault();
			var a = $(this),
				panSizeSelect = a.closest('.product-detail-size'),			
				size = a.text(),
				sizeSelected = panSizeSelect.find('.pan-select-size');

			panSizeSelect.find('li').removeClass('active');
			a.closest('li').addClass('active');
			sizeSelected.text(size);
            $('#hid-product-size').val(a.data('size'));
		});*/
		
	},
	imageExists: function(url, callback) {
	  var img = new Image();
	  img.onload = function() { callback(true); };
	  img.onerror = function() { callback(false); };
	  img.src = url;
	},
	closePoperEvent: function(){
		var that = this;
		$(document).mouseup(function (e)
		{
		    var container = $(".popover.fade.top.in");

		    if (!container.is(e.target) // if the target of the click isn't the container...
		        && container.has(e.target).length === 0) // ... nor a descendant of the container
		    {
		        $('[data-toggle="popover"]').each(function () {
			        if (!$(this).is(e.target) && $(this).has(e.target).length === 0 && $('.popover').has(e.target).length === 0) {
			            $(this).popover('hide');
			        }
			    });
		    }
		});
		//$('.popover.fade.top.in').hide();
	},
	doEventProductDetail: function(){
		$(document).on('click','.img-lg-item',function(e){
			e.preventDefault();
			var url = $(this).find('img').attr('src');
			var urlLag = $(this).find('img').attr('data-large');
			$('#box-product-image-lg').find('.img-lg-append').attr('src',url);
			$('#box-product-image-lg').find('.img-lg-append').attr('data-large',urlLag);
			$('#box-product-image-lg').find('.img-lg-append-a').attr('href',url);
			/*$('.mfp-figure').zoom({
	 			touch: true,
              	on: 'mouseover'});
			that.clickColor();*/
		});	
		/*zoomrange: [1, 12],
		 zoomstart: 4,
		 innerzoom: true,
		 magnifierborder: "none"
*/	},
	zoomImage: function(){
		$('.zoom-image-product').imagezoomsl({
			zoomrange: [3, 3],
			magnifierborder: '1px solid #63c6c1',
			cursorshadeborder: '1px solid #63c6c1',
            magnifycursor: 'zoom-in',
            descarea: ".box-info-product-detail"
		});
        $('.pro-box-image').mouseenter(function() {
            $(document).find('select').blur();
        });
	},
	scrollImage: function(){
		var that = this;
		var imgAdditional = $("#carouselv").find('.img-additional');
		
		$('#carouselv').jsCarousel({ 
			onthumbnailclick: function(src) { 
            //alert(src); 
        	}, 
        	scrollspeed: 500,
        	autoscroll: false, 
        	circular: false, 
        	masked: false, 
        	itemstodisplay: 4, 
        	orientation: 'v' 
        });

        if(imgAdditional.length > 4){
			that.hoverScrollImage();
		}
		$("#box-product-image-lg").css({"display":"block"});
		$('.jscarousal-contents-vertical .visible .img-additional .img-lg-item').first().trigger('click');
		
		//delete image the same
		var divItem = $('.box-item-image.jscarousal-contents-vertical').children();
		if(divItem.length >= 2){
			var lastArr = [];
			$.each($(divItem[divItem.length-1]).find('img'), function(index,img){
				lastArr.push($(img).attr('src'));
			});

			//check image exist
			for(var i=0; i<divItem.length-1;i++){
				$.each($(divItem[i]).find('img'), function(index,img){
					if(jQuery.inArray($(img).attr('src'), lastArr)!==-1){
						$(img).closest('div').remove();
					}
				});
			}
			var reDivItem = $('.box-item-image.jscarousal-contents-vertical').children();
			for(var i=0; i<reDivItem.length-1;i++){
				var strTemp = $(reDivItem[i]).html();
				reDivItem[i].remove();
				$('.box-item-image.jscarousal-contents-vertical').prepend('<div class="img-additional" style="cursor: pointer;">' +strTemp+'</div>');
			}
		}
	},
	hoverScrollImage: function(){
		$("#carouselv").hover(function(){
                $(".jscarousal-vertical-back").show();
                $(".jscarousal-vertical-forward").show();
            }, function(){
                $(".jscarousal-vertical-back").hide();
                $(".jscarousal-vertical-forward").hide();
            });
	},
	commentFaceBook: function(){
		$(document).on('click','.lable-link-facebook-comment',function(){
			var dataOpen = $(this).attr('data-open');
			if(parseInt(dataOpen) == 0){
				$('.facebook-comment').show();
				$(this).attr("data-open","1");
			}else{
				$('.facebook-comment').hide();
				$(this).attr("data-open","0");
			}
			(function(d, s, id) {
              var js, fjs = d.getElementsByTagName(s)[0];
              if (d.getElementById(id)) return;
              js = d.createElement(s); js.id = id;
              js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.3";
              fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));
		});
	},
	run: function(){
		this.stickyMenuTop();	
		this.hoverMenuTopItem();
		this.clickColor();
		this.closePoperEvent();
		this.doEventProductDetail();
		this.zoomImage();
		this.scrollImage();
		this.commentFaceBook();
	}
}