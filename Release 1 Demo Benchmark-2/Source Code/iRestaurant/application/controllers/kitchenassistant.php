<?php

/**
* 
*/
class Kitchenassistant extends CI_Controller
{
	

	public function viewWaitingItems(){
		$query=$this->db->query("select* from order_items,orders where status='waiting' 
								and orders.order_id=order_items.order_id
								order by orders.time");
		echo json_encode($query->result_array());

	}

	public function viewCookingItems(){
		$query=$this->db->query("select* from order_items,orders where status='cooking'
								and orders.order_id=order_items.order_id
								order by orders.time");
		echo json_encode($query->result_array());
	}

	public function doneOrderItem(){
		$order_item_id=trim($_POST["order_item_id"]);
		$flag=$this->db->simple_query("update order_items set status='done' where order_item_id='$order_item_id'");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}

	public function login(){
		$username=trim($_POST["username"]);
		$password=md5(trim($_POST["password"]));
		$type="Kitchen Assistant";
		$query=$this->db->query("select* from account where username='$username' and password='$password' and type='$type'");
		$flag=$this->db->simple_query("update account set status='login' where username='$username'");
		if ($query->num_rows()>0&&$flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}

	public function cookingOrderItem(){
		$order_item_id=trim($_POST["order_item_id"]);
		$flag=$this->db->simple_query("update order_items set status='cooking' where order_item_id='$order_item_id'");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}
}

?>