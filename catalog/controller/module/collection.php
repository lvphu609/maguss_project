<?php
class ControllerModuleCollection extends Controller {
    public function index($setting) {
        $data = array();

        $this->load->model('tool/image');

        if (isset($setting['left_image'])) {
            if ($setting['left_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['left_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 345, 485);
            }
            $data['left_image'] = $image;
        } else {
            $data['left_image'] = $this->model_tool_image->resize('placeholder.png', 345, 485);
        }
        if (isset($setting['left_image_link'])) {
            $data['left_image_link'] = $setting['left_image_link'];
        } else {
            $data['left_image_link'] = '';
        }

        if (isset($setting['left_text'])) {
            $data['left_text'] = html_entity_decode($setting['left_text'], ENT_QUOTES, 'UTF-8');
        } else {
            $data['left_text'] = '';
        }

        if (isset($setting['center_text'])) {
            $data['center_text'] = html_entity_decode($setting['center_text'], ENT_QUOTES, 'UTF-8');
        } else {
            $data['center_text'] = '';
        }

        if (isset($setting['right_image'])) {
            if ($setting['right_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['right_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 345, 485);
            }
            $data['right_image'] = $image;
        } else {
            $data['right_image'] = $this->model_tool_image->resize('placeholder.png', 345, 485);
        }
        if (isset($setting['right_image_link'])) {
            $data['right_image_link'] = $setting['right_image_link'];
        } else {
            $data['right_image_link'] = '';
        }

        if (isset($setting['right_text'])) {
            $data['right_text'] = html_entity_decode($setting['right_text'], ENT_QUOTES, 'UTF-8');
        } else {
            $data['right_text'] = '';
        }

        if (isset($setting['bottom_image'])) {
            if ($setting['bottom_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['bottom_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 345, 485);
            }
            $data['bottom_image'] = $image;
        } else {
            $data['bottom_image'] = $this->model_tool_image->resize('placeholder.png', 345, 485);
        }
        if (isset($setting['bottom_image_link'])) {
            $data['bottom_image_link'] = $setting['bottom_image_link'];
        } else {
            $data['bottom_image_link'] = '';
        }

        if (isset($setting['bottom_text'])) {
            $data['bottom_text'] = $setting['bottom_text'];
        } else {
            $data['bottom_text'] = '';
        }

        if (isset($setting['small_left_image'])) {
            if ($setting['small_left_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['small_left_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 345, 485);
            }
            $data['small_left_image'] = $image;
        } else {
            $data['small_left_image'] = $this->model_tool_image->resize('placeholder.png', 345, 485);
        }
        if (isset($setting['small_left_image_link'])) {
            $data['small_left_image_link'] = $setting['small_left_image_link'];
        } else {
            $data['small_left_image_link'] = '';
        }

        if (isset($setting['small_right_image'])) {
            if ($setting['small_right_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['small_right_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 345, 485);
            }
            $data['small_right_image'] = $image;
        } else {
            $data['small_right_image'] = $this->model_tool_image->resize('placeholder.png', 345, 485);
        }
        if (isset($setting['small_right_image_link'])) {
            $data['small_right_image_link'] = $setting['small_right_image_link'];
        } else {
            $data['small_right_image_link'] = '';
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/collection.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/collection.tpl', $data);
        } else {
            return $this->load->view('default/template/module/collection.tpl', $data);
        }
    }
}