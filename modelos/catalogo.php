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
public function mostrar_cat(){
	$sql="CALL sp_catalogo_select();";
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
	
	function insertarCatalogo($cat_nombre,$cat_descripcion,$cat_padre){
		
		$con = new Conexion;
		$con->conectar_bdd();
		//comentario
		$sig="select max(cat_id) as sig from catalogo;";
		$resultado=$con->sacaDataRegistros($sig);
		while($row = mysqli_fetch_assoc($resultado)){
			$siguientes=$row["sig"];
		}
		$siguientes =$siguientes+ 1;
		$sql="INSERT INTO catalogo (cat_id,cat_nombre,cat_descripcion,cat_padre) VALUES
        ($siguientes,'$cat_nombre','$cat_descripcion',$cat_padre);";
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