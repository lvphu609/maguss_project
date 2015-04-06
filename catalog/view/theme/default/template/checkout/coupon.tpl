<div class="input-group input-group-sm">
    <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="<?php echo $entry_coupon; ?>" id="input-coupon" class="form-control" />
    <div class="input-group-btn">
        <button type="button" value="<?php echo $button_coupon; ?>" id="button-coupon" data-loading-text="<?php echo $text_loading; ?>" data-toggle="tooltip" title="Sử dụng mã giảm giá" class="btn btn-primary">
            <i class="fa fa-check"></i>
        </button>
    </div>
</div>
<script type="text/javascript"><!--
    $('#button-coupon').on('click', function() {
        $.ajax({
            url: 'index.php?route=checkout/coupon/coupon',
            type: 'post',
            data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
            dataType: 'json',
            beforeSend: function() {
                $('#button-coupon').button('loading');
            },
            complete: function() {
                $('#button-coupon').button('reset');
            },
            success: function(json) {
                $('.alert').remove();

                if (json['error']) {
                    $('.breadcrumb').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('html, body').animate({ scrollTop: 0 }, 'slow');
                }

                if (json['redirect']) {
                    location = json['redirect'];
                }
            }
        });
    });
    //-->
</script>
