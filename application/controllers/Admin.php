<?php


class Admin
{
	public function index(){
		$data['title']='Admin panel';
		$data['users']=$this->user_model->get_categories();
		$this->load->view('templates/header');
		$this->load->view('categories/index',$data);
		$this->load->view('templates/footer');
	}
}
