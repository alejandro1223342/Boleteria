<?php 
session_start();
require_once "../modelos/eventos.php";

$eventos=new eventos();

$claveu=isset($_POST["claveu"])? limpiarCadena($_POST["claveu"]):"";

$eve_nombre=isset($_POST["eve_nombre"])? limpiarCadena($_POST["eve_nombre"]):"";
$eve_nombrelugar=isset($_POST["eve_nombrelugar"])? limpiarCadena($_POST["eve_nombrelugar"]):"";
$eve_fecha=isset($_POST["eve_fecha"])? limpiarCadena($_POST["eve_fecha"]):"";
$eve_direccion=isset($_POST["eve_direccion"])? limpiarCadena($_POST["eve_direccion"]):"";
$cat_id_tipoeve=isset($_POST["cat_id_tipoeve"])? limpiarCadena($_POST["cat_id_tipoeve"]):"";
$org_id=isset($_POST["org_id"])? limpiarCadena($_POST["org_id"]):"";


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
	
		$rspta=$eventos->insertar_eventos($eve_nombre,$eve_nombrelugar,$eve_fecha,$eve_direccion,$_POST["tipoevento"],$_POST["organizador"]);
										
		echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";
		
		/*
		
	}/*else{
         $rspta=$persona->editar($idpersona,$tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email);
		echo $rspta ? "Datos actualizados correctamente" : "No se pudo actualizar los datos";
	}
		*/
		break;
		
		case 'listar':
	    $rspta=$eventos->listar();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            "0"=>$reg->eve_nombre,
            "1"=>$reg->eve_nombrelugar,
            "2"=>$reg->eve_fecha,
            "3"=>$reg->eve_direccion,
            "4"=>$reg->org_nombre,
			"5"=>$reg->cat_nombre,
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
			$rspta = $eventos->obten_combo(3);
		
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->cat_id.'>'.$reg->cat_nombre.'</option>'
					;
			}
			break;
		
		case 'combo_organizadores':	
			$rspta = $eventos->combo_organizadores();
		
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->org_id.'>'.$reg->org_nombre.'</option>'
					;
			}
			break;

	
}
		
?>