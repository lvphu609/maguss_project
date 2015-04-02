<?php
class ControllerModuleFashion extends Controller {
    private $error = array();

    public function index() {
        $this->load->language('module/fashion');

        $this->document->setTitle($this->language->get('heading_title'));

        $this->load->model('extension/module');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            if (!isset($this->request->get['module_id'])) {
                $this->model_extension_module->addModule('fashion', $this->request->post);
            } else {
                $this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
            }

            $this->session->data['success'] = $this->language->get('text_success');

            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_edit'] = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_name'] = $this->language->get('entry_name');
        $data['entry_title'] = $this->language->get('entry_title');
        $data['entry_left_image'] = $this->language->get('entry_left_image');
        $data['entry_left_text'] = $this->language->get('entry_left_text');
        $data['entry_top_image'] = $this->language->get('entry_top_image');
        $data['entry_top_text'] = $this->language->get('entry_top_text');
        $data['entry_right_image'] = $this->language->get('entry_right_image');
        $data['entry_right_text'] = $this->language->get('entry_right_text');
        $data['entry_bottom_image'] = $this->language->get('entry_bottom_image');
        $data['entry_bottom_text'] = $this->language->get('entry_bottom_text');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['help_product'] = $this->language->get('help_product');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->error['name'])) {
            $data['error_name'] = $this->error['name'];
        } else {
            $data['error_name'] = '';
        }
        if (isset($this->error['title'])) {
            $data['error_title'] = $this->error['title'];
        } else {
            $data['error_title'] = '';
        }

        if (isset($this->error['left_image'])) {
            $data['error_left_image'] = $this->error['left_image'];
        } else {
            $data['error_left_image'] = '';
        }
        if (isset($this->error['left_text'])) {
            $data['error_left_text'] = $this->error['left_text'];
        } else {
            $data['error_left_text'] = '';
        }
        if (isset($this->error['top_image'])) {
            $data['error_top_image'] = $this->error['top_image'];
        } else {
            $data['error_top_image'] = '';
        }
        if (isset($this->error['top_text'])) {
            $data['error_top_text'] = $this->error['top_text'];
        } else {
            $data['error_top_text'] = '';
        }
        if (isset($this->error['right_image'])) {
            $data['error_right_image'] = $this->error['right_image'];
        } else {
            $data['error_right_image'] = '';
        }
        if (isset($this->error['right_text'])) {
            $data['error_right_text'] = $this->error['right_text'];
        } else {
            $data['error_right_text'] = '';
        }
        if (isset($this->error['bottom_image'])) {
            $data['error_bottom_image'] = $this->error['bottom_image'];
        } else {
            $data['error_bottom_image'] = '';
        }
        if (isset($this->error['bottom_text'])) {
            $data['error_bottom_text'] = $this->error['bottom_text'];
        } else {
            $data['error_bottom_text'] = '';
        }

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );

        if (!isset($this->request->get['module_id'])) {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('module/fashion', 'token=' . $this->session->data['token'], 'SSL')
            );
        } else {
            $data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title'),
                'href' => $this->url->link('module/fashion', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
            );
        }

        if (!isset($this->request->get['module_id'])) {
            $data['action'] = $this->url->link('module/fashion', 'token=' . $this->session->data['token'], 'SSL');
        } else {
            $data['action'] = $this->url->link('module/fashion', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
        }

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

        if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
            $module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
        }

        $data['token'] = $this->session->data['token'];

        if (isset($this->request->post['name'])) {
            $data['name'] = $this->request->post['name'];
        } elseif (!empty($module_info['name'])) {
            $data['name'] = $module_info['name'];
        } else {
            $data['name'] = '';
        }
        if (isset($this->request->post['title'])) {
            $data['title'] = $this->request->post['title'];
        } elseif (!empty($module_info['title'])) {
            $data['title'] = $module_info['title'];
        } else {
            $data['title'] = '';
        }

        $this->load->model('tool/image');
        // left image
        if (isset($this->request->post['left_image'])) {
            $data['left_image'] = $this->request->post['left_image'];
        } elseif (!empty($module_info['left_image'])) {
            $data['left_image'] = $module_info['left_image'];
        } else {
            $data['left_image'] = '';
        }

        if (isset($this->request->post['left_image']) && is_file(DIR_IMAGE . $this->request->post['left_image'])) {
            $data['left_image_thumb'] = $this->model_tool_image->resize($this->request->post['left_image'], 100, 100);
        } elseif (!empty($module_info['left_image']) && is_file(DIR_IMAGE . $module_info['left_image'])) {
            $data['left_image_thumb'] = $this->model_tool_image->resize($module_info['left_image'], 100, 100);
        } else {
            $data['left_image_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        // end left image

        // left text
        if (isset($this->request->post['left_text'])) {
            $data['left_text'] = $this->request->post['left_text'];
        } elseif (!empty($module_info['left_text'])) {
            $data['left_text'] = $module_info['left_text'];
        } else {
            $data['left_text'] = '';
        }
        // end left text

        // top image
        if (isset($this->request->post['top_image'])) {
            $data['top_image'] = $this->request->post['top_image'];
        } elseif (!empty($module_info['top_image'])) {
            $data['top_image'] = $module_info['top_image'];
        } else {
            $data['top_image'] = '';
        }

        if (isset($this->request->post['top_image']) && is_file(DIR_IMAGE . $this->request->post['top_image'])) {
            $data['top_image_thumb'] = $this->model_tool_image->resize($this->request->post['top_image'], 100, 100);
        } elseif (!empty($module_info['top_image']) && is_file(DIR_IMAGE . $module_info['top_image'])) {
            $data['top_image_thumb'] = $this->model_tool_image->resize($module_info['top_image'], 100, 100);
        } else {
            $data['top_image_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        // end top image

        // top text
        if (isset($this->request->post['top_text'])) {
            $data['top_text'] = $this->request->post['top_text'];
        } elseif (!empty($module_info['top_text'])) {
            $data['top_text'] = $module_info['top_text'];
        } else {
            $data['top_text'] = '';
        }
        // end top text

        // right image
        if (isset($this->request->post['right_image'])) {
            $data['right_image'] = $this->request->post['right_image'];
        } elseif (!empty($module_info['right_image'])) {
            $data['right_image'] = $module_info['right_image'];
        } else {
            $data['right_image'] = '';
        }

        if (isset($this->request->post['right_image']) && is_file(DIR_IMAGE . $this->request->post['right_image'])) {
            $data['right_image_thumb'] = $this->model_tool_image->resize($this->request->post['right_image'], 100, 100);
        } elseif (!empty($module_info['right_image']) && is_file(DIR_IMAGE . $module_info['right_image'])) {
            $data['right_image_thumb'] = $this->model_tool_image->resize($module_info['right_image'], 100, 100);
        } else {
            $data['right_image_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        // end left image

        // right text
        if (isset($this->request->post['right_text'])) {
            $data['right_text'] = $this->request->post['right_text'];
        } elseif (!empty($module_info['right_text'])) {
            $data['right_text'] = $module_info['right_text'];
        } else {
            $data['right_text'] = '';
        }
        // end right text

        // bottom image
        if (isset($this->request->post['bottom_image'])) {
            $data['bottom_image'] = $this->request->post['bottom_image'];
        } elseif (!empty($module_info['bottom_image'])) {
            $data['bottom_image'] = $module_info['bottom_image'];
        } else {
            $data['bottom_image'] = '';
        }

        if (isset($this->request->post['bottom_image']) && is_file(DIR_IMAGE . $this->request->post['bottom_image'])) {
            $data['bottom_image_thumb'] = $this->model_tool_image->resize($this->request->post['bottom_image'], 100, 100);
        } elseif (!empty($module_info['bottom_image']) && is_file(DIR_IMAGE . $module_info['bottom_image'])) {
            $data['bottom_image_thumb'] = $this->model_tool_image->resize($module_info['bottom_image'], 100, 100);
        } else {
            $data['bottom_image_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
        }
        // end bottom image

        // bottom text
        if (isset($this->request->post['bottom_text'])) {
            $data['bottom_text'] = $this->request->post['bottom_text'];
        } elseif (!empty($module_info['bottom_text'])) {
            $data['bottom_text'] = $module_info['bottom_text'];
        } else {
            $data['bottom_text'] = '';
        }
        // end bottom text

        if (isset($this->request->post['status'])) {
            $data['status'] = $this->request->post['status'];
        } elseif (!empty($module_info['status'])) {
            $data['status'] = $module_info['status'];
        } else {
            $data['status'] = '';
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/fashion.tpl', $data));
    }

    protected function validate() {
        if (!$this->user->hasPermission('modify', 'module/fashion')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
            $this->error['name'] = $this->language->get('error_name');
        }

        if (!$this->request->post['left_image']) {
            $this->error['left_image'] = $this->language->get('error_left_image');
        }

        if (!$this->request->post['left_text']) {
            $this->error['left_text'] = $this->language->get('error_left_text');
        }

        if (!$this->request->post['top_image']) {
            $this->error['top_image'] = $this->language->get('error_top_image');
        }

        if (!$this->request->post['top_text']) {
            $this->error['top_text'] = $this->language->get('error_top_text');
        }

        if (!$this->request->post['right_image']) {
            $this->error['right_image'] = $this->language->get('error_right_image');
        }

        if (!$this->request->post['right_text']) {
            $this->error['right_text'] = $this->language->get('error_right_text');
        }

        if (!$this->request->post['bottom_image']) {
            $this->error['bottom_image'] = $this->language->get('error_bottom_image');
        }

        if (!$this->request->post['bottom_text']) {
            $this->error['bottom_text'] = $this->language->get('error_bottom_text');
        }

        return !$this->error;
    }
}