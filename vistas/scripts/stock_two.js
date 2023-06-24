// JavaScript Document
var tabla;

//funcion que se ejecuta al inicio
function init(){
   listar(true);
   $("#formulario").on("submit",function(e){
   	guardaryeditar(e);
   })

	
}

function listar(){
	tabla=$('#tbllistado_det').dataTable({
		"aProcessing": true,//activamos el procedimiento del datatable
		"aServerSide": true,//paginacion y filrado realizados por el server
		
		dom: 'Bfrtip',
        buttons: [
            'copy', 'excel', 'pdf',
        ],
		
		"ajax":
		{
			url:'../ajax/stock_two.php?op=listar',
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