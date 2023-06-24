<?php 
session_start();
require_once "../modelos/usos.php";

$donadores = new Usos();

$claveu=isset($_POST["claveu"])? limpiarCadena($_POST["claveu"]):"";
$uso_id=isset($_POST["uso_id"])? limpiarCadena($_POST["uso_id"]):"";
$uso_descripcion=isset($_POST["uso_descripcion"])? limpiarCadena($_POST["uso_descripcion"]):"";
$uso_cantidad=isset($_POST["uso_cantidad"])? limpiarCadena($_POST["uso_cantidad"]):"";
$det_id=isset($_POST["det_id"])? limpiarCadena($_POST["det_id"]):"";
$cat_nombre=isset($_POST["cat_nombre"])? limpiarCadena($_POST["cat_nombre"]):"";
$cat_descripcion=isset($_POST["cat_descripcion"])? limpiarCadena($_POST["cat_descripcion"]):"";
$usu_id=isset($_POST["usu_id"])? limpiarCadena($_POST["usu_id"]):"";
$id=isset($_GET["id"])? limpiarCadena($_GET["id"]):"";

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
		$rspta=$donadores->max_cantidad($det_id);
		$reg=$rspta->fetch_object();
		if($uso_cantidad<= $reg->det_cantidad){
	if (empty($idpersona)) {
											 
		$rspta=$donadores->insertar_usos($det_id,$uso_descripcion,$uso_cantidad,$usu_id);

		echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";
		}
	}else{
			echo "No hay esa cantidad del bien/consumible";
		}
		break;
		
		case 'listar':
	    $rspta=$donadores->listar();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
			"0"=>'<a href="../ajax/usos.php?op=eliminar&id='.$reg->uso_id.'" ><button class="btn btn-success" type="button" onclick="return elimina_u()" ><i class="fa fa-plus-circle"></i>Eliminar / Devolver</button>',
            "1"=>$reg->det_nombre,
			"2"=>$reg->cat_descripcion,	
		    "3"=>$reg->uso_descripcion,
			"4"=>$reg->uso_cantidad,
			"5"=>$reg->usu_nombre,
			"6"=>$reg->uso_fecha
              );
		}
		$results=array(
             "sEcho"=>1,//info para datatables
             "iTotalRecords"=>count($data),//enviamos el total de registros al datatable
             "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
             "aaData"=>$data); 
		echo json_encode($results);
	    break;
		
			case 'eliminar':
	
		$rspta=$donadores->elimina_u($id);
		header("Location:../vistas/usos.php");
		break;
		
	case 'combo_materiales':	
			$rspta = $donadores->obten_categoria();
		echo'<option value="">Seleccione el bien  o consumible </option>';
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->det_id.'>'.$reg->cat_nombre.' '.$reg->cat_descripcion.' - Saldo: '.$reg->saldo.' - Caduca  el: '.$reg->det_fechacad.'</option>'
					;
			}
			break;
		
		case 'combo_usuario':	
			$rspta = $donadores->obten_usuarios();
		echo'<option value="">Seleccione el usuario </option>';
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->usu_id.'>'.$reg->usu_nombre.'</option>'
					;
			}
			break;
		
		case 'mateconsu':	
			$rspta = $donadores->mateconsu($_GET["id"]);
		
			while ($reg = $rspta->fetch_object()) {
				echo $reg->cat_padre;
			}
		    break;
		case 'saldodonacion':	
			$rspta = $donadores->saldodonacion($_GET["id"]);
			while ($reg = $rspta->fetch_object()) {
				$saldo=$reg->saldo;
			}  
		    if ($_GET["cant"]<=$saldo and $saldo!=0 )
				echo -1;
		    else
				echo $saldo;
		    break;

	
}
		
?>