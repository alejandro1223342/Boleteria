<?php 
session_start();
require_once "../modelos/reportesbio.php";

$usuario=new Reportesbio();


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
				"0"=>$reg->det_id,
				"1"=>$reg->cat_nombre,
				"2"=>$reg->cat_descripcion,
				"3"=>$reg->det_cantidad,
				"4"=>$reg->det_fechadon,
				"5"=>$reg->don_nombre

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