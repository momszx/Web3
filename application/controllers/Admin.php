<?php


class Admin extends CI_Controller{
		public function index(){
			if (!$this->session->userdata('logged_in')){
				$this->session->set_flashData('access_denied','Először jelentkezbe');
				redirect('users/login');
			}
			if (!$this->session->userdata('isAdmin')){
				$this->session->set_flashData('access_denied','Nem vagy Admin');
				redirect('posts');
			}
			$data['title']='Admin nézet';
			$data['users']=$this->admin_model->get_users();
			$this->load->view('templates/header');
			$this->load->view('admin/index',$data);
			$this->load->view('templates/footer');
		}
		public function delete($id){
			if (!$this->session->userdata('logged_in')){
				$this->session->set_flashData('access_denied','Először jelentkezbe');
				redirect('users/login');
			}
			if (!$this->session->userdata('isAdmin')){
				$this->session->set_flashData('access_denied','Nem vagy Admin');
				redirect('posts');
			}
			$this->admin_model->delete_user($id);
			$this->session->set_flashData('user_delete','User törölve');
			redirect('admin/index');
		}
}
