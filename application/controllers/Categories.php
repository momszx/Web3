<?php
	class Categories extends CI_Controller{
		public function index(){
			$data['title']='Kategóriák';
			$data['categories']=$this->category_model->get_categories();
			$this->load->view('templates/header');
			$this->load->view('categories/index',$data);
			$this->load->view('templates/footer');
		}
		public  function  create(){
			if (!$this->session->userdata('logged_in')){
				$this->session->set_flashData('access_denied','Először jelentkezbe');
				redirect('users/login');
			}
			$data['title'] ='Kategória készítése';
			$this->form_validation->set_rules('name','Name','required');
			if($this->form_validation->run()==FALSE){
				$this->load->view('templates/header');
				$this->load->view('categories/create',$data);
				$this->load->view('templates/footer');
			}else{
				$this->category_model->create_category();
				$this->session->set_flashData('category_created','Sikeresen kategória létrehozás');
				redirect('categories');
			}
		}
		public function posts($id){
			$data['title']=$this->category_model->get_category($id)->name;
			$data['posts']=$this->post_model->get_posts_by_category($id);
			$this->load->view('templates/header');
			$this->load->view('posts/index',$data);
			$this->load->view('templates/footer');
		}
		public function delete($id){
			if (!$this->session->userdata('logged_in')){
				$this->session->set_flashData('access_denied','Először jelentkezbe');
				redirect('users/login');
			}
			if ($this->session->userdata('user_id') != $this->category_model->get_category($id)->user_id){
				$this->session->set_flashData('access_denied','Ez nem a te kategoriád');
				redirect('categories');
			}
			$this->category_model->delete_category($id);
			$this->session->set_flashData('category_delete','Kategória törölve');
			redirect('categories');
		}
	}
