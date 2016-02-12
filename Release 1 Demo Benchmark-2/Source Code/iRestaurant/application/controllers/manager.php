<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Manager extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{

	}

	public function login(){
		
		$username=trim($_POST["username"]);
		$password=md5(trim($_POST["password"]));
		$type="manager";
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

	public function hireEmployee(){
		$first_name=trim($_POST["first_name"]);
		$last_name=trim($_POST["last_name"]);
		$salaries=trim($_POST["salaries"]);
		$type=trim($_POST["type"]);
		$account_name=trim($_POST["account_name"]);

		$addEmployeeFlag=$this->db->simple_query("insert into staffs(first_name,last_name,salaries,type,account_name) 
															values('$first_name','$last_name','$salaries','$type','$account_name')");
		$password=rand(100000,999999);
		$radom_password=md5($password);
		$addNewAccountFlag=$this->db->simple_query("insert into account(username,password,type,status)
															values('$account_name','$radom_password','$type','logout')");
		if ($addEmployeeFlag&&$addNewAccountFlag) {
			echo "yes,$password";
		}else{
			echo mysql_error();
			echo "no";
		}


	}

	public function fireEmployee(){
		$account_name=trim($_POST["account_name"]);
		$fireEmployeeFlag=$this->db->simple_query("delete from staffs where account_name='$account_name'");
		$deleteAcountFlag=$this->db->simple_query("delete from account where username='$account_name'");
		if ($fireEmployeeFlag&&$deleteAcountFlag) {
			echo "yes";
		}else{
			echo "no";
		}

	}

	public function viewEmployees(){
		$query=$this->db->query("select* from staffs order by s_id desc");
		echo json_encode($query->result_array());
	}

	public function viewTables(){
		$query=$this->db->query("select* from tables");
		echo json_encode($query->result_array());

	}

	public function addNewTable(){
		$table_id=trim($_POST["table_id"]);
		$status="vacant";
		$addNewTableFlag=$this->db->simple_query("insert into tables(table_id,status) values($table_id,'$status')");
		if ($addNewTableFlag) {
			echo "yes";
		}else{
			echo "no";
		}

	}

	public function removeTable(){
		$table_id=trim($_POST["table_id"]);
		$deleteTableFlag=$this->db->simple_query("delete from tables where table_id=$table_id");
		if ($deleteTableFlag) {
			echo "yes";
		}else{
			echo "no";
		}

	}

	public function addMenuItem(){
		$menuitem_info=strval(trim($_POST["menuitem_info"]));
		$menuitem_array=json_decode($menuitem_info,true);
		print_r($menuitem_array);
		$ingredients=$menuitem_array["ingredients"];
		$name=$menuitem_array["name"];
		$price=$menuitem_array["price"];
		$type=$menuitem_array["type"];
		$insertflag=$this->db->simple_query("insert into menu_items(name,price,description,type)
											values('$name',$price,'','$type')");
		
		foreach ($ingredients as $value) {
			$value["menu_item_name"]=$name;
			$this->db->insert("ingredients",$value);
		}
		if ($insertflag) {
			echo "yes";
		}else{
			echo "no";
		}


	}

	public function removeMenuItem(){
		$menu_item_name=trim($_POST["menu_item_name"]);
		$removeflag=$this->db->simple_query("delete from menu_items where name='$menu_item_name'");
		$removeingredientsflag=$this->db->simple_query("delete from ingredients where
														menu_item_name='$menu_item_name'");
		if ($removeflag&&$removeingredientsflag) {
			echo "yes";
		}else{
			echo "no";
		}

	}

	public function viewMenuItems(){
		$query=$this->db->query("select* from menu_items");
		$result_array=$query->result_array();
	
		echo json_encode($result_array);


	}

	public function viewIngredientsByItemName(){
		$ItemName=trim($_POST["menu_item_name"]);
		$query=$this->db->query("select* from ingredients where menu_item_name='$ItemName'");
		echo json_encode($query->result_array());
	}

	public function addIngredients(){
		$ItemName=trim($_POST["menu_item_name"]);
		$name=trim($_POST["name"]);
		$cost_amount=trim($_POST["cost_amount"]);
		$flag=$this->db->query("insert into ingredients(name,cost_amount,menu_item_name)
								values('$name',$cost_amount,'$ItemName')");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}

	public function removeIngredients(){
		$name=trim($_POST["name"]);
		$flag=$this->db->query("delete from ingredients where name='$name'");
		if ($flag) {
			echo "yes";
		}else{
			echo "no";
		}
	}


}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */