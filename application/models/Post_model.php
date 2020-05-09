<?php


class Post_model extends CI_Model
{
	public function __construct(){
		$this->load->database();
	}
	public  function  get_posts($slug =FALSE){
		if($slug ===FALSE){
			$this->db->order_by('posts.id','DESC');
			$this->db->join('categories','categories.id=posts.category_id');
			$query =$this->db->get('posts');
			return $query->result_array();
		}
		$query=$this->db->get_where('posts',array('slug'=>$slug));
		return $query->row_array();
	}
	public function create_post($post_image){
		$slug = url_title($this->input->post('title'));
		$unwanted_array = array(    'Š'=>'S', 'š'=>'s', 'Ž'=>'Z', 'ž'=>'z', 'À'=>'A', 'Á'=>'A', 'Â'=>'A', 'Ã'=>'A', 'Ä'=>'A', 'Å'=>'A', 'Æ'=>'A', 'Ç'=>'C', 'È'=>'E', 'É'=>'E',
			'Ê'=>'E', 'Ë'=>'E', 'Ì'=>'I', 'Í'=>'I', 'Î'=>'I', 'Ï'=>'I', 'Ñ'=>'N', 'Ò'=>'O', 'Ó'=>'O', 'Ô'=>'O', 'Õ'=>'O', 'Ö'=>'O',  'Ő'=>'O','Ø'=>'O', 'Ù'=>'U','Ű'=>'u',
			'Ú'=>'U', 'Û'=>'U', 'Ü'=>'U', 'Ý'=>'Y', 'Þ'=>'B', 'ß'=>'Ss', 'à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a', 'å'=>'a', 'æ'=>'a', 'ç'=>'c',
			'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'ì'=>'i', 'í'=>'i', 'î'=>'i', 'ï'=>'i', 'ð'=>'o', 'ñ'=>'n', 'ò'=>'o', 'ó'=>'o', 'ô'=>'o', 'õ'=>'o',
			'ö'=>'o', 'ő'=>'o','ø'=>'o', 'ù'=>'u', 'ú'=>'u','ű'=>'u', 'û'=>'u', 'ý'=>'y', 'þ'=>'b', 'ÿ'=>'y' );
		$str = strtr( $slug, $unwanted_array );
		$data =array(
			'title' => $this->input->post('title'),
			'slug' => $str,
			'body' => $this->input->post('body'),
			'category_id' => $this->input->post('category_id'),
			'post_image'=> $post_image
		);
		return $this->db->insert('posts', $data);
	}
	public function delete_post($id){
		$this->db->where('id',$id);
		$this->db->delete('posts');
		return true;
	}
	public  function  update_post(){
		$slug = url_title($this->input->post('title'));
		$unwanted_array = array(    'Š'=>'S', 'š'=>'s', 'Ž'=>'Z', 'ž'=>'z', 'À'=>'A', 'Á'=>'A', 'Â'=>'A', 'Ã'=>'A', 'Ä'=>'A', 'Å'=>'A', 'Æ'=>'A', 'Ç'=>'C', 'È'=>'E', 'É'=>'E',
			'Ê'=>'E', 'Ë'=>'E', 'Ì'=>'I', 'Í'=>'I', 'Î'=>'I', 'Ï'=>'I', 'Ñ'=>'N', 'Ò'=>'O', 'Ó'=>'O', 'Ô'=>'O', 'Õ'=>'O', 'Ö'=>'O',  'Ő'=>'O','Ø'=>'O', 'Ù'=>'U','Ű'=>'u',
			'Ú'=>'U', 'Û'=>'U', 'Ü'=>'U', 'Ý'=>'Y', 'Þ'=>'B', 'ß'=>'Ss', 'à'=>'a', 'á'=>'a', 'â'=>'a', 'ã'=>'a', 'ä'=>'a', 'å'=>'a', 'æ'=>'a', 'ç'=>'c',
			'è'=>'e', 'é'=>'e', 'ê'=>'e', 'ë'=>'e', 'ì'=>'i', 'í'=>'i', 'î'=>'i', 'ï'=>'i', 'ð'=>'o', 'ñ'=>'n', 'ò'=>'o', 'ó'=>'o', 'ô'=>'o', 'õ'=>'o',
			'ö'=>'o', 'ő'=>'o','ø'=>'o', 'ù'=>'u', 'ú'=>'u','ű'=>'u', 'û'=>'u', 'ý'=>'y', 'þ'=>'b', 'ÿ'=>'y' );
		$str = strtr( $slug, $unwanted_array );
		$data =array(
			'title' => $this->input->post('title'),
			'slug' => $str,
			'body' => $this->input->post('body'),
			'category_id' => $this->input->post('category_id')
		);
		$this->db->where('id',$this->input->post('id'));
		return $this->db->update('posts', $data);
	}
	public  function get_categories(){
		$this->db->order_by('name');
		$query =$this->db->get('categories');
		return $query->result_array();
	}
	public function get_posts_by_category($category_id){
		$this->db->order_by('posts.id', 'DESC');
		$this->db->join('categories', 'categories.id = posts.category_id');
		$query = $this->db->get_where('posts', array('category_id' => $category_id));
		return $query->result_array();
	}
}
