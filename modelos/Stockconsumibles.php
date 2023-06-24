<?php

require '../config/Conexion.php';
class Stockconsumible
{
	
public function __construct(){

}
	
	//metodos 
public function eliminar_stock($id){
	$sql="call sp_usos_delete($id)";
  	return ejecutarConsultaSP($sql);
}

	
public function mostrar_stock(){
	$sql="CALL sp_stock_select();";
  	return ejecutarConsultaSP($sql);
}



	

	
	
	
	
}
?>