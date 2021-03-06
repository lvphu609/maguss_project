<?php /*
<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>

*/
?>
<div class="clear"></div>
<footer>
    <div>
        <div class="row">
            <?php if ($informations) { ?>
                <div class="footer-block footer-block-item col-sm-4">
                    <div class="col-md-offset-2">
                        <ul class="list-unstyled">
                            <?php foreach ($informations as $information) { ?>
                                <li>
                                    <a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a>
                                </li>
                            <?php } ?>
                            <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                        </ul>
                    </div>
                </div>
            <?php } ?>
            <div class="footer-block footer-block-item col-sm-4">
                <div style="padding-left:10px;">
                    <ul class="list-unstyled">
                        <li><span class="ft-span-lable"><h>Hotline: </span><?php echo $telephone; ?></li>
                        <li><span class="ft-span-lable">Showroom: </span><?php echo $address; ?></li>
                        <li>
                            <div class="text-bold" style="width: 30%; float: left;">Thời gian làm việc:</div>
                            <div style="width: 63%; float: left;"><?php echo nl2br($open_time); ?></div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="footer-block-item col-sm-4">
                <div class="col-md-offset-3">
                    <h5 style="letter-spacing: 2px;">Liên kết với chúng tôi</h5>
                    <ul class="list-unstyled link-to-social">

                        <!-- <li class="item-social"></li> -->
                        <!-- <li class="item-social">
                          <a href="#">
                            <img src="image/catalog/icon/social-face.png">
                          </a>
                        </li> -->
                        <!-- <li class="item-social"></li> -->
                        <li class="item-social">
                            <a href="#">
                                <img src="image/catalog/icon/social-twitter.png">
                            </a>
                        </li>
                        <li class="item-social">
                            <a href="https://www.facebook.com/maguss.vn" target="_blank">
                                <img src="image/catalog/icon/social-face.png">
                            </a>
                        </li>
                        <li class="item-social">
                            <a href="#">
                                <img src="image/catalog/icon/google_plus.png">
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->

</body></html>