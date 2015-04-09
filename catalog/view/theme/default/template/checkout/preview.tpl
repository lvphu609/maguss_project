<div class="panel-body pan-order-preview">
    <?php foreach ($products as $product) : ?>
        <div class="text-right">
            <a href="<?php echo $product['href']; ?>">
                <?php echo $product['name']; ?> - Size: <strong style="text-transform: uppercase;"><?php echo $product['size_label']; ?></strong> -  Color:
            </a>
            <span class="color-preview" style="background-color: <?php echo $product['color']; ?>;"></span>
            <p>
                <?php echo $product['price']; ?> x <?php echo $product['quantity'] ?>
            </p>
        </div>
    <?php endforeach; ?>
</div>