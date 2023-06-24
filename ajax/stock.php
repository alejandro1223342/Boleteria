<?php 
session_start();
require_once "../modelos/stock.php";

$usuario=new Catalogo();


$cat_id=isset($_POST["cat_id"])? limpiarCadena($_POST["cat_id"]):"";
$cat_nombre=isset($_POST["cat_nombre"])? limpiarCadena($_POST["cat_nombre"]):"";
$cat_descripcion=isset($_POST["cat_descripcion"])? limpiarCadena($_POST["cat_descripcion"]):"";
$cat_padre=isset($_POST["cat_padre"])? limpiarCadena($_POST["cat_padre"]):"";
$cat_codigo=isset($_POST["cat_codigo"])? limpiarCadena($_POST["cat_codigo"]):"";
$cat_stock=isset($_POST["cat_stock"])? limpiarCadena($_POST["cat_stock"]):"";

switch ($_GET["op"]) {
	case 'salir':
	   		//limpiamos la variables de la secion
		session_unset();

		  //destruimos la sesion
		session_destroy();
			  //redireccionamos al usu_login
		header("Location: ../index.php");
		break;
		
	case 'guardaryeditar':
		if (empty($cat_id)) {
			$rspta=$usuario->insertar_cat($cat_nombre,$cat_descripcion,$cat_padre,$cat_codigo);
			echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";
		}else{
			 $rspta=$usuario->actualizar_cat($cat_nombre,$cat_descripcion,$cat_codigo);
			echo $rspta ? "Datos actualizados correctamente" : "No se pudo actualizar los datos";
		}
		break;
	

	case 'eliminar':
		$rspta=$persona->eliminar($cat_id);
		echo $rspta ? "Datos eliminados correctamente" : "No se pudo eliminar los datos";
		break;
	


	
			case 'combo_categoria':			
			$rspta = $usuario->mostrar_combo();
				echo'<option value="-1">Seleccione la Referencia </option>';
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->cat_id.'>'.$reg->cat_nombre.'</option>';
			}
			break;
		
			case 'listar':
			$rspta=$usuario->mostrar_cat();
			$data=Array();

			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
				"0"=>$reg->cat_nombre,
				"1"=>$reg->cat_descripcion,
				"2"=>$reg->det_fechacad,
				"3"=>$reg->categoria, 
				"4"=>$reg->cat_codigo, 
				"5"=>$reg->saldo
				
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

