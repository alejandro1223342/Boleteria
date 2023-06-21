// JavaScript Document
var tabla;

//funcion que se ejecuta al inicio
function init(){
   mostrarform(false);
   listar();
   $("#formulario").on("submit",function(e){
   	guardaryeditar(e);
   })

   
//mostramos los combos
  $.post("../ajax/usos.php?op=combo_usos", function(r){
   	$("#uso_id").html(r);
   	$("#uso_id").selectpicker('refresh');
     });
	
}

//funcion limpiar
function limpiar(){
	$("#uso_id").val("");
    $("#uso_cantidad").val("");
	$("#uso_descripcion").val("");
	$("#usu_id").val("");
	$("#claveu").val("");
}


//funcion mostrar formulario
function mostrarform(flag){
	limpiar();
	if(flag){
		$("#listadousos").hide();
		$("#formulariousos").show();
		$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").hide();
	}else{
		$("#listadousos").show();
		$("#formulariousos").hide();
		$("#btnagregar").show();
	}
}


//cancelar form
function cancelarform(){
	limpiar();
	mostrarform(false);
}

function listar(){
	tabla=$('#tbllistado_usos').dataTable({
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

function eliminar(e){
     e.preventDefault();//no se activara la accion predeterminada 
     $("#btnEliminar").prop("disabled",true);
     var formData=new FormData($("../ajax/usos.php?op=eliminar")[0]);

     $.ajax({
     	url: "../ajax/usos.php?op=eliminar",
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

init();