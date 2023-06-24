var tabla;


//funcion que se ejecuta al inicio
function init(){
   mostrarform(false);
   listar();
   $("#formulario").on("submit",function(e){
   	guardaryeditar(e);
   })

   
//mostramos los combos
	
	$.post("../ajax/usos.php?op=combo_materiales", function(r){
   	$("#det_id").html(r);
   	$("#det_id").selectpicker('refresh');
     });
	
$.post("../ajax/usos.php?op=combo_usuario", function(r){
   	$("#usu_id").html(r);
   	$("#usu_id").selectpicker('refresh');
     });
	

	
}

function ShowSelected() { 
    $.ajax({
     	url: "../ajax/usos.php?op=mateconsu&id="+$("#det_id").val(),
     	type: "get",
		 
     
     	contentType: false,
     	processData: false,
		
     	success: function(datos){
			
     				if (datos==6 || datos==8 || datos==9 || datos==1 || datos==10 || datos==12 || datos==13)
			      $("#cantidadtxt").text("Cantidad(*): unidades");
			
			else 
				  $("#cantidadtxt").text("Cantidad(*): gr/ml");
		
     	}
});
}

function Cantidad() { 
    $.ajax({
     	url: "../ajax/usos.php?op=saldodonacion&cant="+$("#uso_cantidad").val()+"&id="+$("#det_id").val(),
     	type: "get",
		 
     
     	contentType: false,
     	processData: false,
		
     	success: function(datos){
			if (datos!=-1){
				alert("error al consumir el saldo que puede consumir es: "+datos  );
				$("#btnGuardar").hide();
			}
			else{
				$("#btnGuardar").show();
			}	
			
		
     	}
});
}


function elimina_u(){
	alert("Exito al realizar la operación");
     
}

//funcion limpiar
function limpiar(){
	$("#usu_nombre").val("");
    $("#usu_cedula").val("");
	$("#usu_telefono").val("");
	$("#usu_correo").val("");
	$("#usu_cargo").val("");
	$("#usu_login").val("");
	$("#usu_clave").val("");
	$("#usu_id").val("");
	$("#claveu").val("");
}

//funcion mostrar formulario
function mostrarform(flag){
	limpiar();
	if(flag){
		$("#listadoregistros").SHOW();
		$("#formularioregistros").show();
		$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").show();
	}else{
		$("#listadoregistros").show();
		$("#formularioregistros").show();
		$("#btnagregar").show();
	}
}

//funcion listar
function listar(){
	tabla=$('#tbllistado').dataTable({
		"aProcessing": true,//activamos el procedimiento del datatable
		"aServerSide": true,//paginacion y filrado realizados por el server
		
		"ajax":
		{
			url:'../ajax/usos.php?op=listar',
			type: "get",
			dataType : "json",
			error:function(e){
				console.log(e.responseText);
			}
		},
		"bDestroy":true,
		"iDisplayLength":15,//paginacion
		"order":[[0,"desc"]]//ordenar (columna, orden)
	}).DataTable();
}
//funcion para guardaryeditar
function guardaryeditar(e){
     e.preventDefault();//no se activara la accion predeterminada 
     $("#btnGuardar").prop("disabled",true);
     var formData=new FormData($("#formulario")[0]);

     $.ajax({
     	url: "../ajax/usos.php?op=guardaryeditar",
     	type: "POST",
     	data: formData,
     	contentType: false,
     	processData: false,

     	success: function(datos){
     		bootbox.alert(datos);
     		mostrarform(false);
     		tabla.ajax.reload();
     	}
     });

     limpiar();
}

function ConfirnDelete(){
	var respuesta = confirm("Estas seguro de Eliminar?");
	if (respuesta == true){
	return true;
	}
	else{
	}
}

init();