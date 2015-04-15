<?php echo $header; ?>
<!-- <div class="container"> -->
  <?php /* <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul> */ ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>      
     <?php /* <label class="control-label" for="input-search"><?php echo $entry_search; ?></label>
      <div class="row">
        <div class="col-sm-4">
          <input type="text" name="search" value="<?php echo $search; ?>" placeholder="<?php echo $text_keyword; ?>" id="input-search" class="form-control" />
        </div>
        <div class="col-sm-3">
          <select name="category_id" class="form-control">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-3">
          <label class="checkbox-inline">
            <?php if ($sub_category) { ?>
            <input type="checkbox" name="sub_category" value="1" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="sub_category" value="1" />
            <?php } ?>
            <?php echo $text_sub_category; ?></label>
        </div>
      </div> */ ?>
      
      <?php /* <p>
        <label class="checkbox-inline">
          <?php if ($description) { ?>
          <input type="checkbox" name="description" value="1" id="description" checked="checked" />
          <?php } else { ?>
          <input type="checkbox" name="description" value="1" id="description" />
          <?php } ?>
          <?php echo $entry_description; ?></label>
      </p>
      <input type="button" value="<?php echo $button_search; ?>" id="button-search" class="btn btn-primary" /> */ ?>
      <h2><?php //echo $text_search; ?></h2>
      <?php if ($products) { ?>
      <?php /* <p><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></p> */ ?>
      
      <?php /* <div class="row">
        <div class="col-sm-3 hidden-xs">
          <div class="btn-group">
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
            <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
          </div>
        </div>
        <div class="col-sm-1 col-sm-offset-2 text-right">
          <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-sm-3 text-right">
          <select id="input-sort" class="form-control col-sm-3" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-sm-1 text-right">
          <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-sm-2 text-right">
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
      <div class="container">
        <div class="text-header" style="margin-bottom: 10px; margin-top:-5px;"><span><?php echo $heading_title; ?></span></div>
        <?php foreach ($products as $key => $product) { ?>
        <?php  if($key%3 == 0) { ?>
          <div class="row row-category-product col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <?php  } ?>
        <div class="product-layout product-grid product-item col-lg-4 col-md-4 col-sm-4 col-xs-12">
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

            <div class="image">
              <a href="<?php echo $product['href']; ?>">
                <?php if ($product['special']) { ?>
                  <div class="box-label-status">
                    <div class="label-status sale-off">SALE OFF</div>                
                  </div>
                <?php } else if ($product['is_new'] == 1) { ?>
                      <div class="box-label-status">
                        <div class="label-status new">NEW</div>
                      </div>
                <?php } ?>
                <img src="<?php echo $product_thumb; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" />
              </a>
              <div class="clear"></div>
            </div>
            <div class="line-item text-center"><hr></div>
              <div class="caption text-center">
                <div class="top-desc">
                  <span class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></span>
                  <p><?php  echo $product['meta_description']; ?></p>
                </div>
                <?php /*  if ($product['rating']) { ?>
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php } */ ?>
                <div class="box-price">
                <?php if ($product['price']) { ?>
                <p class="price">
                  <?php if (!$product['special']) { ?>
                  <?php echo $product['price']; ?>
                  <?php } else { ?>
                  <span class="price-old" style="color: red;"><span style="color: #63c6c1;"><?php echo $product['price']; ?></span></span> </br>
                  <span class="price-new"><?php echo $product['special']; ?></span>
                  <?php } ?>
                  <?php /* if ($product['tax']) { ?>
                  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                  <?php } */ ?>
                </p>
                <?php } ?>
                </div>
              </div>
              <div class="button-group-item text-center">
                 <a href="<?php echo $product['href']; ?>" class="btn btn-product-item"><span class=""><?php echo $button_cart; ?></span></a>
                <a href="javascript:;" class="btn btn-product-item popper_color product-id-<?php echo $product['product_id']; ?>" type="button" data-toggle="popover" ><span class="">XEM MÀU</span></a>
              </div>
            </div>
          </div>
        <?php  if($key/3 === 2) { ?>
          </div>
        <?php  } ?>
      <?php } ?>
      <?php } else { ?>
      <div class="search-empty"><p><?php echo $text_empty; ?></p></div>
      <?php } ?>
      <div class="clear"></div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right text-pagination-common"><?php echo $results; ?></div>
      </div>
      <?php // echo $content_bottom; ?>
    <?php // echo $column_right; ?>
    </div>
</div>
<script type="text/javascript"><!--
$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').prop('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var category_id = $('#content select[name=\'category_id\']').prop('value');
	
	if (category_id > 0) {
		url += '&category_id=' + encodeURIComponent(category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').prop('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'category_id\']').on('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').prop('disabled', true);
	} else {
		$('input[name=\'sub_category\']').prop('disabled', false);
	}
});

$('select[name=\'category_id\']').trigger('change');
--></script> 

<br>
<?php echo $footer; ?> 