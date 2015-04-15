<?php
class ControllerModuleViewed extends Controller {
	public function index($setting) {
		$this->load->language('module/viewed');

		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
		$this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.transitions.css');
		$this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

        $products = array();

        if (isset($this->request->cookie['viewed'])) {
            $products = explode(',', $this->request->cookie['viewed']);
        } else if (isset($this->session->data['viewed'])) {
            $products = $this->session->data['viewed'];
        }

        if (isset($this->request->get['route']) && $this->request->get['route'] == 'product/product') {
            $product_id = $this->request->get['product_id'];
            $products = array_diff($products, array($product_id));
            array_unshift($products, $product_id);
            setcookie('viewed', implode(',',$products), time() + 60 * 60 * 24 * 30, '/');//, $this->request->server['HTTP_HOST']);
        }

		if (empty($setting['limit'])) {
			$setting['limit'] = 4;
		}

		$products = array_slice($products, 0, (int)$setting['limit'] + 1);

		foreach ($products as $key => $product_id) {
			if($key != 0){
				$product_info = $this->model_catalog_product->getProduct($product_id);

				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}

					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}

					if ($this->config->get('config_tax')) {
						$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
					} else {
						$tax = false;
					}

					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}

					//get quantity detail
					$quantity_detail = !empty($product_info['quantity_detail']) ? $product_info['quantity_detail'] : '[]' ;
					$quantityDetail = json_decode($quantity_detail, true);
					if (count($quantityDetail) > 0) {
						foreach ($quantityDetail as $key => $value) {
							if (count($value['images']) > 0) {
								foreach ($value['images'] as $imgKey => $img) {
									$quantityDetail[$key]['images'][$imgKey]['url'] = $this->model_tool_image->resize($img['name'], 500, 700);
								}
							}
						}
						$quantityDetail = $quantityDetail;
					} else {
						$quantityDetail = array();
					}
					$data['products'][] = array(
						'product_id'  => $product_info['product_id'],
						'thumb'       => $image,
						'name'        => $product_info['name'],
						'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
						'price'       => $price,
						'special'     => $special,
						'tax'         => $tax,
						'rating'      => $rating,
						'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
						'quantity_detail' => $quantityDetail
					);
				}
			}
		}

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/viewed.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/viewed.tpl', $data);
			} else {
				return $this->load->view('default/template/module/viewed.tpl', $data);
			}
		}
	}
}