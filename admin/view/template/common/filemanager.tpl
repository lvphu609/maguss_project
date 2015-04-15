<div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title"><?php echo $heading_title; ?></h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-sm-5"><a href="<?php echo $parent; ?>" data-toggle="tooltip"
                                         title="<?php echo $button_parent; ?>" id="button-parent"
                                         class="btn btn-default"><i class="fa fa-level-up"></i></a> <a
                        href="<?php echo $refresh; ?>" data-toggle="tooltip" title="<?php echo $button_refresh; ?>"
                        id="button-refresh" class="btn btn-default"><i class="fa fa-refresh"></i></a>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_upload; ?>" id="button-upload"
                            class="btn btn-primary"><i class="fa fa-upload"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_folder; ?>" id="button-folder"
                            class="btn btn-default"><i class="fa fa-folder"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" id="button-delete"
                            class="btn btn-danger"><i class="fa fa-trash-o"></i></button>
                </div>
                <div class="col-sm-7">
                    <div class="input-group">
                        <input type="text" name="search" value="<?php echo $filter_name; ?>"
                               placeholder="<?php echo $entry_search; ?>" class="form-control">
            <span class="input-group-btn">
            <button type="button" data-toggle="tooltip" title="<?php echo $button_search; ?>" id="button-search"
                    class="btn btn-primary"><i class="fa fa-search"></i></button>
            </span></div>
                </div>
            </div>
            <hr/>
            <?php foreach (array_chunk($images, 4) as $image) { ?>
                <div class="row">
                    <?php foreach ($image as $image) { ?>
                        <div class="col-sm-3 text-center">
                            <?php if ($image['type'] == 'directory') { ?>
                                <div class="text-center"><a href="<?php echo $image['href']; ?>" class="directory"
                                                            style="vertical-align: middle;"><i
                                            class="fa fa-folder fa-5x"></i></a></div>
                                <label>
                                    <input type="checkbox" name="path[]" value="<?php echo $image['path']; ?>"/>
                                    <?php echo $image['name']; ?></label>
                            <?php } ?>
                            <?php if ($image['type'] == 'image') { ?>
                                <a href="<?php echo $image['href']; ?>" class="thumbnail"><img
                                        src="<?php echo $image['thumb']; ?>" alt="<?php echo $image['name']; ?>"
                                        title="<?php echo $image['name']; ?>"/></a>
                                <label>
                                    <input type="checkbox" name="path[]" value="<?php echo $image['path']; ?>"/>
                                    <?php echo $image['name']; ?></label>
                            <?php } ?>
                        </div>
                    <?php } ?>
                </div>
                <br/>
            <?php } ?>

            <div id="upload-progress" class="hide" style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; background-color: rgba(100, 100, 100, .8); z-index: 99999;">
                <table style="width: 80%; height: 100%; margin: auto;">
                    <tr>
                        <td style="vertical-align: middle;">
                            <div class="progress">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">0%</div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="modal-footer"><?php echo $pagination; ?></div>
    </div>
</div>
<script type="text/javascript"><!--
    $('a.thumbnail').on('click', function (e) {
        e.preventDefault();

        <?php if ($thumb) { ?>
        $('#<?php echo $thumb; ?>').find('img').attr('src', $(this).find('img').attr('src'));
        <?php } ?>

        <?php if ($target) { ?>
        $('#<?php echo $target; ?>').attr('value', $(this).parent().find('input').attr('value'));
        <?php } else { ?>
        var range, sel = document.getSelection();

        if (sel.rangeCount) {
            var img = document.createElement('img');
            img.src = $(this).attr('href');

            range = sel.getRangeAt(0);
            range.insertNode(img);
        }
        <?php } ?>

        // update json image
        var row = $('#<?php echo $thumb; ?>').closest('tr'),
            cell = row.find('.pan-image'),
            color = row.find('.color-round').data('color'),
            hidQuantity = $('#input-quantity-detail'),
            quantityDetail = hidQuantity.val();

        if (hidQuantity.length > 0) {
            var imageList = new Array();
            cell.find('input[type="hidden"]').each(function () {
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
            for (var i = 0; i < productList.length; i++) {
                if (productList[i].color == color) {
                    productList[i].images = imageList;
                }
            }

            var json = JSON.stringify(productList);
            json = json.replace(/"/g, '_nn_');
            hidQuantity.val(json);
        }


        $('#modal-image').modal('hide');
    });

    $('a.directory').on('click', function (e) {
        e.preventDefault();

        $('#modal-image').load($(this).attr('href'));
    });

    $('.pagination a').on('click', function (e) {
        e.preventDefault();

        $('#modal-image').load($(this).attr('href'));
    });

    $('#button-parent').on('click', function (e) {
        e.preventDefault();

        $('#modal-image').load($(this).attr('href'));
    });

    $('#button-refresh').on('click', function (e) {
        e.preventDefault();

        $('#modal-image').load($(this).attr('href'));
    });

    $('#button-search').on('click', function () {
        var url = 'index.php?route=common/filemanager&token=<?php echo $token; ?>&directory=<?php echo $directory; ?>';

        var filter_name = $('input[name=\'search\']').val();

        if (filter_name) {
            url += '&filter_name=' + encodeURIComponent(filter_name);
        }

        <?php if ($thumb) { ?>
        url += '&thumb=' + '<?php echo $thumb; ?>';
        <?php } ?>

        <?php if ($target) { ?>
        url += '&target=' + '<?php echo $target; ?>';
        <?php } ?>

        $('#modal-image').load(url);
    });
    //--></script>
<script type="text/javascript"><!--
    $('#button-upload').on('click', function () {
        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file[]" value="" multiple="multiple" /></form>');

        $('#form-upload input[name=\'file[]\']').trigger('click');

        timer = setInterval(function () {
            if ($('#form-upload input[name=\'file[]\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=common/filemanager/upload&token=<?php echo $token; ?>&directory=<?php echo $directory; ?>',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function () {
                        $('#button-upload i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
                        $('#button-upload').prop('disabled', true);
                        $('#upload-progress').removeClass('hide');
                    },
                    complete: function () {
                        $('#button-upload i').replaceWith('<i class="fa fa-upload"></i>');
                        $('#button-upload').prop('disabled', false);
                        $('#upload-progress').addClass('hide');
                    },
                    success: function (json) {
                        if (json['error']) {
                            alert(json['error']);
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $('#button-refresh').trigger('click');
                        }
                    },
                    xhr: function() {
                        var xhr = new window.XMLHttpRequest();

                        xhr.upload.addEventListener("progress", function(evt) {
                            if (evt.lengthComputable) {
                                var percentComplete = evt.loaded / evt.total;
                                percentComplete = parseInt(percentComplete * 100);
                                $('.progress-bar').html(percentComplete + '%').attr('aria-valuenow', percentComplete).css('width', percentComplete + '%');
                            }
                        }, false);

                        return xhr;
                    },
                    error: function (xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });

    $('#button-folder').popover({
        html: true,
        placement: 'bottom',
        trigger: 'click',
        title: '<?php echo $entry_folder; ?>',
        content: function () {
            html = '<div class="input-group">';
            html += '  <input type="text" name="folder" value="" placeholder="<?php echo $entry_folder; ?>" class="form-control">';
            html += '  <span class="input-group-btn"><button type="button" title="<?php echo $button_folder; ?>" id="button-create" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></span>';
            html += '</div>';

            return html;
        }
    });

    $('#button-folder').on('shown.bs.popover', function () {
        $('#button-create').on('click', function () {
            $.ajax({
                url: 'index.php?route=common/filemanager/folder&token=<?php echo $token; ?>&directory=<?php echo $directory; ?>',
                type: 'post',
                dataType: 'json',
                data: 'folder=' + encodeURIComponent($('input[name=\'folder\']').val()),
                beforeSend: function () {
                    $('#button-create').prop('disabled', true);
                },
                complete: function () {
                    $('#button-create').prop('disabled', false);
                },
                success: function (json) {
                    if (json['error']) {
                        alert(json['error']);
                    }

                    if (json['success']) {
                        alert(json['success']);

                        $('#button-refresh').trigger('click');
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });
    });

    $('#modal-image #button-delete').on('click', function (e) {
        if (confirm('<?php echo $text_confirm; ?>')) {
            $.ajax({
                url: 'index.php?route=common/filemanager/delete&token=<?php echo $token; ?>',
                type: 'post',
                dataType: 'json',
                data: $('input[name^=\'path\']:checked'),
                beforeSend: function () {
                    $('#button-delete').prop('disabled', true);
                },
                complete: function () {
                    $('#button-delete').prop('disabled', false);
                },
                success: function (json) {
                    if (json['error']) {
                        alert(json['error']);
                    }

                    if (json['success']) {
                        alert(json['success']);

                        $('#button-refresh').trigger('click');
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }
    });
    //--></script>