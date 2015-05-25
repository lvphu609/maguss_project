<div class="clear"></div>
<div class="lable-viewed"><?php echo $heading_title; ?></div>
<!-- <div class="row box-related-product"> -->
  <?php /* foreach ($products as $product) { ?>
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
    <?php } */ ?>

    <div id="carousel_viewed" class="owl-carousel box-product-viewed">
      <?php foreach ($products as $product) { ?>
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
                          <?php endforeach; ?>
                      <?php endif; ?>              
                    <?php endif; ?>
                  <?php endforeach; ?>
                <?php endif; ?> 
            <span class="item text-center ">
                <?php if ($product['href']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product_thumb; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                <?php } else { ?>
                <img src="<?php echo $product_thumb; ?>" alt="<?php echo $product['name']; ?>" class="img-responsive" />
                <?php } ?>
            </span>
      <?php } ?>
    </div>
    <script type="text/javascript"><!--
    $('#carousel_viewed').owlCarousel({
      items: 5,
      autoPlay: 3000,
      navigation: true,
      navigationText: ['<i class="fa fa-angle-left fa-2x"></i>', '<i class="fa fa-angle-right fa-2x"></i>'],
      pagination: false
    });
    --></script>
<!-- </div> -->
