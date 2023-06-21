<?php 
//incluir la conexion de base de datos
require "../config/Conexion.php";
class Usuario{


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
	$sql="call sp_usuarios_select()";
	return ejecutarConsulta($sql);
}
	
public function listarmarcados(){
	$sql="SELECT * FROM permisos";
	return ejecutarConsulta($sql);
}


public function verificar($usu_login,$usu_clave){
	$sql="call sp_logeo('$usu_login','$usu_clave');";
    //return $sql;
	return ejecutarConsultaSP($sql);	
}

public function obten_motivos($id){
	$sql="CALL sp_catalgo('scpa',0,0,$id);";
	return ejecutarConsultaSP($sql);
}

}

 ?>
