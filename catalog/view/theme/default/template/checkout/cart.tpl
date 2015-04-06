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
            <h1><?php echo $heading_title; ?>
                <?php if ($weight) { ?>
                    &nbsp;(<?php echo $weight; ?>)
                <?php } ?>
            </h1>

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <td class="text-left"><?php echo $column_name; ?></td>
                            <td class="text-left"><?php echo $column_model; ?></td>
                            <td class="text-left"><?php echo $column_quantity; ?></td>
                            <td class="text-right"><?php echo $column_price; ?></td>
                            <td class="text-right"><?php echo $column_total; ?></td>
                        </tr>
                        </thead>
                        <tbody>
                        <?php foreach ($products as $product) { ?>
                            <tr>
                                <td class="text-left">
                                    <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
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
                                <td class="text-left"><?php echo $product['model']; ?></td>
                                <td class="text-left" style="width: 200px;">
                                    <div class="input-group">
                                        <input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" readonly/>
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-caret-up"></i>
                                            </button>
                                            <button type="button" class="btn btn-default">
                                                <i class="fa fa-caret-down"></i>
                                            </button>
                                            <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['key']; ?>');">
                                                <i class="fa fa-times-circle"></i>
                                            </button>
                                        </div>
                                    </div>
                                </td>
                                <td class="text-right"><?php echo $product['price']; ?></td>
                                <td class="text-right"><?php echo $product['total']; ?></td>
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
                        <table class="table table-bordered" style="margin-left: 15px;">
                            <tr>
                                <td class="w160">THÀNH TIỀN</td>
                                <td><?php echo $totals['sub_total']['text']; ?></td>
                            </tr>
                            <tr>
                                <td class="w160">Mã giảm giá</td>
                                <td>
                                    <?php if ($coupon): ?>
                                        <?php echo $coupon; ?>
                                    <?php endif; ?>
                                    <?php if (!empty($totals['coupon'])): ?>
                                        <?php echo $totals['coupon']['text']; ?>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td class="w160">Phiếu quà tặng</td>
                                <td>
                                    <?php if ($voucher): ?>
                                        <?php echo $voucher; ?>
                                    <?php endif; ?>
                                    <?php if (!empty($totals['voucher'])): ?>
                                        <?php echo $totals['voucher']['text']; ?>
                                    <?php endif; ?>
                                </td>
                            </tr>
                            <tr>
                                <td class="w160">Khu vực giao hàng</td>
                                <td class="form-inline">
                                    <select class="form-control" id="cbo-provinces" style="width: 49%;">
                                        <option value="0">Tỉnh/Thành Phố</option>
                                        <?php if (!empty($method_data['locations']) && !empty($method_data['locations']['province_name'])) : ?>
                                            <?php foreach ($method_data['locations']['province_name'] as $province) : ?>
                                                <option value="<?php echo $province['id']; ?>"><?php echo $province['text']; ?></option>
                                            <?php endforeach; ?>
                                        <?php endif; ?>
                                    </select>
                                    <select class="form-control" id="cbo-province-location" disabled style="width: 49%;">
                                        <option>Quận/Huyện</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="w160">Phí giao hàng</td>
                                <td id="lbl-shipping-cost"></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-md-offset-6">
                        <table class="table table-bordered" style="margin-left: 15px;">
                            <tr>
                                <td class="w160">TỔNG CỘNG</td>
                                <td><?php echo $totals['total']['text']; ?></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </form>

            <div class="row">
                <div class="col-sm-4 col-sm-offset-8">
                    <table class="table table-bordered">
                        <?php foreach ($totals as $total) { ?>
                            <tr>
                                <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
                                <td class="text-right"><?php echo $total['text']; ?></td>
                            </tr>
                        <?php } ?>
                    </table>
                </div>
            </div>
            <div class="buttons">
                <div class="pull-left"><a href="<?php echo $continue; ?>"
                                          class="btn btn-default"><?php echo $button_shopping; ?></a></div>
                <div class="pull-right"><a href="<?php echo $checkout; ?>"
                                           class="btn btn-primary"><?php echo $button_checkout; ?></a></div>
            </div>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
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
<script type="text/javascript">
    var provinces = <?php echo json_encode($provinces); ?>;
    $(function(){
        var cboProvinceLocation = $('#cbo-province-location'),
            lblShippingCost = $('#lbl-shipping-cost');
        $('#cbo-provinces').change(function() {
            var provinceId = $(this).val();

            if (provinceId != 0) {
                cboProvinceLocation.html('');
                cboProvinceLocation.prop('disabled', false);
                var currProvince = provinces[provinceId];
                lblShippingCost.html(currProvince[0].cost);
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
        });

        cboProvinceLocation.change(function() {
            lblShippingCost.html($(this).find('option:selected').data('cost'));
        });
    });
</script>