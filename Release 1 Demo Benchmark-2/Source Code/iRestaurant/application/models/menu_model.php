<?php

/**
* 
*/
class Menu_model extends CI_Model
{
	

	public function addNewMenuItem(){
		

	}

	public function removeMenuItem(){
		$menuid=trim($_POST["menuid"]);
		$removeflag=$this->db->simple_query("delete from menu_items where id='$menuid'");
		if ($removeflag) {
			echo "yes";
		}else{
			echo "no";
		}

	}

	public function costSomeIngredientsByMenuItem(){
		$menu_item_name=trim($_GET["menu_name"]);
		$query=$this->db->query("select* from ingrendients where menu_item_name='$menu_name'");
		foreach ($query->result_array() as $value) {
			$ingredient_name=$value["name"];
			$cost_amount=doubleval($value["cost_amount"]);
			$this->db->simple_query("update ingrendients_total_amount set total_amount=total_amount-$cost_amount 
									where ingrendients_name='$ingrendients_name'");
		}

	}

	public function importSomeIngredients(){
		$import_amount=trim($_GET["import_amount"]);
		$import_amount_array=json_decode($import_amount);
		foreach ($import_amount as $item) {
			$ingrendients_name=$value["ingredients_name"];
			$cost_amount=doubleval($value["cost_amount"]);
			$this->db->simple_query("update ingrendients_total_amount set total_amount=total_amount+$cost_amount 
									where ingrendients_name='$ingrendients_name'");
		}


	}
}
?>