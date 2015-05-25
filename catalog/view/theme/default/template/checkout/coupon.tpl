<div class="input-group input-group-sm">
    <input type="text" name="coupon" value="<?php echo $coupon; ?>" placeholder="Nhập mã giảm giá" id="input-coupon" class="form-control" />
    <div class="input-group-btn">
        <button type="button" value="<?php echo $button_coupon; ?>" id="button-coupon" class="btn btn-maguss">
            <i class="fa fa-check"></i>
        </button>
    </div>
</div>
<script type="text/javascript"><!--
    $('#button-coupon').on('click', function() {
        var btn = $(this);
        if ($.trim(btn.closest('.input-group').find('#input-coupon').val()) == '') {
            alert('Vui lòng nhập mã giảm giá!');
            return false;
        }
        $.ajax({
            url: 'index.php?route=checkout/coupon/coupon',
            type: 'post',
            data: 'coupon=' + encodeURIComponent($('input[name=\'coupon\']').val()),
            dataType: 'json',
            beforeSend: function() {
                btn.prop('disabled', true);
                btn.closest('.input-group').find('#input-coupon').prop('disabled', true).addClass('loading');
            },
            complete: function() {
                btn.prop('disabled', false);
                btn.closest('.input-group').find('#input-coupon').prop('disabled', false).removeClass('loading');
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
