<?php 

//incluir la conexion de base de datos
require "../config/Conexion.php";
class Usos{


	//implementamos nuestro constructor
public function __construct(){

}

public function listarp($usu_id){
	$sql="call sp_listar_permisos($usu_id)";
	return ejecutarConsultaSP($sql);
}

public function 
	
	insertarper($usu_id,$per_id){
	$sql="INSERT INTO usuario_permiso
	(usu_id,per_id) VALUES ($usu_id,$per_id);";
	return ejecutarConsulta($sql);
}
	
public function listar(){
	$sql="call sp_usos_lista()";
	return ejecutarConsulta($sql);
}
	
	public function mateconsu($id){
	$sql="CALL sp_seleccion_donadores($id)";
	return ejecutarConsulta($sql);
}
	public function saldodonacion($id){
	$sql="CALL sp_saldo_unitario($id)";
	return ejecutarConsulta($sql);
}
	
	public function elimina_u($id){
	$sql="call sp_usos_delete($id)";
	return ejecutarConsulta($sql);
}
	
public function obten_categoria(){
	$sql="CALL sp_stock_usos();";
	return ejecutarConsultaSP($sql);
}

public function obten_usuarios(){
	$sql="CALL sp_usuarios_select();";
	return ejecutarConsultaSP($sql);
}
	
	public function eliminar($id){
	$sql="CALL sp_usos_delete($id);";
	return ejecutarConsultaSP($sql);
}
	
public function insertar_usos($det_id,$uso_descripcion,$uso_cantidad, $usu_id){
$sql="CALL sp_usos_insert(
$det_id,'$uso_descripcion',$uso_cantidad,$usu_id);";
	return ejecutarConsultaSP($sql);
}

	public function max_cantidad($det_id){
	$sql="call sp_max_cantidad($det_id)";
	return ejecutarConsulta($sql);
}

}

 ?>