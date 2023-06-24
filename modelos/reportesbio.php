<?php

require '../config/Conexion.php';
class Reportesbio
{
	private $det_id;
	private $det_cantidad;
	private $det_fechadon;
	private $don_cedula;
	private $cat_id;
	private $cat_descripcion;
	
public function __construct(){

}
	
	//metodos 

public function mostrar_det(){
	$sql="CALL sp_detalle_reporte();";
  	return ejecutarConsultaSP($sql);
}
		
	
}
?>