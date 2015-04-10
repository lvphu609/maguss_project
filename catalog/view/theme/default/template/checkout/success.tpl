<?php echo $header; ?>
<div class="container">
  <?php /*<ul class="breadcrumb">
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
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
       	<div class="text-header-common"><span>HOÀN TẤT</span></div>

        <div class="box-checkout-finish text-center col-md-7 col-md-offset-2">
       		<div class="message-title">BẠN ĐÃ ĐẶT HÀNG THÀNH CÔNG!</div>
       		<div class="content-success">
       			<div class="content-item con-first">Mã số đơn hàng của bạn là #543231</div>
       			<div class="content-item">Nhân viên Maguss sẽ liên lạc với bạn trong vòng 24 giờ</div>
				<div class="content-item">Để theo dõi tình trạng đơn hàng, vui lòng vào 
					<a href="<?php echo $order; ?>" class="manage-order">Quản lý đơn hàng</a>
				</div>
       		</div>
       		<div class="image-letter text-center">
       			<img src="image/letter.png">
       		</div>
       		<div class="maguss-logo-bottom">maguss.vn</div>
        </div>
        <div class="clear"></div>
        <div class="box-run-shipping">
        	<img src="image/run_shipping.png">
        </div>


      <?php // echo $text_message; ?>
      <?php /* <div class="buttons">
        <div class="pull-right">
          <a href="<?php echo $continue; ?>" class="btn btn-maguss-common">TIẾP TỤC MUA HÀNG<?php // echo $button_continue; ?></a></div>
      </div> */ ?>
      <?php echo $content_bottom; ?>
    </div>
    <?php echo $column_right; ?></div>
</div>
<div class="margin-bottom-10"></div>
<?php echo $footer; ?>