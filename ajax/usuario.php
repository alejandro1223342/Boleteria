<?php 
session_start();
require_once "../modelos/Usuario.php";

$usuario=new Usuario();

$claveu=isset($_POST["claveu"])? limpiarCadena($_POST["claveu"]):"";
$usu_id=isset($_POST["usu_id"])? limpiarCadena($_POST["usu_id"]):"";
$usu_nombre=isset($_POST["usu_nombre"])? limpiarCadena($_POST["usu_nombre"]):"";
$usu_cedula=isset($_POST["usu_cedula"])? limpiarCadena($_POST["usu_cedula"]):"";
$usu_telefono=isset($_POST["usu_telefono"])? limpiarCadena($_POST["usu_telefono"]):"";
$usu_correo=isset($_POST["usu_correo"])? limpiarCadena($_POST["usu_correo"]):"";
$usu_cargo=isset($_POST["usu_cargo"])? limpiarCadena($_POST["usu_cargo"]):"";
$usu_login=isset($_POST["usu_login"])? limpiarCadena($_POST["usu_login"]):"";
$usu_clave=isset($_POST["usu_clave"])? limpiarCadena($_POST["usu_clave"]):"";


switch ($_GET["op"]) {
	case 'verificar':

	//validar si el usuario tiene acceso al sistema
	$logina=$_POST['logina'];
	$clavea=$_POST['clavea'];
    
	//Hash SHA256 en la contraseña
	$clavehash=hash("SHA256", $clavea);
   // echo $usuario->verificar($logina, $clavehash);
	$rspta=$usuario->verificar($logina, $clavehash);
	$fetch=$rspta->fetch_object();
	
	if (isset($fetch)) {	
		# Declaramos la variables de sesion
		$_SESSION['usu_id']=$fetch->usu_id;
		$_SESSION['usu_nombre']=$fetch->usu_nombre;
		$_SESSION['usu_login']=$fetch->usu_login;
		$_SESSION['usu_correo']=$fetch->usu_correo;
		$_SESSION['usu_cedula']=$fetch->usu_cedula;
	   
		$marcados=$usuario->listarp($fetch->usu_id);
			

 		//declaramos el array para almacenar todos los permisos
		$valores=array();

		//almacenamos los permisos marcados en al array
		 while ($per = $marcados->fetch_object()) {
				array_push($valores, $per->per_id);
			}

		//determinamos lo accesos al usuario
			in_array(1, $valores)?$_SESSION['Escritorio']=1:$_SESSION['Escritorio']=0;
			in_array(2, $valores)?$_SESSION['Actas']=1:$_SESSION['Actas']=0;
			in_array(3, $valores)?$_SESSION['Activos']=1:$_SESSION['Activos']=0;
			in_array(4, $valores)?$_SESSION['Generación']=1:$_SESSION['Generación']=0;
			in_array(5, $valores)?$_SESSION['Acceso']=1:$_SESSION['Acceso']=0;
			in_array(6, $valores)?$_SESSION['Reportes']=1:$_SESSION['Reportes']=0;
			in_array(7, $valores)?$_SESSION['Custodios']=1:$_SESSION['Custodios']=0;
			
			

	  }
 //echo $_SESSION['usu_cedula'];
	echo json_encode($fetch);
	break;

	case 'permisos':
			//obtenemos toodos los permisos de la tabla permisos
	require_once "../modelos/Permiso.php";
	$permiso=new Permiso();
	$rspta=$permiso->listar();
//obtener permisos asigandos
	$id=$_GET['id'];
	$marcados=$usuario->listarmarcados($id);
	$valores=array();

//almacenar permisos asigandos
	while ($per=$marcados->fetch_object()) {
		array_push($valores, $per->per_id);
	}
			//mostramos la lista de permisos
	while ($reg=$rspta->fetch_object()) {
		$sw=in_array($reg->per_id,$valores)?'checked':'';
		echo '<li><input type="checkbox" '.$sw.' name="permiso[]" value="'.$reg->per_id.'">'.$reg->per_nombre.'</li>';
	}
	break;

	case 'salir':
	   //limpiamos la variables de la secion
	session_unset();

	  //destruimos la sesion
	session_destroy();
		  //redireccionamos al usu_login
	header("Location: ../index.php");
	break;
		
	case 'guardaryeditar':
	if (empty($idpersona)) {
		$rspta=$usuario->insertar($usu_nombre,$usu_cedula,$usu_telefono,$usu_correo,$usu_cargo,$usu_login,$usu_clave);
	
				echo $rspta ? "Datos registrados correctamente" : "No se pudo registrar los datos";

	}/*else{
         $rspta=$persona->editar($idpersona,$tipo_persona,$nombre,$tipo_documento,$num_documento,$direccion,$telefono,$email);
		echo $rspta ? "Datos actualizados correctamente" : "No se pudo actualizar los datos";
	}
		*/
		break;
		case 'listar':
	    $rspta=$usuario->listar();
		$data=Array();

		while ($reg=$rspta->fetch_object()) {
			$data[]=array(
		    "0"=>$reg->usu_id,
            "1"=>$reg->usu_nombre,
            "2"=>$reg->usu_cedula,
            "3"=>$reg->usu_telefono,
            "4"=>$reg->usu_login,
            "5"=>$reg->usu_correo,
			"6"=>"--",
            "7"=>$reg->usu_condicion     
              );
		}
		$results=array(
             "sEcho"=>1,//info para datatables
             "iTotalRecords"=>count($data),//enviamos el total de registros al datatable
             "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
             "aaData"=>$data); 
		echo json_encode($results);
	    break;
		
	
		
	case 'combo_motivos':			
			$rspta = $usuario->obten_motivos(6);
			while ($reg = $rspta->fetch_object()) {
				echo '<option value='.$reg->cat_id.'>'.$reg->cat_nombre.'</option>';
			}
			break;	


	
}
		
?>

