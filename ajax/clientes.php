<?php 
session_start();
require_once "../modelos/clientes.php";

$clientes=new clientes();

$claveu=isset($_POST["claveu"])? limpiarCadena($_POST["claveu"]):"";

$cli_cedula=isset($_POST["cli_cedula"])? limpiarCadena($_POST["cli_cedula"]):"";
$cli_nombre=isset($_POST["cli_nombre"])? limpiarCadena($_POST["cli_nombre"]):"";
$cli_telefono=isset($_POST["cli_telefono"])? limpiarCadena($_POST["cli_telefono"]):"";
$cli_correo=isset($_POST["cli_correo"])? limpiarCadena($_POST["cli_correo"]):"";
$cli_direccion=isset($_POST["cli_direccion"])? limpiarCadena($_POST["cli_direccion"]):"";
$cli_fecha=isset($_POST["cli_fecha"])? limpiarCadena($_POST["cli_fecha"]):"";


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
	
		$rspta=$clientes->insertar_clientes($cli_cedula,$cli_nombre,$cli_telefono,$cli_correo,$cli_direccion);
										
		echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";
		
		/*
		
	}/*else{
         $rspta=$persona->editar($idpersona,$tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email);
		echo $rspta ? "Datos actualizados correctamente" : "No se pudo actualizar los datos";
	}
		*/
		break;
		
		case 'listar':
	    $rspta=$clientes->listar();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
            "0"=>$reg->cli_cedula,
            "1"=>$reg->cli_nombre,
            "2"=>$reg->cli_telefono,
            "3"=>$reg->cli_correo,
            "4"=>$reg->cli_direccion,
			"5"=>$reg->cli_fecha,
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