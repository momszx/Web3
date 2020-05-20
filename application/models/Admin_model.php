<?php


class Admin_model extends  CI_Model
{
	public function get_users(){
		$this->db->order_by('name');
		$query =$this->db->get('users');
		return $query->result_array();
	}
	public function delete_user($id){
		$this->db->where('id', $id);
		$this->db->delete('users');
		return true;
	}
	public function get_admin($user_id){
		$query =$this->db->get_where('admin',array('user_id'=>$user_id));
		return $query->result_array();
	}
}
