<div class="panel-body">
    <?php foreach ($products as $product) : ?>
        <div class="text-right">
            <a href="<?php echo $product['href']; ?>">
                <?php echo $product['name']; ?> - Size: <?php echo $product['size_label']; ?> -  Color:
            </a>
            <span class="color-preview" style="background-color: <?php echo $product['color']; ?>;"></span>
        </div>
    <?php endforeach; ?>
</div>