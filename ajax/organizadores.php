<?php 
session_start();
require_once "../modelos/organizadores.php";

$organizadores=new organizadores();

$claveu=isset($_POST["claveu"])? limpiarCadena($_POST["claveu"]):"";

$org_nombre=isset($_POST["org_nombre"])? limpiarCadena($_POST["org_nombre"]):"";
$org_telefono=isset($_POST["org_telefono"])? limpiarCadena($_POST["org_telefono"]):"";
$org_correo=isset($_POST["org_correo"])? limpiarCadena($_POST["org_correo"]):"";
$org_direccion=isset($_POST["org_direccion"])? limpiarCadena($_POST["org_direccion"]):"";
$org_fecha=isset($_POST["org_fecha"])? limpiarCadena($_POST["org_fecha"]):"";


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
	
		$rspta=$organizadores->insertar_organizadores($org_nombre,$org_telefono,$org_correo,$org_direccion);
										
		echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";
		
		/*
		
	}/*else{
         $rspta=$persona->editar($idpersona,$tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email);
		echo $rspta ? "Datos actualizados correctamente" : "No se pudo actualizar los datos";
	}
		*/
		break;
		
		case 'listar':
	    $rspta=$organizadores->listar();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            "0"=>$reg->org_nombre,
            "1"=>$reg->org_telefono,
            "2"=>$reg->org_correo,
            "3"=>$reg->org_direccion,
			"4"=>$reg->org_fecha,
              );
		}
		$results=array(
             "sEcho"=>1,//info para datatables
             "iTotalRecords"=>count($data),//enviamos el total de registros al datatable
             "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
             "aaData"=>$data); 
		echo json_encode($results);
	    break;
		

		
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


	
}
		
?>