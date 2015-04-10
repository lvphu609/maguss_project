<?php
class ControllerCommonHeader extends Controller {
	private function nthLevelMenu($categories) {
		// get last category id
		$category_id = end($categories);
		
		$children = $this->model_catalog_category->getCategories($category_id['category_id']);
		$nthlevelmenus=array();
		$i=0;
		foreach ($children as $child) {
			$filter_data = array(
				'filter_category_id'  => $child['category_id'],
				'filter_sub_category' => true
			);
			
			$path = '';
			foreach($category_id['parents'] as $parents){
				$path .= $parents.'_';
			}
			$path .= $category_id['category_id'];
			$path .= '_'.$child['category_id'];
			
			$nthlevelmenus[$i] = array(
				'category_id' => $child['category_id'],
				'column'   => $child['column'] ? $child['column'] : 1,
				'name'  => $child['name'],// . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
				'href'  => $this->url->link('product/category', 'path=' . $path)
			);
			$subchildren = $this->model_catalog_category->getCategories($child['category_id']);
			if($subchildren){
				$nthlevelmenus[$i] = array_merge($nthlevelmenus[$i] ,array('children' => (array)$this->nthLevelMenu(
					array($child['category_id'] => array( 
						'category_id' =>$child['category_id'] ,
						'parents' => array_merge($category_id['parents'] ,array($category_id['category_id']))
					))
				)));
			}
			$i++;				
		}
		return $nthlevelmenus;
	}
			
	public function index() {
		$this->load->model('tool/image');
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');
		$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);


			$i=-1;
			
				foreach ($children as $child) {

				$i++;
			
					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					
				$children_data[$i] = array(
			

				'category_id' => $child['category_id'],
				'column'   => $child['column'] ? $child['column'] : 1,
				'seeallname' =>  $child['name'],
			
						'name'  => $child['name'],// . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);

				$subchildren = $this->model_catalog_category->getCategories($child['category_id']);
				if($subchildren) {
					$children_data[$i] = array_merge($children_data[$i],array(
						'children' => (array)$this->nthLevelMenu(
						array($child['category_id'] => array( 
							'category_id' =>$child['category_id'] ,
							'parents' => array($category['category_id'])
							))
						)
					));
				}
			
				}

                // get product for category
                $filter_data = array(
                    'filter_category_id' => $category['category_id'],
                    'sort'  => 'p.date_added',
                    'order' => 'DESC',
                    'start' => 0,
                    'limit' => 3
                );

                $results = $this->model_catalog_product->getProducts($filter_data);
                $categoryProduct = array();
                if ($results) {
                    foreach ($results as $result) {
                        if ($result['image']) {
                            $image = $this->model_tool_image->resize($result['image'], 250, 350);
                        } else {
                            $image = $this->model_tool_image->resize('placeholder.png', 250, 350);
                        }

                        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                            $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                        } else {
                            $price = false;
                        }

                        if ((float)$result['special']) {
                            $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
                        } else {
                            $special = false;
                        }

                        $qty_detail = !empty($result['quantity_detail']) ? $result['quantity_detail'] : '[]' ;
                        $qtyDetail = json_decode($qty_detail, true);
                        if (count($qtyDetail) > 0 && !empty($qtyDetail[0]['images'])) {
                            $image = $this->model_tool_image->resize($qtyDetail[0]['images'][0]['name'], 175,250);
                        }

                        $categoryProduct[] = array(
                            'product_id' => $result['product_id'],
                            'thumb' => $image,
                            'name' => $result['name'],
                            'price' => $price,
                            'special' => $special,
                            'href' => $this->url->link('product/product', 'product_id=' . $result['product_id']),
                        );
                    }
                }

				// Level 1
				$data['categories'][] = array(
					'name'     => $category['name'],
					'children' => $children_data,
					'column'   => $category['column'] ? $category['column'] : 1,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id']),
                    'products' => $categoryProduct
				);
			}
		}

		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}