<?php

require '../config/Conexion.php';
class Usos
{
	private $uso_id;
	private $uso_cantidad;
	private $uso_descripcion;
	private $usu_id;
	
public function __construct(){

}
	
	//metodos 
public function eliminar_usos($uso_id){
	$sql="call sp_usos_delete($uso_id)";
  	return ejecutarConsultaSP($sql);
}
public function insertar_usos($uso_cantidad,$uso_descripcion,$usu_id){
	$sql="CALL sp_usos_insert($uso_cantidad,'$uso_descripcion',$usu_id);";
  	return ejecutarConsultaSP($sql);
}
public function mostrar_usos(){
	$sql="CALL sp_usos_select();";
  	return ejecutarConsultaSP($sql);
}
	
public function mostrar_combo(){
	$sql="CALL sp_usos_combo();";
  	return ejecutarConsultaSP($sql);
}
	
public function actualizar_usos($uso_cantidad,$uso_descripcion,$usu_id){
	$sql="CALL `sp_usos_update`($uso_cantidad,'$uso_descripcion',$usu_id)";
  	return ejecutarConsultaSP($sql);
}
	
	function insertarUsos($uso_cantidad,$uso_descripcion,$usu_id){
		
		$con = new Conexion;
		$con->conectar_bdd();
		//comentario
		$sig="select max(usu_id) as sig from usos;";
		$resultado=$con->sacaDataRegistros($sig);
		while($row = mysqli_fetch_assoc($resultado)){
			$siguientes=$row["sig"];
		}
		$siguientes =$siguientes+ 1;
		$sql="INSERT INTO usos (uso_id,uso_cantidad,uso_descripcion,usu_id) VALUES
        ($siguientes,'$uso_cantidad','$uso_descripcion',$usu_id);";
		$resultados =$con->ejecutaSQL($sql);	
		$con->close();
		if($resultados==1){
			return "Resultado Guardado";
		}
		else {
			return $resultados;
		}
	}
	
	
}
?>