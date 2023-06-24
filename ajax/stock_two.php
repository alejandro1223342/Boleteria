<?php 
session_start();
require_once "../modelos/stock_two.php";

$usuario=new Stock();


$det_id=isset($_POST["det_id"])? limpiarCadena($_POST["det_id"]):"";
$det_cantidad=isset($_POST["det_cantidad"])? limpiarCadena($_POST["det_cantidad"]):"";
$det_fechadon=isset($_POST["det_fechadon"])? limpiarCadena($_POST["det_fechadon"]):"";
$don_cedula=isset($_POST["don_cedula"])? limpiarCadena($_POST["don_cedula"]):"";
$cat_id=isset($_POST["cat_id"])? limpiarCadena($_POST["cat_id"]):"";
$cat_descripcion=isset($_POST["cat_descripcion"])? limpiarCadena($_POST["cat_descripcion"]):"";
switch ($_GET["op"]) {
	case 'salir':
	   		//limpiamos la variables de la secion
		session_unset();

		  //destruimos la sesion
		session_destroy();
			  //redireccionamos al usu_login
		header("Location: ../index.php");
		break;
		
			case 'listar':
			$rspta=$usuario->mostrar_det();
			$data=Array();

			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
				"0"=>$reg->det_nombre,
				"1"=>$reg->det_nombre,
				"2"=>$reg->uso_cantidad,
				"3"=>$reg->uso_descripcion,
				"4"=>$reg->usu_nombre,
				"5"=>$reg->uso_fecha
					

				  );
			}
			$results=array(
				 "sEcho"=>1,//info para datatables
				 "iTotalRecords"=>count($data),//enviamos el total de registros al datatable
				 "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
				 "aaData"=>$data); 
			echo json_encode($results);
			break;


	
}
?>