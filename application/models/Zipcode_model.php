<?php


class zipcode_model extends CI_Model
{
	public function get_zipcode($zipcode){
		$query =$this->db->get_where('zipcode',array('zipcode'=>$zipcode));
		return $query->result_array();
	}
}
