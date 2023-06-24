// JavaScript Document
var tabla;

//funcion que se ejecuta al inicio
function init(){
   mostrarform(false);
   listar();
   $("#formulario").on("submit",function(e){
   	guardaryeditar(e);
   })
	
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
		$("#listado").hide();
		$("#formulariousos").show();
		$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").hide();
	}else{
		$("#listado").show();
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
	tabla=$('#tbllistado_stock').dataTable({
		"aProcessing": true,//activamos el procedimiento del datatable
		"aServerSide": true,//paginacion y filrado realizados por el server
		
		"ajax":
		{
			url:'../ajax/Stockconsumibles.php?op=listar',
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
     var formData=new FormData($("../ajax/Stockconsumible.php?op=eliminar")[0]);

     $.ajax({
     	url: "../ajax/Stockconsumible.php?op=eliminar",
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

init();// JavaScript Document