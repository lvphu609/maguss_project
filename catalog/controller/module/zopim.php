<?php
#################################################################
## Open Cart Module:  ZOPIM LIVE CHAT WIDGET			       ##
##-------------------------------------------------------------##
## Copyright © 2014 MB "Programanija" All rights reserved.     ##
## http://www.opencartextensions.eu						       ##
## http://www.extensionsmarket.com 						       ##
##-------------------------------------------------------------##
## Permission is hereby granted, when purchased, to  use this  ##
## mod on one domain. This mod may not be reproduced, copied,  ##
## redistributed, published and/or sold.				       ##
##-------------------------------------------------------------##
## Violation of these rules will cause loss of future mod      ##
## updates and account deletion				      			   ##
#################################################################

class ControllerModuleZopim extends Controller {
	
	public function index() {
		
		$data[] = $this->config->get('zopim_code');
		
		if($this->config->get('zopim_status') == 'On'){
		
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/zopim.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/zopim.tpl', $data);
			} else {
				return $this->load->view('default/template/module/zopim.tpl');
			}
		}
	}
}