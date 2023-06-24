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
  $.post("../ajax/stock.php?op=combo_categoria", function(r){
   	$("#cat_padre").html(r);
   	$("#cat_padre").selectpicker('refresh');
     });
	
}

//funcion limpiar
function limpiar(){
	$("#cat_id").val("");
    $("#cat_nombre").val("");
	$("#cat_descripcion").val("");
	$("#cat_padre").val("");
	$("#cat_codigo").val("");
	$("#claveu").val("");
}


//funcion mostrar formulario
function mostrarform(flag){
	limpiar();
	if(flag){
		$("#listadocatalogo").hide();
		$("#formulariocatalogo").hide();
		$("#btnGuardar").prop("disabled",false);

	}else{
		$("#listadocatalogo").show();
		$("#formulariocatalogo").show();

	}
}

//cancelar form
function cancelarform(){
	limpiar();
	mostrarform(false);
}

function listar(){
	tabla=$('#tbllistado_cat').dataTable({
		"aProcessing": true,//activamos el procedimiento del datatable
		"aServerSide": true,//paginacion y filrado realizados por el server
		
		dom: 'Bfrtip',
        buttons: [
            'copy', 'excel', 'pdf',
        ],
		
		"ajax":
		{
			url:'../ajax/stock.php?op=listar',
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
     	url: "../ajax/stock.php?op=guardaryeditar",
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
     var formData=new FormData($("#formulario")[0]);

     $.ajax({
     	url: "../ajax/stock.php?op=eliminar",
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