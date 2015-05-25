<div class="input-group input-group-sm">
    <input type="text" name="voucher" value="<?php echo $voucher; ?>" placeholder="<?php echo $entry_voucher; ?>" id="input-voucher" class="form-control" />
    <div class="input-group-btn">
        <button type="submit" value="<?php echo $button_voucher; ?>" id="button-voucher" class="btn btn-maguss">
            <i class="fa fa-check"></i>
        </button>
    </div>
</div>
<script type="text/javascript"><!--
    $('#button-voucher').on('click', function() {
        var btn = $(this);
        if ($.trim(btn.closest('.input-group').find('#input-voucher').val()) == '') {
            alert('Vui lòng nhập phiếu quà tặng!');
            return false;
        }
        $.ajax({
            url: 'index.php?route=checkout/voucher/voucher',
            type: 'post',
            data: 'voucher=' + encodeURIComponent($('input[name=\'voucher\']').val()),
            dataType: 'json',
            beforeSend: function() {
                btn.prop('disabled', true);
                btn.closest('.input-group').find('#input-voucher').prop('disabled', true).addClass('loading');
            },
            complete: function() {
                btn.prop('disabled', true);
                btn.closest('.input-group').find('#input-voucher').prop('disabled', true).addClass('loading');
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