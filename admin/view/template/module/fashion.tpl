<?php echo $header; ?><?php echo $column_left; ?>
    <div id="content">
        <div class="page-header">
            <div class="container-fluid">
                <div class="pull-right">
                    <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                    <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-name"><?php echo $entry_name; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                                <?php if ($error_name) { ?>
                                    <div class="text-danger"><?php echo $error_name; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-title"><?php echo $entry_title; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="title" value="<?php echo $title; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title" class="form-control" />
                                <?php if ($error_title) { ?>
                                    <div class="text-danger"><?php echo $error_title; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <br>

                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-left-image"><?php echo $entry_left_image; ?></label>
                            <div class="col-sm-10">
                                <a href="" id="left-image" data-toggle="image" class="img-thumbnail">
                                    <img src="<?php echo $left_image_thumb; ?>" />
                                </a>
                                <?php if ($error_left_image) { ?>
                                    <div class="text-danger"><?php echo $error_left_image; ?></div>
                                <?php } ?>
                                <input type="hidden" name="left_image" value="<?php echo $left_image; ?>" id="input-left-image" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-left-text"><?php echo $entry_left_text; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="left_text" class="form-control" id="input-left-text" value="<?php echo $left_text; ?>" placeholder="<?php echo $entry_left_text; ?>">
                                <?php if ($error_left_text) { ?>
                                    <div class="text-danger"><?php echo $error_left_text; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-left-link"><?php echo $entry_left_link; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="left_link" class="form-control" id="input-left-link" value="<?php echo $left_link; ?>" placeholder="<?php echo $entry_left_link; ?>">
                                <?php if ($error_left_link) { ?>
                                    <div class="text-danger"><?php echo $error_left_link; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <br>

                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-top-image"><?php echo $entry_top_image; ?></label>
                            <div class="col-sm-10">
                                <a href="" id="top-image" data-toggle="image" class="img-thumbnail">
                                    <img src="<?php echo $top_image_thumb; ?>" />
                                </a>
                                <?php if ($error_top_image) { ?>
                                    <div class="text-danger"><?php echo $error_top_image; ?></div>
                                <?php } ?>
                                <input type="hidden" name="top_image" value="<?php echo $top_image; ?>" id="input-top-image" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-top-text"><?php echo $entry_top_text; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="top_text" class="form-control" id="input-top-text" value="<?php echo $top_text; ?>" placeholder="<?php echo $entry_top_text; ?>">
                                <?php if ($error_top_text) { ?>
                                    <div class="text-danger"><?php echo $error_top_text; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-top-link"><?php echo $entry_top_link; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="top_link" class="form-control" id="input-top-link" value="<?php echo $top_link; ?>" placeholder="<?php echo $entry_top_link; ?>">
                                <?php if ($error_top_link) { ?>
                                    <div class="text-danger"><?php echo $error_top_link; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <br>

                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-right-image"><?php echo $entry_right_image; ?></label>
                            <div class="col-sm-10">
                                <a href="" id="right-image" data-toggle="image" class="img-thumbnail">
                                    <img src="<?php echo $right_image_thumb; ?>" />
                                </a>
                                <?php if ($error_right_image) { ?>
                                    <div class="text-danger"><?php echo $error_right_image; ?></div>
                                <?php } ?>
                                <input type="hidden" name="right_image" value="<?php echo $right_image; ?>" id="input-right-image" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-right-text"><?php echo $entry_right_text; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="right_text" class="form-control" id="input-right-text" value="<?php echo $right_text; ?>" placeholder="<?php echo $entry_right_text; ?>">
                                <?php if ($error_right_text) { ?>
                                    <div class="text-danger"><?php echo $error_right_text; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-right-link"><?php echo $entry_right_link; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="right_link" class="form-control" id="input-right-link" value="<?php echo $right_link; ?>" placeholder="<?php echo $entry_right_link; ?>">
                                <?php if ($error_right_link) { ?>
                                    <div class="text-danger"><?php echo $error_right_link; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <br>

                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-bottom-image"><?php echo $entry_bottom_image; ?></label>
                            <div class="col-sm-10">
                                <a href="" id="bottom-image" data-toggle="image" class="img-thumbnail">
                                    <img src="<?php echo $bottom_image_thumb; ?>" />
                                </a>
                                <?php if ($error_bottom_image) { ?>
                                    <div class="text-danger"><?php echo $error_bottom_image; ?></div>
                                <?php } ?>
                                <input type="hidden" name="bottom_image" value="<?php echo $bottom_image; ?>" id="input-bottom-image" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-bottom-text"><?php echo $entry_bottom_text; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="bottom_text" id="input-bottom-text" value="<?php echo $bottom_text; ?>" class="form-control" placeholder="<?php echo $entry_bottom_text; ?>">
                                <?php if ($error_bottom_text) { ?>
                                    <div class="text-danger"><?php echo $error_bottom_text; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-bottom-link"><?php echo $entry_bottom_link; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="bottom_link" id="input-bottom-link" value="<?php echo $bottom_link; ?>" class="form-control" placeholder="<?php echo $entry_bottom_link; ?>">
                                <?php if ($error_bottom_link) { ?>
                                    <div class="text-danger"><?php echo $error_bottom_link; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
                            <div class="col-sm-10">
                                <select name="status" id="input-status" class="form-control">
                                    <?php if ($status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<?php echo $footer; ?>