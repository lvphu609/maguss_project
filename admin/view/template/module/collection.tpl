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
                            <label class="col-sm-2 control-label required" for="input-left-image-link">Left Image Link</label>
                            <div class="col-sm-10">
                                <input type="text" name="left_image_link" value="<?php echo $left_image_link; ?>" placeholder="Left image link" id="input-left-image-link" class="form-control" />
                                <?php if ($error_left_image_link) { ?>
                                    <div class="text-danger"><?php echo $error_left_image_link; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-left-text"><?php echo $entry_left_text; ?></label>
                            <div class="col-sm-10">
                                <textarea name="left_text" id="input-left-text">
                                    <?php echo $left_text; ?>
                                </textarea>
                                <?php if ($error_left_text) { ?>
                                    <div class="text-danger"><?php echo $error_left_text; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-center-text"><?php echo $entry_center_text; ?></label>
                            <div class="col-sm-10">
                                <textarea name="center_text" id="input-center-text">
                                    <?php echo $center_text; ?>
                                </textarea>
                                <?php if ($error_center_text) { ?>
                                    <div class="text-danger"><?php echo $error_center_text; ?></div>
                                <?php } ?>
                            </div>
                        </div>
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
                            <label class="col-sm-2 control-label required" for="input-right-image-link">Right Image Link</label>
                            <div class="col-sm-10">
                                <input type="text" name="right_image_link" value="<?php echo $right_image_link; ?>" placeholder="Right image link" id="input-right-image-link" class="form-control" />
                                <?php if ($error_right_image_link) { ?>
                                    <div class="text-danger"><?php echo $error_right_image_link; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-right-text"><?php echo $entry_right_text; ?></label>
                            <div class="col-sm-10">
                                <textarea name="right_text" id="input-right-text">
                                    <?php echo $right_text; ?>
                                </textarea>
                                <?php if ($error_right_text) { ?>
                                    <div class="text-danger"><?php echo $error_right_text; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-bottom-text"><?php echo $entry_bottom_text; ?></label>
                            <div class="col-sm-10">
                                <input type="text" name="bottom_text" id="input-bottom-text" value="<?php echo $bottom_text; ?>" class="form-control">
                                <?php if ($error_bottom_text) { ?>
                                    <div class="text-danger"><?php echo $error_bottom_text; ?></div>
                                <?php } ?>
                            </div>
                        </div>
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
                            <label class="col-sm-2 control-label required" for="input-bottom-image-link">Bottom Image Link</label>
                            <div class="col-sm-10">
                                <input type="text" name="bottom_image_link" value="<?php echo $bottom_image_link; ?>" placeholder="Bottom image link" id="input-bottom-image-link" class="form-control" />
                                <?php if ($error_bottom_image_link) { ?>
                                    <div class="text-danger"><?php echo $error_bottom_image_link; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-small-left-image"><?php echo $entry_small_left_image; ?></label>
                            <div class="col-sm-10">
                                <a href="" id="small-left-image" data-toggle="image" class="img-thumbnail">
                                    <img src="<?php echo $small_left_image_thumb; ?>" />
                                </a>
                                <?php if ($error_small_left_image) { ?>
                                    <div class="text-danger"><?php echo $error_small_left_image; ?></div>
                                <?php } ?>
                                <input type="hidden" name="small_left_image" value="<?php echo $small_left_image; ?>" id="input-small-left-image" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-small-left-image-link">Small Left Image Link</label>
                            <div class="col-sm-10">
                                <input type="text" name="small_left_image_link" value="<?php echo $small_left_image_link; ?>" placeholder="Small left image link" id="input-small-left-image-link" class="form-control" />
                                <?php if ($error_small_left_image_link) { ?>
                                    <div class="text-danger"><?php echo $error_small_left_image_link; ?></div>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-small-right-image"><?php echo $entry_small_right_image; ?></label>
                            <div class="col-sm-10">
                                <a href="" id="small-right-image" data-toggle="image" class="img-thumbnail">
                                    <img src="<?php echo $small_right_image_thumb; ?>" />
                                </a>
                                <?php if ($error_small_right_image) { ?>
                                    <div class="text-danger"><?php echo $error_small_right_image; ?></div>
                                <?php } ?>
                                <input type="hidden" name="small_right_image" value="<?php echo $small_right_image; ?>" id="input-small-right-image" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label required" for="input-small-right-image-link">Small Right Image Link</label>
                            <div class="col-sm-10">
                                <input type="text" name="small_right_image_link" value="<?php echo $small_right_image_link; ?>" placeholder="Small right image link" id="input-small-right-image-link" class="form-control" />
                                <?php if ($error_small_right_image_link) { ?>
                                    <div class="text-danger"><?php echo $error_small_right_image_link; ?></div>
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
        <script type="text/javascript"><!--
            $('textarea').summernote({
                height: '100px',
                toolbar: [
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ['font', ['strikethrough']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['height', ['height']]
                ]
            });
            //-->
        </script>
    </div>
<?php echo $footer; ?>