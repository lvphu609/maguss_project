<?php
class ModelLocalisationZone extends Model {
	public function getZone($zone_id) {
        if (is_array($zone_id)) {
            $zone = "(";
            foreach ($zone_id as $key => $id) {
                if ($key == count($zone_id) - 1) {
                    $zone .= $id;
                } else {
                    $zone .= (int)$id.', ';
                }
            }
            $zone .= ')';
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE zone_id IN " . $zone . " AND status = '1'");
            return $query->rows;
        } else {
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$zone_id . "' AND status = '1'");
            return $query->row;
        }
	}

	public function getZonesByCountryId($country_id) {
		$zone_data = $this->cache->get('zone.' . (int)$country_id);

		if (!$zone_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone WHERE country_id = '" . (int)$country_id . "' AND status = '1' ORDER BY name");

			$zone_data = $query->rows;

			$this->cache->set('zone.' . (int)$country_id, $zone_data);
		}

		return $zone_data;
	}
}