<?php 
session_start();
require_once "../modelos/Stockconsumibles.php";

$usuario=new Stockconsumible();


$cat_nombre=isset($_POST["cat_nombre"])? limpiarCadena($_POST["cat_nombre"]):"";
$det_cantidad=isset($_POST["det_cantidad"])? limpiarCadena($_POST["det_cantidad"]):"";
$det_fechacad=isset($_POST["det_fechacad"])? limpiarCadena($_POST["det_fechacad"]):"";


switch ($_GET["op"]) {
	case 'salir':
	   		//limpiamos la variables de la secion
		session_unset();

		  //destruimos la sesion
		session_destroy();
			  //redireccionamos al usu_login
		header("Location: ../index.php");
		break;
		
	

	case 'eliminar':
		$rspta=$persona->eliminar_stock($id);
		echo $rspta ? "Datos eliminados correctamente" : "No se pudo eliminar los datos";
		break;
		
	case 'listar':
		$rspta=$usuario->mostrar_stock();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
					
				
				"0"=>$reg->cat_nombre,
				"1"=>$reg->det_cantidad,
				"2"=>$reg->det_fechacad,
				"3"=>'<button class="btn btn-success" onclick="mostrarform(true)" id="btnEliminar"><i class="fa fa-plus-circle"></i>Eliminar</button>'
				
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

