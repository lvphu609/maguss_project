<?php
class ModelShippingMaguss extends Model {
	function getQuote($address) {
		$this->load->language('shipping/maguss');

		/*$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('item_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if (!$this->config->get('maguss_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}*/
        $status = true;

		$method_data = array();

		if ($status) {
			$items = 0;

			foreach ($this->cart->getProducts() as $product) {
				if ($product['shipping']) {
					$items += $product['quantity'];
				}
			}

			$quote_data = array();
			$magussZone = $this->config->get('maguss_zone');
			if (is_array($magussZone) && count($magussZone) > 0) {
				foreach ($magussZone['cost'] as $key => $value) {
					$magussZone['cost_format'][$key] = $this->currency->format($value);
				}
                $this->load->model('localisation/zone');
                $allProvince = $this->model_localisation_zone->getZone($magussZone['province']);
                $provinces = array();
                foreach ($allProvince as $province) {
                    array_push($provinces, array('id' => $province['zone_id'], 'text' => $province['name']));
                }
                $magussZone['province_name'] = $provinces;
			}
			
			$cost = count($magussZone) > 0 ? (int)$magussZone['cost'][0] : 0;
			$quote_data['maguss'] = array(
				'code'         => 'maguss.maguss',
				'title'        => $this->language->get('text_description'),
				'cost'         => $cost,// * $items,
				'tax_class_id' => $this->config->get('item_tax_class_id'),
				'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('config_tax'))),
				'locations'    => $magussZone,
				'num_item'     => $items
			);

			$method_data = array(
				'code'       => 'maguss',
				'title'      => $this->language->get('text_title'),
				'quote'      => $quote_data,
				'sort_order' => $this->config->get('maguss_sort_order'),
				'error'      => false
			);
		}

		return $method_data;
	}
}