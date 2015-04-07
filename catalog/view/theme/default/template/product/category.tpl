<?php echo $header; ?>
<!-- <div class="container"> -->
<div>
  <!-- <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul> -->
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="text-header"><span><?php echo $heading_title; ?></span></div>
      <?php if ($thumb || $description) { ?>
      <?php /*<div class="row">
        <?php if ($thumb) { ?>
        <div class="col-sm-2"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="col-sm-10"><?php echo $description; ?></div>
        <?php } ?>
      </div>
      <hr> */ ?>
      <?php } ?>

      <?php /* if ($categories) { ?>
      <h3><?php echo $text_refine; ?></h3>
      <?php if (count($categories) <= 5) { ?>
      <div class="row">
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <?php } else { ?>
      <div class="row">
        <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
        <div class="col-sm-3">
          <ul>
            <?php foreach ($categories as $category) { ?>
            <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <?php } ?>
      </div>
      <?php } ?>
      <?php } */ ?>

      <?php if ($products) { ?>
      <?php /* <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p>
      <div class="row">
        <div class="col-md-4">
          <div class="btn-group hidden-xs">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-md-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-3 text-right">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-2 text-right">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <br /> */ ?>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid product-item col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="product-thumb product-id-<?php echo $product['product_id']; ?>">
            <div class="popper-color-content hide">
              <?php  $product_thumb = ""; ?>
              <?php  if(count($product['quantity_detail'])>0) : ?>
                <?php $colorUsed = array(); ?>
                <?php foreach ($product['quantity_detail'] as $key => $groupColor) : ?>
                  <?php if (!in_array($groupColor['color'], $colorUsed)) : ?>
                    <?php array_push($colorUsed, $groupColor['color']); ?>
                    <?php if(count($groupColor['images']) > 0) : ?>
                        <?php foreach ($groupColor['images'] as $key1 => $img) : ?>
                          <?php
                            if($key == 0 && $key1 == 0){
                              $product_thumb = $img['url'];
                            }
                          ?>
                          <?php  if($key1 == 0) : ?>
                              <div  class="color-item <?php echo ($key == 0 ? 'active' : ''); ?>" style="background-color:<?php echo $groupColor['color']; ?>" data-color="<?php echo $groupColor['color']; ?>" data-url="<?php echo $img['url']; ?>" data-root="product-id-<?php echo $product['product_id']; ?>"> </div>
                          <?php  endif; ?>                                   
                          
                        <?php endforeach; ?>
                    <?php endif; ?>              
                  <?php endif; ?>
                <?php endforeach; ?>
              <?php endif;  ?>
            </div>

            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product_thumb; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="line-item text-center"><hr></div>
              <div class="caption text-center">
                <span class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
                <p><?php echo $product['description']; ?></p>
                <?php if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } ?>
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-old"><?php echo $product['price']; ?></span> </br>
                  <span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                  <?php /* if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } */ ?>
                </p>
                <?php } ?>
              </div>
              <div class="button-group-item text-center">
                 <a href="javascript:;" class="btn btn-product-item" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span class=""><?php echo $button_cart; ?></span></a>
                <a href="javascript:;" class="btn btn-product-item popper_color product-id-<?php echo $product['product_id']; ?>" type="button" data-toggle="popover" ><span class="">XEM MÀU</span></a>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <?php /*<div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div> */ ?>
      <?php } /* ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php //echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } */ ?>
      <?php // echo $content_bottom; ?></div>
    <?php //echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
