<?php echo $header; ?>
    <div class="container">
        <?php /* <ul class="breadcrumb">
            <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
            <?php } ?>
        </ul> */ ?>
        <div class="breadcrumb-maguss-common">
        <?php $count_breadcrumbs = count($breadcrumbs) -1; ?>
        <?php foreach ($breadcrumbs as $key=>$breadcrumb) { ?>
            <?php $classBr = ($key==0) ? "br-first" : ""; ?>
            <div class="breadcrumb-item <?php echo $classBr; ?>"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></div>
            <?php if(($count_breadcrumbs)!=$key){ ?>
                <div class="breadcrumb-item">></div>
            <?php } ?>
        <?php } ?>
      </div>
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="row"><?php echo $column_left; ?>
            <?php if ($column_left && $column_right) { ?>
                <?php $class = 'col-sm-6'; ?>
            <?php } elseif ($column_left || $column_right) { ?>
                <?php $class = 'col-sm-9'; ?>
            <?php } else { ?>
                <?php $class = 'col-sm-12'; ?>
            <?php } ?>
            <div id="content" class="<?php echo $class; ?> pan-checkout"><?php echo $content_top; ?>
                <h3 class="checkout-title">THANH TOÁN</h3>

                <div class="row text-center tbl-title text-space-1">
                    <div class="col-md-4">Tóm tắt đơn hàng</div>
                    <div class="col-md-4">Địa chỉ giao hàng</div>
                    <div class="col-md-4">Hình thức thanh toán</div>
                </div>
                <div class="row text-center tbl-content" style="border: 1px solid #63c6c1; overflow: hidden;">
                    <div class="col-md-4">
                        <?php echo $confirm_product; ?>
                    </div>
                    <div class="col-md-4 pan-address-shipping">
                        <div class="panel-body form-horizontal">
                            <?php if ($logged) : ?>
                                <p><?php echo $address; ?></p>
                            <?php else : ?>
                                <a href="<?php echo $register_url; ?>">Đăng ký</a>/<a href="<?php echo $login_url; ?>">Đăng nhập</a>
                                <br><br>
                                <p class="text-left"><strong>Nếu bạn không muốn đăng ký, vui lòng điền thông tin giao hàng:</strong></p>
                                <input type="hidden" id="guest-checkout">
                            <?php endif; ?>
                            <div id="pan-checkout-address" class="<?php echo($logged ? 'hide' : ''); ?>">
                                <div class="form-group">
                                    <label for="input-address-firstname" class="col-sm-3 control-label required"><strong>Họ tên</strong></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="firstname" class="form-control" id="input-address-firstname" placeholder="Họ tên">
                                        <input type="hidden" name="lastname" value="(guest)">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="input-address-address-1" class="col-sm-3 control-label required"><strong>Địa chỉ</strong></label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" name="address_1" id="input-address-address-1" placeholder="Địa chỉ" style="resize: none;"></textarea>
                                        <input type="hidden" name="city" value="city">
                                        <input type="hidden" name="postcode" value="84">
                                        <input type="hidden" name="country_id" value="230">
                                        <input type="hidden" name="zone_id" value="3780">
                                        <input type="hidden" name="shipping_address" value="1">
                                        <input type="hidden" name="fax" value="">
                                        <input type="hidden" name="address_2" value="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="input-address-telephone" class="col-sm-3 control-label required"><strong>Di động</strong></label>
                                    <div class="col-sm-9">
                                        <input type="text" name="telephone" class="form-control" id="input-address-telephone" placeholder="Số di động">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="input-address-email" class="col-sm-3 control-label required"><strong>Email</strong></label>
                                    <div class="col-sm-9">
                                        <input type="email" name="email" class="form-control" id="input-address-email" placeholder="Email">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label><input type="radio" name="company" value="Nơi làm việc" checked> Nơi làm việc</label>
                                    <label style="margin-left: 20px;"><input type="radio" name="company" value="Nhà riêng"> Nhà riêng</label>
                                </div>
                            </div>
                        </div>
                        <?php if ($logged) : ?>
                            <a href="#" id="lik-change-address"><strong>Địa chỉ khác</strong></a>
                        <?php endif; ?>
                    </div>
                    <div class="col-md-4 pan-payment">
                        <div class="panel-body">Bằng tiền mặt khi nhận hàng</div>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-4" style="padding: 0px 2px 0px 0px;">
                        <div class="form-group pan-checkout-note">
                            <label for="txt-note"><strong>Ghi chú cho đơn hàng</strong></label>
                            <textarea id="txt-note" name="note" class="form-control"></textarea>
                        </div>
                    </div>
                    <div class="col-md-4" style="padding: 0px 0px 0px 2px;">
                        <div class="pan-checkout-price">
                            <div class="row">
                                <div class="col-xs-6 text-bold">THÀNH TIỀN</div>
                                <div class="col-xs-6 text-right text-bold"><?php echo $totals['sub_total']['text']; ?></div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 text-bold">PHÍ GIAO HÀNG</div>
                                <div class="col-xs-6 text-right text-bold"><?php echo (!empty($totals['shipping']) ? $totals['shipping']['text'] : ''); ?></div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6 text-bold">TỔNG CỘNG</div>
                                <div class="col-xs-6 text-right text-bold"><?php echo $totals['total']['text']; ?></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <?php if (!empty($totals['shipping'])) : ?>
                            <button type="button" class="btn btn-lg btn-maguss btn-finish-order" id="btn-finish-order"> HOÀN TẤT </button>
                        <?php else : ?>
                            <a href="<?php echo $shopping_cart_url; ?>" class="btn btn-maguss btn-finish-order">VUI LÒNG CHỌN KHU VỰC GIAO HÀNG</a>
                        <?php endif; ?>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-5 col-md-offset-3">
                        <p class="text-right pan-order-slogan">
                            Đơn hàng sẽ được giao từ 3 đến 5 ngày làm việc (thứ 2 - thứ 7)
                            <br>
                            Để yêu cầu giao hàng nhanh, vui lòng liên hệ <strong>1900 1800</strong>
                        </p>
                    </div>
                </div>
                <?php echo $content_bottom; ?></div>
            <?php echo $column_right; ?></div>
    </div>
    <script type="text/javascript"><!--
    $(document).on('change', 'input[name=\'account\']', function () {
        if ($('#collapse-payment-address').parent().find('.panel-heading .panel-title > *').is('a')) {
            if (this.value == 'register') {
                $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
            } else {
                $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
            }
        } else {
            if (this.value == 'register') {
                $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_account; ?>');
            } else {
                $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_address; ?>');
            }
        }
    });

    <?php if (!$logged) { ?>
    $(document).ready(function () {
        $.ajax({
            url: 'index.php?route=checkout/login',
            dataType: 'html',
            success: function (html) {
                $('#collapse-checkout-option .panel-body').html(html);

                $('#collapse-checkout-option').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-option" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_option; ?> <i class="fa fa-caret-down"></i></a>');

                $('a[href=\'#collapse-checkout-option\']').trigger('click');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    <?php } else { ?>
    $(document).ready(function () {
        $.ajax({
            url: 'index.php?route=checkout/payment_address',
            dataType: 'html',
            success: function (html) {
                console.log(html);
                $('#collapse-payment-address .panel-body').html(html);

                $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');

                $('a[href=\'#collapse-payment-address\']').trigger('click');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    <?php } ?>

    // Checkout
    $(document).delegate('#button-account', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').val(),
            dataType: 'html',
            beforeSend: function () {
                //$('#button-account').button('loading');
            },
            complete: function () {
                //$('#button-account').button('reset');
            },
            success: function (html) {
                $('.alert, .text-danger').remove();

                $('#collapse-payment-address .panel-body').html(html);

                if ($('input[name=\'account\']:checked').val() == 'register') {
                    $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_account; ?> <i class="fa fa-caret-down"></i></a>');
                } else {
                    $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
                }

                $('a[href=\'#collapse-payment-address\']').trigger('click');
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Login
    $(document).delegate('#button-login', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/login/save',
            type: 'post',
            data: $('#collapse-checkout-option :input'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-login').button('loading');
            },
            complete: function () {
                //$('#button-login').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    $('#collapse-checkout-option .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    // Highlight any found errors
                    $('input[name=\'email\']').parent().addClass('has-error');
                    $('input[name=\'password\']').parent().addClass('has-error');
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Register
    $(document).delegate('#button-register', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/register/save',
            type: 'post',
            data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address textarea, #collapse-payment-address select'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-register').button('loading');
            },
            complete: function () {
                //$('#button-register').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                    for (i in json['error']) {
                        var element = $('#input-payment-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                } else {
                    <?php if ($shipping_required) { ?>
                    var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').prop('value');

                    if (shipping_address) {
                        $.ajax({
                            url: 'index.php?route=checkout/shipping_method',
                            dataType: 'html',
                            success: function (html) {
                                // Add the shipping address
                                $.ajax({
                                    url: 'index.php?route=checkout/shipping_address',
                                    dataType: 'html',
                                    success: function (html) {
                                        $('#collapse-shipping-address .panel-body').html(html);

                                        $('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');
                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                                });

                                $('#collapse-shipping-method .panel-body').html(html);

                                $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i></a>');

                                $('a[href=\'#collapse-shipping-method\']').trigger('click');

                                $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
                                $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
                                $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    } else {
                        $.ajax({
                            url: 'index.php?route=checkout/shipping_address',
                            dataType: 'html',
                            success: function (html) {
                                $('#collapse-shipping-address .panel-body').html(html);

                                $('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');

                                $('a[href=\'#collapse-shipping-address\']').trigger('click');

                                $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
                                $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
                                $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    }
                    <?php } else { ?>
                    $.ajax({
                        url: 'index.php?route=checkout/payment_method',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-payment-method .panel-body').html(html);

                            $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');

                            $('a[href=\'#collapse-payment-method\']').trigger('click');

                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                    <?php } ?>

                    $.ajax({
                        url: 'index.php?route=checkout/payment_address',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-payment-address .panel-body').html(html);

                            $('#collapse-payment-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_address; ?> <i class="fa fa-caret-down"></i></a>');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Payment Address
    $(document).delegate('#button-payment-address', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/payment_address/save',
            type: 'post',
            data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'password\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-payment-address').button('loading');
            },
            complete: function () {
                //$('#button-payment-address').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                    for (i in json['error']) {
                        var element = $('#input-payment-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().parent().addClass('has-error');
                } else {
                    <?php if ($shipping_required) { ?>
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_address',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-shipping-address .panel-body').html(html);

                            $('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');

                            $('a[href=\'#collapse-shipping-address\']').trigger('click');

                            $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
                            $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                    <?php } else { ?>
                    $.ajax({
                        url: 'index.php?route=checkout/payment_method',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-payment-method .panel-body').html(html);

                            $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');

                            $('a[href=\'#collapse-payment-method\']').trigger('click');

                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                    <?php } ?>

                    $.ajax({
                        url: 'index.php?route=checkout/payment_address',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-payment-address .panel-body').html(html);
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Shipping Address
    $(document).delegate('#button-shipping-address', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/shipping_address/save',
            type: 'post',
            data: $('#collapse-shipping-address input[type=\'text\'], #collapse-shipping-address input[type=\'date\'], #collapse-shipping-address input[type=\'datetime-local\'], #collapse-shipping-address input[type=\'time\'], #collapse-shipping-address input[type=\'password\'], #collapse-shipping-address input[type=\'checkbox\']:checked, #collapse-shipping-address input[type=\'radio\']:checked, #collapse-shipping-address textarea, #collapse-shipping-address select'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-shipping-address').button('loading');
            },
            complete: function () {
                //$('#button-shipping-address').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                    for (i in json['error']) {
                        var element = $('#input-shipping-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().parent().addClass('has-error');
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-shipping-method .panel-body').html(html);

                            $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i></a>');

                            $('a[href=\'#collapse-shipping-method\']').trigger('click');

                            $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');

                            $.ajax({
                                url: 'index.php?route=checkout/shipping_address',
                                dataType: 'html',
                                success: function (html) {
                                    $('#collapse-shipping-address .panel-body').html(html);
                                },
                                error: function (xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });

                    $.ajax({
                        url: 'index.php?route=checkout/payment_address',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-payment-address .panel-body').html(html);
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Guest
    $(document).delegate('#button-guest', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/guest/save',
            type: 'post',
            data: $('#collapse-payment-address input[type=\'text\'], #collapse-payment-address input[type=\'date\'], #collapse-payment-address input[type=\'datetime-local\'], #collapse-payment-address input[type=\'time\'], #collapse-payment-address input[type=\'checkbox\']:checked, #collapse-payment-address input[type=\'radio\']:checked, #collapse-payment-address input[type=\'hidden\'], #collapse-payment-address textarea, #collapse-payment-address select'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-guest').button('loading');
            },
            complete: function () {
                //$('#button-guest').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-payment-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                    for (i in json['error']) {
                        var element = $('#input-payment-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                } else {
                    <?php if ($shipping_required) { ?>
                    var shipping_address = $('#collapse-payment-address input[name=\'shipping_address\']:checked').prop('value');

                    if (shipping_address) {
                        $.ajax({
                            url: 'index.php?route=checkout/shipping_method',
                            dataType: 'html',
                            success: function (html) {
                                // Add the shipping address
                                $.ajax({
                                    url: 'index.php?route=checkout/guest_shipping',
                                    dataType: 'html',
                                    success: function (html) {
                                        $('#collapse-shipping-address .panel-body').html(html);

                                        $('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');
                                    },
                                    error: function (xhr, ajaxOptions, thrownError) {
                                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                    }
                                });

                                $('#collapse-shipping-method .panel-body').html(html);

                                $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i></a>');

                                $('a[href=\'#collapse-shipping-method\']').trigger('click');

                                $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
                                $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    } else {
                        $.ajax({
                            url: 'index.php?route=checkout/guest_shipping',
                            dataType: 'html',
                            success: function (html) {
                                $('#collapse-shipping-address .panel-body').html(html);

                                $('#collapse-shipping-address').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-address" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?> <i class="fa fa-caret-down"></i></a>');

                                $('a[href=\'#collapse-shipping-address\']').trigger('click');

                                $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_shipping_method; ?>');
                                $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
                                $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                            },
                            error: function (xhr, ajaxOptions, thrownError) {
                                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                            }
                        });
                    }
                    <?php } else { ?>
                    $.ajax({
                        url: 'index.php?route=checkout/payment_method',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-payment-method .panel-body').html(html);

                            $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');

                            $('a[href=\'#collapse-payment-method\']').trigger('click');

                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                    <?php } ?>
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    // Guest Shipping
    $(document).delegate('#button-guest-shipping', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/guest_shipping/save',
            type: 'post',
            data: $('#collapse-shipping-address input[type=\'text\'], #collapse-shipping-address input[type=\'date\'], #collapse-shipping-address input[type=\'datetime-local\'], #collapse-shipping-address input[type=\'time\'], #collapse-shipping-address input[type=\'password\'], #collapse-shipping-address input[type=\'checkbox\']:checked, #collapse-shipping-address input[type=\'radio\']:checked, #collapse-shipping-address textarea, #collapse-shipping-address select'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-guest-shipping').button('loading');
            },
            complete: function () {
                //$('#button-guest-shipping').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-shipping-address .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }

                    for (i in json['error']) {
                        var element = $('#input-shipping-' + i.replace('_', '-'));

                        if ($(element).parent().hasClass('input-group')) {
                            $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                        } else {
                            $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                        }
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/shipping_method',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-shipping-method .panel-body').html(html);

                            $('#collapse-shipping-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-shipping-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?> <i class="fa fa-caret-down"></i>');

                            $('a[href=\'#collapse-shipping-method\']').trigger('click');

                            $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_payment_method; ?>');
                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $(document).delegate('#button-shipping-method', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/shipping_method/save',
            type: 'post',
            data: $('#collapse-shipping-method input[type=\'radio\']:checked, #collapse-shipping-method textarea'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-shipping-method').button('loading');
            },
            complete: function () {
                //$('#button-shipping-method').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-shipping-method .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/payment_method',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-payment-method .panel-body').html(html);

                            $('#collapse-payment-method').parent().find('.panel-heading .panel-title').html('<a href="#collapse-payment-method" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_payment_method; ?> <i class="fa fa-caret-down"></i></a>');

                            $('a[href=\'#collapse-payment-method\']').trigger('click');

                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<?php echo $text_checkout_confirm; ?>');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $(document).delegate('#button-payment-method', 'click', function () {
        $.ajax({
            url: 'index.php?route=checkout/payment_method/save',
            type: 'post',
            data: $('#collapse-payment-method input[type=\'radio\']:checked, #collapse-payment-method input[type=\'checkbox\']:checked, #collapse-payment-method textarea'),
            dataType: 'json',
            beforeSend: function () {
                //$('#button-payment-method').button('loading');
            },
            complete: function () {
                //$('#button-payment-method').button('reset');
            },
            success: function (json) {
                $('.alert, .text-danger').remove();

                if (json['redirect']) {
                    location = json['redirect'];
                } else if (json['error']) {
                    if (json['error']['warning']) {
                        $('#collapse-payment-method .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    }
                } else {
                    $.ajax({
                        url: 'index.php?route=checkout/confirm',
                        dataType: 'html',
                        success: function (html) {
                            $('#collapse-checkout-confirm .panel-body').html(html);

                            $('#collapse-checkout-confirm').parent().find('.panel-heading .panel-title').html('<a href="#collapse-checkout-confirm" data-toggle="collapse" data-parent="#accordion" class="accordion-toggle"><?php echo $text_checkout_confirm; ?> <i class="fa fa-caret-down"></i></a>');

                            $('a[href=\'#collapse-checkout-confirm\']').trigger('click');
                        },
                        error: function (xhr, ajaxOptions, thrownError) {
                            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                        }
                    });
                }
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });

    $(document).delegate('#btn-finish-order', 'click', function() {
        var btn = $(this);
        if ($('#guest-checkout').length > 0) {
            $.ajax({
                url: 'index.php?route=checkout/guest/save',
                type: 'post',
                data: $('#pan-checkout-address input[type=\'text\'], #pan-checkout-address input[type=\'email\'], #pan-checkout-address input[type=\'date\'], #pan-checkout-address input[type=\'datetime-local\'], #pan-checkout-address input[type=\'time\'], #pan-checkout-address input[type=\'checkbox\']:checked, #pan-checkout-address input[type=\'radio\']:checked, #pan-checkout-address input[type=\'hidden\'], #pan-checkout-address textarea, #pan-checkout-address select'),
                dataType: 'json',
                beforeSend: function () {
                    btn.prop('disabled', true);
                    btn.addClass('loading');
                },
                success: function (json) {
                    $('.alert, .text-danger').remove();

                    if (json['redirect']) {
                        window.location = json['redirect'];
                    } else if (json['error']) {
                        btn.prop('disabled', false);
                        btn.removeClass('loading');

                        if (json['error']['warning']) {
                            $('#pan-checkout-address').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        }

                        for (i in json['error']) {
                            var element = $('#input-address-' + i.replace('_', '-'));

                            if ($(element).parent().hasClass('input-group')) {
                                $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                            } else {
                                $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                            }
                        }

                        // Highlight any found errors
                        $('.text-danger').parent().addClass('has-error');
                    } else {
                        $.ajax({
                            type: 'get',
                            url: 'index.php?route=checkout/finish&note=' + $('#txt-note').val(),
                            cache: false,
                            complete: function() {
                                btn.prop('disabled', false);
                                btn.removeClass('loading');
                            },
                            success: function() {
                                window.location = '<?php echo $checkout_success_url; ?>';
                            }
                        });
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        } else if ($('#pan-checkout-address').hasClass('hide')) {
            $.ajax({
                type: 'get',
                url: 'index.php?route=checkout/finish&note=' + $('#txt-note').val(),
                cache: false,
                beforeSend: function () {
                    btn.prop('disabled', true);
                    btn.addClass('loading');
                },
                success: function() {
                    window.location = '<?php echo $checkout_success_url; ?>';
                }
            });
        } else {
            $.ajax({
                url: 'index.php?route=checkout/shipping_address/save',
                type: 'post',
                data: $('#pan-checkout-address input[type=\'text\'], #pan-checkout-address input[type=\'email\'], #pan-checkout-address input[type=\'date\'], #pan-checkout-address input[type=\'datetime-local\'], #pan-checkout-address input[type=\'time\'], #pan-checkout-address input[type=\'checkbox\']:checked, #pan-checkout-address input[type=\'radio\']:checked, #pan-checkout-address input[type=\'hidden\'], #pan-checkout-address textarea, #pan-checkout-address select'),
                dataType: 'json',
                beforeSend: function () {
                    btn.prop('disabled', true);
                    btn.addClass('loading');
                },
                success: function (json) {
                    $('.alert, .text-danger').remove();

                    if (json['redirect']) {
                        location = json['redirect'];
                    } else if (json['error']) {
                        if (json['error']['warning']) {
                            $('#pan-checkout-address').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        }

                        for (i in json['error']) {
                            var element = $('#input-address-' + i.replace('_', '-'));

                            if ($(element).parent().hasClass('input-group')) {
                                $(element).parent().after('<div class="text-danger">' + json['error'][i] + '</div>');
                            } else {
                                $(element).after('<div class="text-danger">' + json['error'][i] + '</div>');
                            }
                        }

                        // Highlight any found errors
                        $('.text-danger').parent().parent().addClass('has-error');
                    } else {
                        $.ajax({
                            type: 'get',
                            url: 'index.php?route=checkout/finish&note=' + $('#txt-note').val(),
                            cache: false,
                            beforeSend: function () {
                                btn.prop('disabled', true);
                                btn.addClass('loading');
                            },
                            success: function() {
                                window.location = '<?php echo $checkout_success_url; ?>';
                            }
                        });
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        }

    });

    $(document).delegate('#lik-change-address', 'click', function(e) {
        e.preventDefault();
        var panAddress = $('#pan-checkout-address'),
            txtChange = $(this);
        if (panAddress.hasClass('hide')) {
            panAddress.removeClass('hide');
            txtChange.find('strong').text('Sử dụng địa chỉ đã đăng ký');
        } else {
            panAddress.addClass('hide');
            txtChange.find('strong').text('Địa chỉ khác');
        }
    });
    //--></script>
<?php echo $footer; ?>