<?php
/**
* 
*/
class Waiter extends CI_Controller
{
	
	public function index(){
		echo "waiter....";
	}

	public function login(){
		$username=trim($_POST["username"]);
		$password=md5(trim($_POST["password"]));
		$type="waiter";
		$query=$this->db->query("select* from account where username='$username' and password='$password' and type='$type'");
		$flag=$this->db->simple_query("update account set status='login' where username='$username'");
		if ($query->num_rows()>0&&$flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}

	public function logout(){
		$username=trim($_POST["username"]);
		$password=md5(trim($_POST["password"]));
		$flag=$this->db->simple_query("update account set status='logout' where username='$username'");
		if($flag){
			echo "yes";
		}else{
			echo "no";
		}


	}

	public function makeOrder(){
		$tableId=trim($_POST["table_id"]);
		$items=json_decode(trim($_POST["items"]),True);
		$query=$this->db->query("select* from tables where table_id='$tableId' and status='vacant'");
		
		
		if (count($query->result_array())==1) {
			$this->db->simple_query("insert into orders(time,table_id) values(now(),$tableId)");
			$query=$this->db->query("select @@identity");
			$order_id=$query->result_array()[0]["@@identity"];
			$orderItemflag=False;
			$table_flag=$this->db->simple_query("update tables set status='occupied' where table_id='$tableId'");
			foreach ($items as $value) {
				$menu_item_name=$value["menu_item_name"];
				$amount=$value["amount"];
				$orderItemflag=$this->db->simple_query("insert into order_items(order_id,menu_item_name,status,amount)
											values($order_id,'$menu_item_name','waiting',$amount)");

				if (!$orderItemflag) {
					break;
				}
			}
			if ($orderItemflag) {
				echo "yes".",".$order_id;
			}else{
				echo "no";
			}

		}
	}

	public function removeOrder(){
		$order_id=trim($_POST["order_id"]);
		$delete_order_flag=$this->db->simple_query("delete from orders where order_id='$order_id'");
		$delete_items_flag=$this->db->simple_query("delete from order_items where order_id='$order_id'");
		if ($delete_order_flag&&$delete_items_flag) {
			echo "yes";
		}else{
			echo "no";
		}

	}

	public function makePayment(){
		$bill_info=json_decode(trim($_POST["bill_info"]),True);
		$order_id=$bill_info["order_id"];
		$tax=$bill_info["tax"];
		$tips=$bill_info["tips"];
		$item_bill=$bill_info["item_bill"];
		$total=$bill_info["total"];
		$bill_method=$bill_info["bill_method"];
		$customer_name=$bill_info["customer_name"];
		$bill_flag=$this->db->simple_query("insert into bills(order_id,tax,tips,item_bill,total,time,bill_method,customer_name)
								values($order_id,$tax,$tips,$item_bill,$total,now(),'$bill_method','$customer_name')");
		$setstatus_flag=$this->db->simple_query("update order_items set status='paied' where order_id='$order_id'");
		$order_query=$this->db->query("select* from orders where order_id='$order_id'");
		$table_id=$order_query->result_array()[0]["table_id"];
		$table_flag=$this->db->simple_query("update tables set status='vacant' where table_id='$table_id'");
		if ($bill_flag&&$setstatus_flag&&$table_flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}

	public function deliveryItem(){
		$order_item_id=trim($_POST["order_item_id"]);
		$flag=$this->db->query("update order_items set status='deliveried' where order_item_id='$order_item_id'");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}

	}

	public function viewDoneOrderItems(){
		$query=$this->db->query("select* from order_items,orders where status='done' 
								and orders.order_id=order_items.order_id
								order by orders.time");
		echo json_encode($query->result_array());
	}

	public function viewDoneOrders(){
		$query=$this->db->query("select distinct orders.order_id as order_id,time,table_id from order_items,orders where status='done' 
								and orders.order_id=order_items.order_id
								order by orders.time");
		echo json_encode($query->result_array());
	}

	public function deliveriedItem(){
		$order_item_id=trim($_POST["order_item_id"]);
		$flag=$this->db->simple_query("update order_items set status='deliveried' where order_item_id='$order_item_id'");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}

	public function viewDeliveriedItems(){
		$query=$this->db->query("select* from order_items,orders where status='deliveried' 
								and orders.order_id=order_items.order_id
								order by orders.time");
		echo json_encode($query->result_array());

	}

	public function viewBillingOrder(){
		$order_id=trim($_POST["order_id"]);
		
		$query=$this->db->query("select* from order_items,menu_items where order_id=$order_id
									and order_items.menu_item_name=menu_items.name");
		echo json_encode($query->result_array());
	}




	
}

?>