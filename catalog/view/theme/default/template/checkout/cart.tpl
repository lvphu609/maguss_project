<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <?php if ($attention) { ?>
        <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
    <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
    <?php } ?>
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
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h3 style="color: #63c6c1;"><?php echo $heading_title; ?></h3>
            <h4 style="color: #63c6c1;">Cập nhật đơn hàng và chi tiết tất cả các sản phẩm</h4>

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="table-responsive">
                    <table class="table table-bordered tbl-shopping-cart">
                        <thead>
                        <tr>
                            <td class="text-center"><strong><?php echo $column_name; ?></strong></td>
                            <td class="text-center"><strong><?php echo $column_quantity; ?></strong></td>
                            <td class="text-center"><strong><?php echo $column_price; ?></strong></td>
                            <td class="text-center"><strong><?php echo $column_total; ?></strong></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($products as $product) { ?>
                            <tr>
                                <td class="text-left text-middle">
                                    <a href="<?php echo $product['href']; ?>">
                                        <?php echo $product['name']; ?> - Size: <?php echo $product['size_label']; ?> -  Color:
                                    </a>
                                    <span class="color-preview" style="background-color: <?php echo $product['color']; ?>;"></span>
                                    <?php if (!$product['stock']) { ?>
                                        <span class="text-danger">***</span>
                                    <?php } ?>
                                    <?php if ($product['option']) { ?>
                                        <?php foreach ($product['option'] as $option) { ?>
                                            <br/>
                                            <small><?php echo $option['name']; ?>
                                                : <?php echo $option['value']; ?></small>
                                        <?php } ?>
                                    <?php } ?>
                                    <?php if ($product['reward']) { ?>
                                        <br/>
                                        <small><?php echo $product['reward']; ?></small>
                                    <?php } ?>
                                    <?php if ($product['recurring']) { ?>
                                        <br/>
                                        <span class="label label-info"><?php echo $text_recurring_item; ?></span>
                                        <small><?php echo $product['recurring']; ?></small>
                                    <?php } ?>
                                </td>
                                <td class="text-left text-middle" style="width: 200px;">
                                    <div class="input-group input-group-sm">
                                        <input type="text" class="form-control txt-product-quantity" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" readonly/>
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-maguss btn-quantity-plus">
                                                <i class="fa fa-caret-up"></i>
                                            </button>
                                            <button type="button" class="btn btn-maguss btn-quantity-minus">
                                                <i class="fa fa-caret-down"></i>
                                            </button>
                                            <button type="button" class="btn btn-maguss btn-delete-product" onclick="cart.remove('<?php echo $product['key']; ?>');">
                                                <i class="fa fa-times-circle"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right text-middle"><?php echo $product['price']; ?></td>
                                <td class="text-right text-middle"><strong><?php echo $product['total']; ?></strong></td>
                            </tr>
                        <?php } ?>
                        <?php foreach ($vouchers as $vouchers) { ?>
                            <tr>
                                <td></td>
                                <td class="text-left"><?php echo $vouchers['description']; ?></td>
                                <td class="text-left"></td>
                                <td class="text-left">
                                    <div class="input-group btn-block" style="max-width: 200px;">
                                        <input type="text" name="" value="1" size="1" disabled="disabled"
                                               class="form-control"/>
                                        <span class="input-group-btn"><button type="button" data-toggle="tooltip"
                                                                              title="<?php echo $button_remove; ?>"
                                                                              class="btn btn-danger"
                                                                              onclick="voucher.remove('<?php echo $vouchers['key']; ?>');">
                                                <i class="fa fa-times-circle"></i></button></span></div>
                                </td>
                                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                                <td class="text-right"><?php echo $vouchers['amount']; ?></td>
                            </tr>
                        <?php } ?>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-6">
                        <table class="table table-bordered tbl-cart-total" style="margin-left: 15px;">
                            <tr>
                                <td class="w160 hl h45 text-middle">THÀNH TIỀN</td>
                                <td class="txt-bold h45 text-middle"><?php echo $totals['sub_total']['text']; ?></td>
                            </tr>
                            <tr>
                                <td class="w160 hl h45 text-middle">Mã giảm giá</td>
                                <td class="txt-bold h45 text-middle">
                                    <?php if ($coupon): ?>
                                        <?php echo $coupon; ?>
                                    <?php endif; ?>
                                    <?php if (!empty($totals['coupon'])): ?>
                                        <?php echo $totals['coupon']['text']; ?>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td class="w160 hl h45 text-middle">Phiếu quà tặng</td>
                                <td class="txt-bold h45 text-middle">
                                    <?php if ($voucher): ?>
                                        <?php echo $voucher; ?>
                                    <?php endif; ?>
                                    <?php if (!empty($totals['voucher'])): ?>
                                        <?php echo $totals['voucher']['text']; ?>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td class="w160 hl h45 text-middle">Khu vực giao hàng</td>
                                <td class="form-inline txt-bold h45 text-middle">
                                    <?php
                                    $shipping_province = '';
                                    $shipping_location = '';
                                    $shipping_text = '';
                                    ?>
                                    <select class="form-control" name="shipping_province" id="cbo-provinces" style="width: 49%;">
                                        <option value="0">Tỉnh/Thành Phố</option>
                                        <?php if (!empty($method_data['locations']) && !empty($method_data['locations']['province_name'])) : ?>
                                            <?php foreach ($method_data['locations']['province_name'] as $province) : ?>
                                                <?php
                                                    if (!empty($shipping_method) && $shipping_method['province'] == $province['id']) {
                                                        $shipping_province = 'selected';
                                                    } else {
                                                        $shipping_province = '';
                                                    }
                                                ?>
                                                <option value="<?php echo $province['id']; ?>" <?php echo $shipping_province; ?>>
                                                    <?php echo $province['text']; ?>
                                                </option>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    </select>
                                        <?php
                                        $provinces = array();
                                        if (!empty($method_data['locations']) && !empty($method_data['locations']['province_name'])) {
                                            foreach ($method_data['locations']['province_name'] as $province) {
                                                $provinceLocation = array();
                                                foreach ($method_data['locations']['province'] as $key => $provinceId) {
                                                    if ($provinceId == $province['id']) {
                                                        $tmp = array(
                                                            'id' => $method_data['locations']['cost'][$key],
                                                            'text' => $method_data['locations']['name'][$key],
                                                            'cost' => $method_data['locations']['cost_format'][$key]
                                                        );
                                                        array_push($provinceLocation, $tmp);
                                                    }
                                                }
                                                $provinces[$province['id']] = $provinceLocation;
                                            }
                                        }
                                        ?>
                                        <?php if (count($provinces) > 0 && !empty($shipping_method) && !empty($provinces[$shipping_method['province']])) : ?>
                                            <select class="form-control" id="cbo-province-location" style="width: 49%;">
                                            <?php foreach ($provinces[$shipping_method['province']] as $location) : ?>
                                                <option value="<?php echo $location['id']; ?>" data-cost="<?php echo $location['cost']; ?>" <?php echo ($location['text'] == $shipping_method['location'] ? 'selected' : ''); ?>>
                                                    <?php echo $location['text']; ?>
                                                </option>
                                            <?php endforeach; ?>
                                        <?php else : ?>
                                            <select class="form-control" id="cbo-province-location" disabled style="width: 49%;">
                                                <option>Quận/Huyện</option>
                                        <?php endif; ?>
                                    </select>
                                    <input type="hidden" name="shipping_cost" id="shipping_cost">
                                    <input type="hidden" name="shipping_text" id="shipping_text">
                                    <input type="hidden" name="shipping_location" id="shipping_location">
                                </td>
                            </tr>
                            <tr>
                                <td class="w160 hl h45 text-middle">Phí giao hàng</td>
                                <td id="lbl-shipping-cost" class="txt-bold h45 text-middle">
                                    <?php
                                    if (!empty($shipping_method['text'])) {
                                        echo $shipping_method['text'];
                                    }
                                    ?>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-6">
                        <table class="table table-bordered tbl-cart-total" style="margin-left: 15px;">
                            <tr>
                                <td class="w160 hl h45 text-middle"><strong>TỔNG CỘNG</strong></td>
                                <td class="txt-bold h45 text-middle" style="font-size: 17px;"><?php echo $totals['total']['text']; ?></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>


            <div class="buttons">
                <div class="pull-right">
                    <a href="<?php echo $continue; ?>" class="btn-continue-shopping">Tiếp tục mua hàng</a>
                    <a href="<?php echo $checkout; ?>" id="btn-shopping-cart-checkout" class="btn btn-maguss btn-checkout">Thanh Toán</a>
                </div>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

<script type="text/javascript">
    var provinces = <?php echo json_encode($provinces); ?>;
    $(function(){
        var cboProvince = $('#cbo-provinces'),
            cboProvinceLocation = $('#cbo-province-location'),
            lblShippingCost = $('#lbl-shipping-cost');
        cboProvince.change(function() {
            var provinceId = $(this).val();
            $(this).prop('disabled', true);

            cboProvinceLocation.removeClass('loading');
            if (provinceId != 0) {
                cboProvinceLocation.html('');
                cboProvinceLocation.prop('disabled', false);
                var currProvince = provinces[provinceId];
                //lblShippingCost.html(currProvince[0].cost);

                for (var i = 0; i < currProvince.length; i++) {
                    var currProvinceLocation = currProvince[i],
                        option = $('<option value="' + currProvinceLocation.id + '" data-cost="' + currProvinceLocation.cost + '">' + currProvinceLocation.text + '</option>');
                    cboProvinceLocation.append(option);
                }
            } else {
                lblShippingCost.html('');
                cboProvinceLocation.html('<option>Quận/Huyện</option>');
                cboProvinceLocation.prop('disabled', true);
            }
            cboProvinceLocation.trigger('change');
        });

        cboProvinceLocation.change(function() {
            var costFormatted = $(this).find('option:selected').data('cost');
            $('#shipping_location').val($('#cbo-province-location option:selected').text());
            $('#shipping_cost').val(cboProvinceLocation.val());
            $('#shipping_text').val(costFormatted);

            $.ajax({
                url: 'index.php?route=checkout/shipping_method/change',
                type: 'post',
                data: $('#shipping_cost, #shipping_text, #shipping_location, #cbo-provinces'),
                dataType: 'json',
                beforeSend: function() {
                    cboProvinceLocation.addClass('loading');
                    cboProvinceLocation.prop('disabled', true);
                },
                complete: function() {
                    /*cboProvinceLocation.removeClass('loading');
                    cboProvinceLocation.prop('disabled', false);*/
                },
                success: function(json) {
                    $('.alert, .text-danger').remove();

                    if (json['redirect']) {
                        location = json['redirect'];
                    } else if (json['error']) {
                        if (json['error']['warning']) {
                            $('#collapse-shipping-method .panel-body').prepend('<div class="alert alert-warning">' + json['error']['warning'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                        }
                    } else {
                        lblShippingCost.html(costFormatted);
                    }
                },
                error: function(xhr, ajaxOptions, thrownError) {
                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                }
            });
        });

        $('.btn-quantity-plus').click(function() {
            var btn= $(this),
                txtQuantity = btn.closest('td').find('.txt-product-quantity'),
                quantity = txtQuantity.val();

            btn.closest('td').find('button').prop('disabled', true);
            btn.addClass('loading');
            txtQuantity.val(parseInt(quantity) + 1);
            btn.closest('form').submit();
        });

        $('.btn-quantity-minus').click(function() {
            var btn= $(this),
                txtQuantity = btn.closest('td').find('.txt-product-quantity'),
                quantity = txtQuantity.val();

            btn.closest('td').find('button').prop('disabled', true);
            btn.addClass('loading');
            txtQuantity.val(parseInt(quantity) - 1);
            btn.closest('form').submit();
        });

        $('#btn-shopping-cart-checkout').click(function(e) {
            if (cboProvince.val() == 0){
                e.preventDefault();
                alert("Vui lòng chọn khu vực giao hàng!");
                return false;
            }
        });

        $(document).on('click', '.btn-delete-product', function() {
            var btn = $(this);
            btn.closest('.input-group-btn').find('button').prop('disabled', true);
            btn.addClass('loading');
        })
    });
</script>