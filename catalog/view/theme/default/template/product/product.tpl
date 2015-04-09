<?php echo $header; ?>
<?php $productCurrent = array(); ?>
<!-- <div class="container col-sm-12 col-sm-12 col-sm-12 col-sm-12"> -->
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row" id="product">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="pro-box-image <?php echo $class; ?>">
            <!-- box large -->
            <div class="box-image-product-large col-xs-12 col-sm-12 col-lg-12" id="box-product-image-lg">
                <?php if(count($group_product_color)>0 && !empty($group_product_color[0]) ) : ?>
                  <?php $groupColor = $group_product_color[0]; ?>
                      <?php if(count($groupColor['images']) > 0) : ?>

                          <?php $imgFirst = ""; ?>

                         <div class="col-xs-12 col-sm-12 col-lg-2 box-item-image">
                            <?php foreach ($groupColor['images'] as $key => $img) : ?>
                              <?php  if ($key == 0){ 
                              			$imgFirst = $img['url']; 
                              			$productCurrent['image_url'] = $img['url'];
                              		} 
                              ?>
                                  <div class="img-additional" >
                                    <a class="thumbnail img-lg-item" href="javascript:;" title="<?php echo $heading_title; ?>"><img class="mh500" src="<?php echo  $img['url']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"></a>
                                  </div>                              
                            <?php endforeach; ?>
                          </div>
                          <div class="col-xs-10 col-sm-10 col-lg-10 img-first">
                              <div class="img-additional" >
                                <img class="zoom-image-product mh500 img-lg-append" src="<?php echo  $imgFirst; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
                              </div>
                          </div>

                      <?php endif; ?>
                <?php endif; ?>
            </div>
        </div>
        <!-- info -->
          <?php if ($column_left && $column_right) { ?>
          <?php $class = 'col-sm-6'; ?>
          <?php } elseif ($column_left || $column_right) { ?>
          <?php $class = 'col-sm-6'; ?>
          <?php } else { ?>
          <?php $class = 'col-sm-6'; ?>
          <?php } ?>
          <div class="box-info-product-detail <?php echo $class; ?>">
            
            <div class="pro-block pro-info">
              <span class="pro-info-title"><?php echo $heading_title; ?></span>
              <div><span class="pro-info-model"><?php echo $model; ?></span></div>
              <div class="pro-info-manufacturer">
                <?php echo $text_manufacturer; ?> 
                <?php echo $manufacturer; ?>
              </div>
              <?php if ($price) { ?>
                  <?php if (!$special) { ?>
                    <span class="pro-info-price"><?php echo $price; ?></span>
                  <?php } else { ?>
                    <div><span class="pro-info-price-old"><?php echo $price; ?></span></div>
                    <div><span class="pro-info-price-new"><?php echo $special; ?></span></div>
              <?php } } ?>
              
            </div>

            <div class="pro-block pro-option">
              <div id="hid-quantity-detail" class="hide"><?php echo json_encode($group_product_color); ?></div>
              <div class="col-xs-12 col-sm-12 col-lg-12 group-color-product btn-group-color-lg">
                <?php if(count($group_product_color)>0) : ?>
                  <?php $colorUsed = array(); ?>
                  <?php foreach ($group_product_color as $key => $groupColor) : ?>
                    <?php if (!in_array($groupColor['color'], $colorUsed)) : ?>
                      <?php array_push($colorUsed, $groupColor['color']); ?>
                      <div  class="color-item-product-detail-lg <?php echo ($key == 0 ? 'active' : ''); ?>" style="background-color:<?php echo $groupColor['color']; ?>" data-color="<?php echo $groupColor['color']; ?>">
                        <div class="group-color hide">
                            <?php if(count($groupColor['images']) > 0) : ?>
                                <?php $imgFirst = ""; ?>
                                <div class="col-xs-12 col-sm-12 col-lg-2 box-item-image">
                                  <?php foreach ($groupColor['images'] as $key => $img) : ?>
                                    <?php  if ($key == 0){ $imgFirst = $img['url']; } ?>
                                        <div class="img-additional" >
                                          <a class="thumbnail img-lg-item" href="javascript:;" title="<?php echo $heading_title; ?>"><img class="mh500" src="<?php echo  $img['url']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>"></a>
                                        </div>                              
                                  <?php endforeach; ?>
                                </div>
                                <div class="col-xs-10 col-sm-10 col-lg-10 img-first">
                                    <div class="img-additional" >
                                      <img class="zoom-image-product mh500 img-lg-append" src="<?php echo  $imgFirst; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
                                    </div>
                                </div>
                            <?php endif; ?>
                        </div>
                      </div>
                    <?php endif; ?>
                <?php endforeach; ?>
              <?php endif; ?> 
              </div>
              <div class="clear"></div>
              <div class="pro-option-select">
                <?php if (count($group_product_color) > 0) : ?>
                  <?php
                    $firstColor = $group_product_color[0]['color'];
                    $productSize = array();
                    foreach ($group_product_color as $key => $value) {
                      if ($value['color'] == $firstColor) {
                        $productSize[(int)array_search($value['size']['size'], $list_product_size)] = $value['size'];  
                      }
                    }
                    ksort($productSize);
                    $firstSize = reset($productSize);
                  ?>                  
                  <select name="size" class="pro-option-select-size">
                    <option value="">Size</option>
                    <?php foreach ($productSize as $key => $row) : ?>
                        <option value="<?php echo $row['size']; ?>">
                          <?php echo $row['label']; ?>
                        </option>
                      <?php endforeach; ?>
                    </select>
                    <select name="quantity" class="pro-option-select-quantity">
                      <option value="">Số lượng</option>
                    <?php for($i=1 ; $i <=100; $i++) { ?>
                        <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                    <?php } ?>
                  </select>
                <?php endif; ?>
                <?php // echo $text_stock;  echo $stock; ?>
                <!-- <span>&nbsp; Vui lòng để lại email/điện thoạiđể liên lạc khi có hàng</span> -->
                <input type="hidden" name="color" id="hid-product-color" value="<?php echo $firstColor; ?>">
                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              </div>
            </div>

            <div class="pro-block pro-desc">
              <span class="pro-desc-title">MÔ TẢ SẢN PHẨM</span>
              <div class="pro-desc-content">
                <?php echo $meta_description; ?>
              </div>
            </div>

            <div class="pro-button-shipping">
               <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block button-shipping"><?php echo $button_cart; ?></button>
            </div>

            <?php if ($review_status) { ?>
                <div class="rating pro-rating">
                  <p>
                    <?php for ($i = 1; $i <= 5; $i++) { ?>
                    <?php if ($rating < $i) { ?>
                    <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } else { ?>
                    <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
                    <?php } ?>
                    <?php } ?>
                    <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> / <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $text_write; ?></a></p>
                  <!-- AddThis Button BEGIN -->
                    <div class="addthis_toolbox addthis_default_style">
                        <a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> 
                        <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> 
                        <a class="addthis_counter addthis_pill_style"></a>
                    </div>
                    <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script> 
                  <!-- AddThis Button END --> 
                </div>
              <?php } ?>
        </div>

          <?php /*   
            <div id="product">
             <?php if ($options) { ?>
              <hr>
              <h3><?php echo $text_option; ?></h3>
              <?php foreach ($options as $option) { ?>
              <?php if ($option['type'] == 'select') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                  </option>
                  <?php } ?>
                </select>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'radio') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'checkbox') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'image') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'text') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'textarea') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'file') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'date') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group date">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'datetime') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group datetime">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'time') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <div class="input-group time">
                  <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                  </span></div>
              </div>
              <?php } ?>
              <?php } ?>
              <?php } ?>
              <?php if ($recurrings) { ?>
              <hr>
              <h3><?php echo $text_payment_recurring ?></h3>
              <div class="form-group required">
                <select name="recurring_id" class="form-control">
                  <option value=""><?php echo $text_select; ?></option>
                  <?php foreach ($recurrings as $recurring) { ?>
                  <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                  <?php } ?>
                </select>
                <div class="help-block" id="recurring-description"></div>
              </div>
              <?php } ?>

            <!-- phucnguyen -->
            <div class="form-group">
              <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
              <div class="input-group">                
                <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                <?php if (count($group_product_color) > 0) : ?>
                  <?php
                    $firstColor = $group_product_color[0]['color'];
                    $productSize = array();
                    foreach ($group_product_color as $key => $value) {
                      if ($value['color'] == $firstColor) {
                        $productSize[(int)array_search($value['size']['size'], $list_product_size)] = $value['size'];  
                      }
                    }
                    ksort($productSize);
                    $firstSize = reset($productSize);
                  ?>
                  <div class="input-group-btn product-detail-size">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Size <span class="pan-select-size"><?php echo $firstSize['label']; ?></span> <span class="caret"></span></button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                      <?php foreach ($productSize as $key => $row) : ?>
                        <li <?php echo ($row['size'] == $firstSize['size'] ? 'class="active"' : ''); ?>><a href="#" class="size-item" data-size="<?php echo $row['size']; ?>"><?php echo $row['label']; ?></a></li>
                      <?php endforeach; ?>
                    </ul>
                  </div>

                <?php endif; ?>
              </div>
                <input type="hidden" name="size" id="hid-product-size" value="<?php echo $firstSize['size'] ?>">
                <input type="hidden" name="color" id="hid-product-color" value="<?php echo $firstColor; ?>">
              <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
              <div id="hid-quantity-detail" class="hide"><?php echo json_encode($group_product_color); ?></div>

                <br />
                <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block"><?php echo $button_cart; ?></button>
              </div>
              <?php if ($minimum > 1) { ?>
              <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
              <?php } ?>
            </div>

            */ ?>

            

        <div class="clear"></div>
        <!-- end info -->
        <div class="tab-product-info col-xs-12 col-sm-12 col-lg-12">
          <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-description" data-toggle="tab"><?php echo $tab_description; ?></a></li>
              <?php if ($attribute_groups) { ?>
              <li><a href="#tab-specification" data-toggle="tab"><?php echo $tab_attribute; ?></a></li>
              <?php } ?>
              <?php if ($review_status) { ?>
              <li><a href="#tab-review" data-toggle="tab"><?php echo $tab_review; ?></a></li>
              <?php } ?>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab-description"><?php echo $description; ?></div>
              <?php if ($attribute_groups) { ?>
              <div class="tab-pane" id="tab-specification">
                <table class="table table-bordered">
                  <?php foreach ($attribute_groups as $attribute_group) { ?>
                  <thead>
                    <tr>
                      <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                    <tr>
                      <td><?php echo $attribute['name']; ?></td>
                      <td><?php echo $attribute['text']; ?></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                  <?php } ?>
                </table>
              </div>
              <?php } ?>
              <?php if ($review_status) { ?>
              <div class="tab-pane" id="tab-review">
                <?php /*<div class="row">
                  <div class="col-sm-12">
                  <div class="fb-comments" data-href="<?php echo $url; ?>" data-colorscheme="<?php echo $color_scheme; ?>" data-numposts="<?php echo $num_posts; ?>" data-order-by="<?php echo $order_by; ?>" data-width="100%"></div>
                  </div>
                </div>

                <div id="fb-root"></div>
                <script>(function(d, s, id) {
                  var js, fjs = d.getElementsByTagName(s)[0];
                  if (d.getElementById(id)) return;
                  js = d.createElement(s); js.id = id;
                  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=<?php echo $app_id; ?>&version=v2.0";
                  fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));</script> */ ?>
                <?php /*<form class="form-horizontal">
                  <div id="review"></div>
                  <h2><?php echo $text_write; ?></h2>
                  <?php if ($review_guest) { ?>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                      <input type="text" name="name" value="" id="input-name" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                      <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                      <div class="help-block"><?php echo $text_note; ?></div>
                    </div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label"><?php echo $entry_rating; ?></label>
                      &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                      <input type="radio" name="rating" value="1" />
                      &nbsp;
                      <input type="radio" name="rating" value="2" />
                      &nbsp;
                      <input type="radio" name="rating" value="3" />
                      &nbsp;
                      <input type="radio" name="rating" value="4" />
                      &nbsp;
                      <input type="radio" name="rating" value="5" />
                      &nbsp;<?php echo $entry_good; ?></div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-captcha"><?php echo $entry_captcha; ?></label>
                      <input type="text" name="captcha" value="" id="input-captcha" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group">
                    <div class="col-sm-12"> <img src="index.php?route=tool/captcha" alt="" id="captcha" /> </div>
                  </div>
                  <div class="buttons">
                    <div class="pull-right">
                      <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                    </div>
                  </div>
                  <?php } else { ?>
                  <?php echo $text_login; ?>
                  <?php } ?>
                </form> */ ?>
              </div>
              <?php } ?>
            </div>
          </div>
          <div class="clear"></div>
          <!-- end tab -->
        
      <?php if ($products) { ?>
      	<div class="lable-related"><span><?php echo $text_related; ?></span></div>
	    <div class="row box-related-product">
	    	
	    	<div class="product-layout product-grid product-item product-item-current col-lg-4 col-md-4 col-sm-6 col-xs-12">
	          <div class="product-thumb">
	            <div class="image"><a href="#"><img src="<?php echo $productCurrent['image_url']; ?>" alt="Quan Jean mua dong" class="img-responsive"></a></div>
	              <div class="line-item text-center"><hr></div>
	              <div class="text-center">
                    <div class="top-desc-pro-detail">
	                   <span class="title"><a href="#"><?php echo $heading_title; ?></a></span>
                    </div>
	              </div>
                  <div class="button-group-item text-center">
                    <a id="button-cart-second" href="javascript:;" class="btn btn-product-item button-shipping-second" type="button">
                    <span class=""><?php echo $button_cart; ?></span></a>
                  </div>
	          </div>
	        </div>

	        <?php foreach ($products as $product) { ?>
	        <div class="product-layout product-grid product-item col-lg-2 col-md-4 col-sm-6 col-xs-12">
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
    	                <p><?php echo $product['meta_description']; ?></p>
                    </div>
	                <?php /* if ($product['rating']) { ?>
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
	                <?php if ($product['price']) { ?>
	                <p class="price">
	                  <?php if (!$product['special']) { ?>
	                  <?php echo $product['price']; ?>
	                  <?php } else { ?>
	                  <span class="price-old"><?php echo $product['price']; ?></span> </br>
	                  <span class="price-new"><?php echo $product['special']; ?></span>
	                  <?php } ?>
	                </p>
	                <?php } ?>
	              </div>
	              <div class="button-group-item text-center">
	                 <a href="<?php echo $product['href']; ?>" class="btn btn-product-item"><span class=""><?php echo $button_cart; ?></span></a>
	                <a href="javascript:;" class="btn btn-product-item popper_color product-id-<?php echo $product['product_id']; ?>" type="button" data-toggle="popover" ><span class="">XEM MÀU</span></a>
	              </div>
	          </div>
	        </div>
	        <?php } ?>
	      </div>
      <?php } ?>
	    <?php echo $content_bottom; ?>
<!-- </div> -->

<!-- end content -->

<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
    var btn = $(this);
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
      var size = $('.pro-option-select-size').val();
      var quantity = $('.pro-option-select-quantity').val();
      if(size == ""){
        alert('Bạn chưa chọn size!');
        return false;
      }else 
      if(quantity == ""){
          alert('Bạn chưa chọn số lượng!');
          return false;
      }
			btn.prop('disabled', true);
            btn.addClass('loading');
		},
		complete: function() {
            btn.prop('disabled', false);
            btn.removeClass('loading');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));
						
						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}
				
				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}
				
				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}
			
			if (json['success']) {
				/*$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow');
				
				$('#cart > ul').load('index.php?route=common/cart/info ul li');*/
                window.location = json['shopping_cart_url'];
			}
		}
	});
});

$('#button-cart-second').on('click', function() {
    var btn = $(this);
    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
        dataType: 'json',
        beforeSend: function() {
      var size = $('.pro-option-select-size').val();
      var quantity = $('.pro-option-select-quantity').val();
      if(size == ""){
        alert('Bạn chưa chọn size!');
        return false;
      }else 
      if(quantity == ""){
          alert('Bạn chưa chọn số lượng!');
          return false;
      }
            btn.prop('disabled', true);
            btn.addClass('loading');
        },
        complete: function() {
            btn.prop('disabled', false);
            btn.removeClass('loading');
        },
        success: function(json) {
            $('.alert, .text-danger').remove();
            $('.form-group').removeClass('has-error');

            if (json['error']) {
                if (json['error']['option']) {
                    for (i in json['error']['option']) {
                        var element = $('#input-option' + i.replace('_', '-'));
                        
                        if (element.parent().hasClass('input-group')) {
                            element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                        } else {
                            element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                        }
                    }
                }
                
                if (json['error']['recurring']) {
                    $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                }
                
                // Highlight any found errors
                $('.text-danger').parent().addClass('has-error');
            }
            
            if (json['success']) {
                /*$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                
                $('#cart-total').html(json['total']);
                
                $('html, body').animate({ scrollTop: 0 }, 'slow');
                
                $('#cart > ul').load('index.php?route=common/cart/info ul li');*/
                window.location = json['shopping_cart_url'];
            }
        }
    });
});

//--></script> 
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');
	
	$('#form-upload input[name=\'file\']').trigger('click');
	
	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);
			
			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();
					
					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}
					
					if (json['success']) {
						alert(json['success']);
						
						$(node).parent().find('input').attr('value', json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script> 
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
  e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
			$('#captcha').attr('src', 'index.php?route=tool/captcha#'+new Date().getTime());
			$('input[name=\'captcha\']').val('');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();
			
			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}
			
			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
				
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
      type:'image',
      delegate: 'a',
      gallery: {
        enabled:true
      },
        callbacks: {
          open: function() {
           $('.mfp-figure').zoom({
              touch: true,
              on: 'mouseover'
              // url: 'https://nodogaboutit.files.wordpress.com/2012/10/j04310181.jpg'
            });
         }
        }
    });
  $('.img-first').magnificPopup({
      type:'image',
      delegate: 'a',
      gallery: {box-product-image
        enabled:true
      },
        callbacks: {
          open: function() {
           $('.mfp-figure').zoom({
              touch: true,
              on: 'mouseover'
              // url: 'https://nodogaboutit.files.wordpress.com/2012/10/j04310181.jpg'
            });
         }
        }
    });  
});
//--></script>
