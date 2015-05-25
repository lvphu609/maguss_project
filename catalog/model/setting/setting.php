<?php
class ModelSettingSetting extends Model {
	public function getSetting($code, $store_id = 0) {
		$data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `code` = '" . $this->db->escape($code) . "'");

		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} elseif ($result['key'] == 'maguss_zone') {
                $data[$result['key']] = json_decode($result['value'], true);
            } else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}

		return $data;
	}
}