<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title; ?></title>
    <base href="<?php echo $base; ?>"/>
    <?php if ($description) { ?>
        <meta name="description" content="<?php echo $description; ?>"/>
    <?php } ?>
    <?php if ($keywords) { ?>
        <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } ?>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta property="fb:admins" content="100000240891588"/>
    <meta property="fb:app_id" content="839795079409803"/>
    <?php if ($icon) { ?>
        <link href="<?php echo $icon; ?>" rel="icon"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
        <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/resource/jcarousel/jsCarousel-2.0.0.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/resource/jcarousel/jsCarousel-2.0.0.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="catalog/view/javascript/resource/zoomsl-3.0.js"></script>
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen"/>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css"/>
    <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
    <link href="catalog/view/theme/default/stylesheet/jquery-ui.min.css" rel="stylesheet">
    <?php foreach ($styles as $style) { ?>
        <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>"
              media="<?php echo $style['media']; ?>"/>
    <?php } ?>
    <link href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css" rel="stylesheet">
    <script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($scripts as $script) { ?>
        <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <script src="catalog/view/javascript/jquery.sticky.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery-ui.min.js" type="text/javascript"></script>
    <?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">

<header class="box-menu-top">
    <div class="mg-menu-top">
        <div class="mn-top">
            <div class="pull-left col-xs-5 col-sm-4 col-md-3 col-lg-2 mgtop5">
                <?php echo $search; ?>
            </div>
            <?php echo $language; ?>
            <div id="top-links" class="nav pull-right mgtop5">
                <ul class="list-inline">
                    <li>
                        <a href="<?php echo $contact; ?>">
                            <i class="fa fa-phone"></i>
                            <span class="hidden-xs hidden-sm hidden-md"> LIÊN HỆ<?php // echo $telephone; ?></span>
                        </a>
                    </li>
                    <li>
                        <a href="<?php echo $shopping_cart; ?>">
                            <i class="fa fa-shopping-cart"></i>
                            <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span>
                        </a>
                    <li>
                        <a href="<?php echo $checkout; ?>">
                            <i class="fa fa-share"></i>
                            <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span>
                        </a>
                    <li class="dropdown">
                        <a href="<?php echo $account; ?>" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-user"></i>
                            <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <?php if ($logged) { ?>
                                <li><a href="<?php echo $account; ?>">Tài khoản</a></li>
                                <?php /*  <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
                                <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li> */
                                ?>
                                <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                            <?php } else { ?>
                                <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
                                <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
                            <?php } ?>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
        <div class="mn-mid">
            <div class="text-center">
                <a href="#">
                    <img class="logo-maguss" src="<?php echo $logo; ?>">
                </a>
            </div>
        </div>
        <div class="mn-bottom">
            <div id="logo_sticky_maguss" class="pull-left col-lg-2 div-hide">
                <img src="image/icon/logo_maguss.png" height="40">
            </div>
            <div class="text-center col-lg-12 mn-top-logo">
                <?php if ($categories) { ?>
                    <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                            <span class="mn-top-item <?php echo ($category_id == $category['id'] ? 'active' : ''); ?>">
                                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                                <div class="sub-menu-content hidden">
                                    <div class="ui-tooltip-menu-top">
                                        <div class="box-sub-menu row">
                                            <div class="col-sm-2 submenu">
                                                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                                    <?php foreach ($children as $child) { ?>
                                                        <?php if (isset($child['children'])) { ?>
                                                            <?php echo nthLevelMenu($child, $text_all); ?>
                                                        <?php } else { ?>
                                                            <ul class="list-unstyled">
                                                                <li class="title">
                                                                    <a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a>
                                                                </li>
                                                            </ul>
                                                        <?php } ?>
                                                    <?php } ?>
                                                <?php } ?>
                                            </div>
                                            <div class="col-sm-10">
                                                <?php if (!empty($category['products'])): ?>
                                                    <div class="submenu-product-item">
                                                        <?php foreach ($category['products'] as $categoryProduct): ?>
                                                            <div class="item">
                                                                <div class="sub-image">
                                                                    <a href="<?php echo $categoryProduct['href']; ?>"><img src="<?php echo $categoryProduct['thumb']; ?>" class="img-responsives" /></a>
                                                                </div>
                                                                <div class="sub-label">
                        <?php if ($categoryProduct['price']) { ?>
                              <?php if (!$categoryProduct['special']) { ?>
                                <span class="pro-info-price"><?php echo $categoryProduct['price']; ?></span>
                              <?php } else { ?>
                                <div><span class="pro-info-price-new"><?php echo $categoryProduct['special']; ?></span></div>
                        <?php } } ?>
                                                                </div>
                                                            </div>
                                                        <?php endforeach; ?>
                                                    </div>
                                                <?php endif; ?>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="menu-see-all text-center">
                                        <a href="<?php echo $category['href']; ?>"
                                           class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a>
                                    </div>
                                </div>
                            </span>
                        <?php } else { ?>
                            <span class="mn-top-item <?php echo ($category_id == $category['id'] ? 'active' : ''); ?>">
                                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                            </span>
                        <?php } ?>
                    <?php } ?>
                <?php } ?>                
                <div class="clear"></div>
            </div>
            <div id="input_search_sticky" class="pull-right col-lg-2 div-hide">
                <?php echo $search; ?>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</header>

<?php function nthLevelMenu($category, $text_all)
{
    ob_start(); ?>
    <ul class="list-unstyled">
        <?php if (!empty($category['children'])) { ?>
            <li class="title"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"
                                 data-toggle="dropdown"><?php echo $category['name']; ?></a></li>

            <?php
            foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) {
                ?>
                <?php foreach ($children as $child) { ?>
                    <?php if (!empty($child['children'])) { ?>
                        <?php echo nthLevelMenu($child, $text_all); ?>
                    <?php } else { ?>

                        <?php if (isset($child['children'])) { ?>
                            <?php echo nthLevelMenu($child, $text_all); ?>
                        <?php } else { ?>
                            <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                        <?php } ?>

                    <?php } ?>
                <?php } ?>
            <?php } ?>

            <!-- <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['seeallname']; ?></a>-->
        <?php } else { ?>
            <li class="title"><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
    </ul>
    <?php $menu = ob_get_contents();
    ob_end_clean();
    return $menu;
} ?>
            



