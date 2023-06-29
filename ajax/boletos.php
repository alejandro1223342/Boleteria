<?php 
session_start();
require_once "../modelos/boletos.php";

$boletos=new boletos();

$claveu=isset($_POST["claveu"])? limpiarCadena($_POST["claveu"]):"";

$eve_id=isset($_POST["eve_id"])? limpiarCadena($_POST["eve_id"]):"";
$cat_id_bol=isset($_POST["cat_id_bol"])? limpiarCadena($_POST["cat_id_bol"]):"";
$bol_precio=isset($_POST["bol_precio"])? limpiarCadena($_POST["bol_precio"]):"";
$bol_cantidad=isset($_POST["bol_cantidad"])? limpiarCadena($_POST["bol_cantidad"]):"";

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
		//$rspta=$clientes->donador_d();
	
		$rspta=$boletos->insertar_boletos($_POST["evento"],$_POST["tipoboleto"],$bol_precio,$bol_cantidad);
										
		echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";
		
		/*
		
	}/*else{
         $rspta=$persona->editar($idpersona,$tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email);
		echo $rspta ? "Datos actualizados correctamente" : "No se pudo actualizar los datos";
	}
		*/
		break;
		
		case 'listar':
	    $rspta=$boletos->listar();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            "0"=>$reg->eve_id,
            "1"=>$reg->cat_id_bol,
            "2"=>$reg->bol_precio,
            "3"=>$reg->bol_cantidad,
            
              );
		}
		$results=array(
             "sEcho"=>1,//info para datatables
             "iTotalRecords"=>count($data),//enviamos el total de registros al datatable
             "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
             "aaData"=>$data); 
		echo json_encode($results);
	    break;
	/*
	case 'combo_categoria':			
			$rspta = $donadores->obten_combo(1);
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->cat_id.'>'.$reg->cat_nombre.'</option>';
			}
			break;	
		
	case 'combo_subcategoria':			
			$rspta = $donadores->obten_combo(7);
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->cat_id.'>'.$reg->cat_nombre.'</option>';
			}
			break;	
	case 'combo_materiales':	
			$rspta = $donadores->obten_combo(9);
		
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->cat_id.'>'.$reg->cat_nombre.'-'.$reg->cat_descripcion.'</option>'
					;
			}
			break;
	case 'combo_estado':	
			$rspta = $donadores->obten_combo(13);
		
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->cat_id.'>'.$reg->cat_nombre.'</option>'
					;
			}
			break;
		
		case 'combo_donadores':	
			$rspta = $donadores->combo_donadores();
		
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->don_cedula.'>'.$reg->don_nombre.'</option>'
					;
			}
			break;
*/
		case 'combo_eventos':	
			$rspta = $boletos->combo_eventos();
		
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->eve_id.'>'.$reg->eve_nombre.'</option>'
					;
			}
			break;
		
		case 'combo_tipoboletos':	
			$rspta = $boletos->combo_tipoboletos(2);
		
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->cat_id.'>'.$reg->cat_nombre.'</option>'
					;
			}
			break;

	
}
		
?>