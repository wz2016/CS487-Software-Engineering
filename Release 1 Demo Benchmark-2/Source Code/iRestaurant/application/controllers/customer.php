<?php

/**
* 
*/
class Customer extends CI_Controller
{
	
	public function writeReview(){
		$order_id=trim($_POST["order_id"]);
		$rank=trim($_POST["rank"]);
		$review=trim($_POST["review"]);
		$flag=$this->db->simple_query("insert into customer_review(order_id,rank,review,time) 
			values($order_id,$rank,'$review',now())");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}

	public function viewReviews(){
		$query=$this->db->query("select* from customer_review");
		echo json_encode($query->result_array());
	}

	public function removeReview(){
		$id=trim($_POST["id"]);
		$flag=$this->db->simple_query("delete from customer_review where id='$id'");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}

	public function viewOrderItems(){
		$order_id=trim($_POST["order_id"]);
		$query=$this->db->query("select* from orders,order_items where orders.order_id=$order_id
								and orders.order_id=order_items.order_id");
		echo json_encode($query->result_array());
	}

	public function addNewOrderItem(){
		$menu_item_name=trim($_POST["menu_item_name"]);
		$amount=trim($_POST["amount"]);
		$order_id=trim($_POST["order_id"]);
		$flag=$this->db->simple_query("insert into order_items(order_id,menu_item_name,status,amount)
										values($order_id,'$menu_item_name','waiting',$amount)");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}

	}

	public function removeOrderItem(){
		$order_item_id=trim($_POST["order_item_id"]);
		$query=$this->db->query("select* from order_items where order_item_id='$order_item_id'");
		$array=$query->result_array()[0];
		if ($array["status"]=="waiting") {
			$flag=$this->db->simple_query("delete from order_items where order_item_id='$order_item_id'");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}
			
		}else{
			echo "no";
		}
		
	}
}

?>