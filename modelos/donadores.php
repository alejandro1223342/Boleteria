<?php 
//incluir la conexion de base de datos
require "../config/Conexion.php";
class donadores{


	//implementamos nuestro constructor
public function __construct(){

}

public function listarp($usu_id){
	$sql="call sp_listar_permisos($usu_id)";
	return ejecutarConsultaSP($sql);
}

public function insertar($usu_nombre,$usu_cedula,$usu_telefono,$usu_correo,$usu_cargo,$usu_login,$usu_clave){
	$sql="INSERT INTO usuario(usu_nombre,usu_cedula,usu_telefono,usu_correo,usu_cargo,usu_login,usu_clave) VALUES ('$usu_nombre','$usu_cedula','$usu_telefono','$usu_correo','$usu_cargo','$usu_login','$usu_clave');";
	return ejecutarConsulta($sql);
}
public function 
	
	insertarper($usu_id,$per_id){
	$sql="INSERT INTO usuario_permiso
	(usu_id,per_id) VALUES ($usu_id,$per_id);";
	return ejecutarConsulta($sql);
}
	
public function listar(){
	$sql="call sp_donaciones_select()";
	return ejecutarConsulta($sql);
}
	


public function obten_combo($id){
	$sql="CALL sp_catalogo_select($id);";
	return ejecutarConsultaSP($sql);
}

public function combo_donadores(){
	$sql="CALL sp_donadores_combo();";
	return ejecutarConsultaSP($sql);
}
public function insertar_donadores($don_cedula,$don_nombre,$don_telefono,$don_correo,$don_direccion,
								   $don_fecha){
	$sql="CALL sp_donaciones_insert('$don_cedula','$don_nombre','$don_telefono','$don_correo',
	'$don_direccion','$don_fecha');";
	return ejecutarConsultaSP($sql);
}

public function insertar_detalle($don_cedula,$cat_id,$cat_id_estado,$det_cantidad,$det_fechacad){
$sql="CALL sp_detalle_insert('$don_cedula','$cat_id','$cat_id_estado','$det_cantidad','$det_fechacad');";
	return ejecutarConsultaSP($sql);
}









}

 ?>