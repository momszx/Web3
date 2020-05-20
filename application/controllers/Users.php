<?php


class Users extends CI_Controller
{
	public  function register(){
		$data['title']='Regisztráció';
		$this->form_validation->set_rules('name','Name','required');
		$this->form_validation->set_rules('username','Username','required|callback_check_username_exists');
		$this->form_validation->set_rules('email','Email','required|callback_check_email_exists');
		$this->form_validation->set_rules('password','Password','required');
		$this->form_validation->set_rules('password2','Confirm Password','matches[password]');
		if($this->form_validation->run()==FALSE){
			$this->load->view('templates/header');
			$this->load->view('users/register',$data);
			$this->load->view('templates/footer');
		}else{
			$enc_password=md5($this->input->post('password'));
			$this->user_model->register($enc_password);
			$this->session->set_flashData('user_registered','Sikeres Registráció');
			redirect('posts');
		}
	}
	 public function check_username_exists($username){
		$this->form_validation->set_message('check_username_exists','Ez a felhasználó már létezik válasz másikat');
		if($this->user_model->check_username_exists($username)){
			return true;
		}else{
			return false;
		}
	}
	public function check_email_exists($email){
		$this->form_validation->set_message('check_email_exists', 'Ezt az email címet már valaki használja');
		if($this->user_model->check_email_exists($email)){
			return true;
		} else {
			return false;
		}
	}
	public  function login(){
		$data['title']='Bejelentkezés';
		$this->form_validation->set_rules('username','Username','required');
		$this->form_validation->set_rules('password','Password','required');
		if($this->form_validation->run()==FALSE){
			$this->load->view('templates/header');
			$this->load->view('users/login',$data);
			$this->load->view('templates/footer');
		}else{
			$username = $this->input->post('username');
			$password = md5($this->input->post('password'));
			$user_id = $this->user_model->login($username, $password);
			$admin=$this->admin_model->get_admin($user_id);
			$isAdmin=false;
			if(!empty($admin)){
				$isAdmin=true;
			}
			console.log("asd");
			if($user_id){
				$user_data = array(
					'user_id' => $user_id,
					'username' => $username,
					'logged_in' => true,
					'isAdmin'=>$isAdmin
				);
				$this->session->set_userdata($user_data);
				$this->session->set_flashData('user_loggedin','Sikeres Bejelentkezés');
				redirect('posts');
			}else{
				$this->session->set_flashData('login_failed','Hibás felhasználónév vagy jelszó');
				redirect('users/login');
			}

		}
	}
	public function logout()
	{
		$this->session->unset_userdata('logged_in');
		$this->session->unset_userdata('user_id');
		$this->session->unset_userdata('username');
		$this->session->unset_userdata('isAdmin');
		$this->session->set_flashdata('user_loggedout', 'Sikeresen kijelentkeztél');
		redirect('posts');
	}
}
