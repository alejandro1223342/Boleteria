<?php 
session_start();
require_once "../modelos/usos.php";

$usuario=new Usos();


$uso_id=isset($_POST["uso_id"])? limpiarCadena($_POST["uso_id"]):"";
$uso_cantidad=isset($_POST["uso_cantidad"])? limpiarCadena($_POST["uso_cantidad"]):"";
$uso_descripcion=isset($_POST["uso_descripcion"])? limpiarCadena($_POST["uso_descripcion"]):"";
$usu_id=isset($_POST["usu_id"])? limpiarCadena($_POST["usu_id"]):"";


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
		if (empty($uso_id)) {
			$rspta=$usuario->insertar_usos($uso_cantidad,$uso_descripcion,$usu_id);
			echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";
		}else{
			 $rspta=$usuario->actualizar_usos($uso_cantidad,$uso_descripcion);
			echo $rspta ? "Datos actualizados correctamente" : "No se pudo actualizar los datos";
		}
		break;
	

	case 'eliminar':
		$rspta=$persona->eliminar($uso_id);
		echo $rspta ? "Datos eliminados correctamente" : "No se pudo eliminar los datos";
		break;
	


	
			case 'combo_usos':			
			$rspta = $usuario->mostrar_combo();
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->uso_id.'>'.$reg->usu_nombre.'</option>';
			}
			break;
		
			case 'listar':
			$rspta=$usuario->mostrar_usos();
			$data=Array();

			while ($reg=$rspta->fetch_object()) {
				$data[]=array(
					
				"0"=>$reg->uso_id,
				"1"=>$reg->uso_cantidad,
				"2"=>$reg->uso_descripcion,
				"3"=>$reg->usu_id,
				"4"=>'<button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i>  Editar</button>',
				"5"=>'<button class="btn btn-primary" type="submit" id="btnEliminar"><i class="fa fa-save"></i>  Eliminar</button>'
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

