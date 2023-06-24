<?php

require '../config/Conexion.php';
class Catalogo
{
	private $cat_id;
	private $cat_nombre;
	private $cat_descripcion;
	private $cat_padre;
	
public function __construct(){

}
	
	//metodos 
public function eliminar_cat($cat_id){
	$sql="call sp_catalogo_delete($cat_id)";
  	return ejecutarConsultaSP($sql);
}
public function insertar_cat($cat_nombre,$cat_descripcion,$cat_padre,$cat_codigo){
	$sql="CALL sp_catalogo_insert('$cat_nombre','$cat_descripcion',$cat_padre,'$cat_codigo');";
  	return ejecutarConsultaSP($sql);
}
public function donaciones_caducadas(){
	$sql="CALL sp_donaciones_cad;";
  	return ejecutarConsultaSP($sql);
}
	
public function mostrar_combo(){
	$sql="CALL sp_catalogo_combo();";
  	return ejecutarConsultaSP($sql);
}
	
public function actualizar_cat($cat_nombre,$cat_descricon,$cat_codigo){
	$sql="CALL `sp_catalogo_update`('$cat_nombre','$cat_descripcion','$cat_codigo')";
  	return ejecutarConsultaSP($sql);
}
	
	
	
}
?>