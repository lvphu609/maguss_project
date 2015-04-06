<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-maguss" data-toggle="tooltip" title="<?php echo $button_save; ?>"
                        class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>"
                   class="btn btn-default"><i class="fa fa-reply"></i></a></div>
            <h1><?php echo $heading_title; ?></h1>
            <ul class="breadcrumb">
                <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
                <?php } ?>
            </ul>
        </div>
    </div>
    <div class="container-fluid">
        <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-maguss"
                      class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>

                        <div class="col-sm-10">
                            <select name="maguss_status" id="input-status" class="form-control">
                                <?php if ($maguss_status) { ?>
                                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                    <option value="0"><?php echo $text_disabled; ?></option>
                                <?php } else { ?>
                                    <option value="1"><?php echo $text_enabled; ?></option>
                                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"
                               for="input-sort-order"><?php echo $entry_sort_order; ?></label>

                        <div class="col-sm-10">
                            <input type="text" name="maguss_sort_order" value="<?php echo $maguss_sort_order; ?>"
                                   placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order"
                                   class="form-control"/>
                        </div>
                    </div>

                    <table class="table table-bordered table-hover table-striped">
                        <thead>
                        <tr>
                            <td class="text-center">#</td>
                            <td>Tỉnh/TP</td>
                            <td>Quận/Huyện</td>
                            <td>Giá</td>
                            <td></td>
                        </tr>
                        </thead>
                        <tbody id="pan-table-zone">
                        <?php if (!empty($maguss_zone['maguss_zone']) && count($maguss_zone['maguss_zone']) > 0) : ?>
                            <?php foreach ($maguss_zone['maguss_zone']['name'] as $key => $name) : ?>
                                <tr>
                                    <td class="text-center"><?php echo($key + 1); ?></td>
                                    <td class="form-group" style="width: 220px;">
                                        <select name="maguss_zone[province][]" class="form-control cbo-provinces" style="width: 200px;">
                                            <?php foreach ($provinces as $province) : ?>
                                                <option value="<?php echo $province['id']; ?>" <?php echo ($province['id'] == $maguss_zone['maguss_zone']['province'][$key] ? 'selected' : ''); ?>><?php echo $province['text']; ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>
                                    <td class="form-group">
                                        <input type="text" name="maguss_zone[name][]" class="form-control zone-name"
                                               value="<?php echo $name; ?>" placeholder="Zone name...">
                                    </td>
                                    <td class="form-group">
                                        <input type="text" name="maguss_zone[cost][]" class="form-control zone-cost"
                                               value="<?php echo $maguss_zone['maguss_zone']['cost'][$key]; ?>"
                                               placeholder="Cost">
                                    </td>
                                    <td class="text-center">
                                        <button type="button" class="btn btn-danger btn-sm btn-delete-zone">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </button>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                        </tbody>
                    </table>

                    <div class="panel-body text-right">
                        <button type="button" class="btn btn-primary" id="btn-add-zone"><?php echo $entry_add_zone; ?>
                            <span class="glyphicon glyphicon-plus-sign"></span></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<input type="hidden" id="confirm_delete_zone" value="<?php echo $confirm_delete_zone; ?>">
<input type="hidden" id="zone_name_invalid" value="<?php echo $zone_name_invalid; ?>">
<input type="hidden" id="zone_cost_invalid" value="<?php echo $zone_cost_invalid; ?>">

<script type="text/javascript">
    var provinces = <?php echo json_encode($provinces); ?>;
    $(function() {
        $('.cbo-provinces').select2();
    });
</script>
<?php echo $footer; ?> 