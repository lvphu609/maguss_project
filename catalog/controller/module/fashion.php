<?php
class ControllerModuleFashion extends Controller {
    public function index($setting) {
        $data = array();

        $this->load->model('tool/image');

        if (isset($setting['title'])) {
            $data['title'] = $setting['title'];
        } else {
            $data['title'] = '';
        }

        if (isset($setting['left_image'])) {
            if ($setting['left_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['left_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 175, 250);
            }
            $data['left_image'] = $image;
        } else {
            $data['left_image'] = $this->model_tool_image->resize('placeholder.png', 175, 250);
        }
        if (isset($setting['left_text'])) {
            $data['left_text'] = $setting['left_text'];
        } else {
            $data['left_text'] = '';
        }

        if (isset($setting['top_image'])) {
            if ($setting['top_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['top_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 250, 350);
            }
            $data['top_image'] = $image;
        } else {
            $data['top_image'] = $this->model_tool_image->resize('placeholder.png', 250, 350);
        }
        if (isset($setting['top_text'])) {
            $data['top_text'] = $setting['top_text'];
        } else {
            $data['top_text'] = '';
        }

        if (isset($setting['right_image'])) {
            if ($setting['right_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['right_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 175, 250);
            }
            $data['right_image'] = $image;
        } else {
            $data['right_image'] = $this->model_tool_image->resize('placeholder.png', 175, 250);
        }
        if (isset($setting['right_text'])) {
            $data['right_text'] = $setting['right_text'];
        } else {
            $data['right_text'] = '';
        }

        if (isset($setting['bottom_image'])) {
            if ($setting['bottom_image']) {
                $image = HTTP_SERVER . 'image/' . $setting['bottom_image'];
            } else {
                $image = $this->model_tool_image->resize('placeholder.png', 450, 250);
            }
            $data['bottom_image'] = $image;
        } else {
            $data['bottom_image'] = $this->model_tool_image->resize('placeholder.png', 450, 250);
        }

        if (isset($setting['bottom_text'])) {
            $data['bottom_text'] = $setting['bottom_text'];
        } else {
            $data['bottom_text'] = '';
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/fashion.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/fashion.tpl', $data);
        } else {
            return $this->load->view('default/template/module/fashion.tpl', $data);
        }
    }
}