// JavaScript Document
var tabla;

//funcion que se ejecuta al inicio
function init(){
   listar(true);
   $("#formulario").on("submit",function(e){
   	guardaryeditar(e);
   })

   
//mostramos los combos
  $.post("../ajax/catalogo.php?op=combo_categoria", function(r){
   	$("#cat_padre").html(r);
   	$("#cat_padre").selectpicker('refresh');
     });
	
}

function listar(){
	tabla=$('#tbllistado_det').dataTable({
		"aProcessing": true,//activamos el procedimiento del datatable
		"aServerSide": true,//paginacion y filrado realizados por el server
		
		"ajax":
		{
			url:'../ajax/reportesbio.php?op=listar',
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

function imprecat(){
	  var ventimp = window.open(' ', 'popimpr');
	  ventimp.document.write($( '#listadoreportes' ).html());
	  ventimp.document.close();
	  ventimp.print( );
	  ventimp.close();
}

init();