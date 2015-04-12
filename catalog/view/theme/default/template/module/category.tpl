<div class="menu-category-left">
  <?php function nthLevelMenuModuleCategory($category,$parts,$level){ ob_start(); ?>
        <?php if (!empty($category['children'])) { ?>
          <?php foreach ($category['children'] as $child) { ?>
          <?php if (in_array($child['category_id'],$parts)) { ?>
          <a href="<?php echo $child['href']; ?>" class="list-group-item active list-group-item-child"> <span style="margin-left: <?php echo 8*count($level); ?>px; "></span> <?php echo $child['name']; ?></a>
          <?php } else { ?>
          <a href="<?php echo $child['href']; ?>" class="list-group-item list-group-item-child"><span style="margin-left: <?php echo 8*count($level); ?>px; "> </span><?php echo $child['name']; ?></a>
          <?php } ?>
          <?php if(!empty($child['children'])) { ?>
          <?php echo nthLevelMenuModuleCategory($child,$parts,array_merge($level,array($child['category_id']))); ?>
          <?php } ?>
          <?php } ?>
          <?php } ?>
        <?php $menu = ob_get_contents(); ob_end_clean();  return $menu; } ?>

  <?php foreach ($categories as $category) { ?>
    <?php if ($category['category_id'] == $category_id) { ?>
      <a href="<?php echo $category['href']; ?>" class="list-group-item active list-group-item-parent"><?php echo $category['name']; ?></a>
      <?php if ($category['children']) { ?>
        <?php foreach ($category['children'] as $child) { ?>
          <?php if ($child['category_id'] == $child_id) { ?>
          <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp; <?php echo $child['name']; ?></a>
          <?php if(!empty($child['children'])) { ?>
                <?php echo nthLevelMenuModuleCategory($child,$parts,array($category['category_id'],$child['category_id']));?>
                <?php } ?>
          <?php } else { ?>
          <a href="<?php echo $child['href']; ?>" class="list-group-item list-group-item-child">&nbsp;&nbsp;&nbsp; <?php echo $child['name']; ?></a>
                <?php if(!empty($child['children'])) { ?>
                <?php echo nthLevelMenuModuleCategory($child,$parts,array($category['category_id'],$child['category_id']));?>
                <?php } ?>
          <?php } ?>
        <?php } ?>
      <?php } ?>
    <?php } else { ?>
      <a href="<?php echo $category['href']; ?>" class="list-group-item parent list-group-item-parent"><?php echo $category['name']; ?></a>
      <?php } ?>
  <?php } ?>
</div>
