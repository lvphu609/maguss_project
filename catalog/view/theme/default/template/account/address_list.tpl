<?php echo $header; ?>
<div class="container">
  <?php /*<ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul> */ ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
      <div class="text-header-contact"><span><?php echo $text_address_book; ?></span></div>
      <?php if ($addresses) { ?>
      <table class="table table-bordered table-hover">
        <?php foreach ($addresses as $result) { ?>
        <tr>
          <td class="text-left"><?php echo $result['address']; ?></td>
          <td class="text-right">
            <a href="<?php echo $result['update']; ?>" class="btn btn-maguss-common"><?php // echo $button_edit; ?>SỬA</a> &nbsp; 
           <?php /* <a href="<?php echo $result['delete']; ?>" class="btn btn-maguss-common"><?php // echo $button_delete; ?>XÓA</a></td> */ ?>
        </tr>
        <?php } ?>
      </table>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-left">
          <a href="<?php echo $back; ?>" class="btn btn-maguss-common btn-letter-space"><?php // echo $button_back; ?>TRANG TRƯỚC</a></div>
        <?php /* <div class="pull-right"><a href="<?php echo $add; ?>" class="btn btn-maguss-common btn-letter-space"><?php // echo $button_new_address; ?> THÊM ĐỊA CHỈ MỚI</a></div> */ ?>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>