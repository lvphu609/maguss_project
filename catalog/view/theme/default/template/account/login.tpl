<?php echo $header; ?>
<div class="container">
  <?php /* <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul> */ ?>
  <?php if ($success) { ?>
  <div class="alert alert-success" style="margin-right: 19px;"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger" style="margin-right: 19px;"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
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
      <div class="row">
        <!-- <div class="text-header-contact"></div>         -->
        <div class="col-sm-6 box-account-login">
          <div class="title-account-login"><span>ĐĂNG NHẬP</span></div>
          <div class="well box-account-common">
            <h3 class="text-color-common"><?php echo $text_returning_customer; ?></h3>
            <!-- <p><strong><?php // echo $text_i_am_returning_customer; ?></strong></p> -->
            <form autocomplete="off" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <?php echo $entry_email; ?>
                <input value="" autocomplete="off" type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control font-size-common" />
              </div>
              <div class="form-group">
                <?php echo $entry_password; ?>
                <input  value="" autocomplete="off" type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control font-size-common" />
                <a href="<?php echo $forgotten; ?>" class="text-color-common"><?php echo $text_forgotten; ?></a></div>
              <!-- <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary" /> -->
              <a href="javascript:;" onclick="$(this).closest('form').submit(); return false;" class="btn btn-maguss-common btn-letter-space"><span class="">ĐĂNG NHẬP</span></a>
              <?php if ($redirect) { ?>
              <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
              <?php } ?>
            </form>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="title-account-login"><span>ĐĂNG KÝ</span></div>
          <div class="well box-account-common">
            <h3 class="text-color-common"><?php echo $text_new_customer; ?></h3>
            <!-- <p><strong><?php // echo $text_register; ?></strong></p> -->
            <p><?php echo $text_register_account; ?></p>
            <!-- <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a> -->
            <a href="<?php echo $register; ?>" class="btn btn-maguss-common text-place btn-letter-space">ĐĂNG KÝ</a>
            </div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>