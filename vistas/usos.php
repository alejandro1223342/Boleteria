<?php 
//activamos almacenamiento en el buffer
ob_start();
session_start();
if (!isset($_SESSION['usu_nombre'])) {
  header("Location: login.html");
}else{

require 'header.php';
if ($_SESSION['Actas']==0) {
 ?>
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="row">
        <div class="col-md-12">
      <div class="box">
<div class="box-header with-border">
  <h1 class="box-title">Registro de usos</h1>
  <div class="box-tools pull-right">
    
  </div>
</div>
<!--box-header-->
<!--centro-->

<div class="panel-body" id="formularioregistros">
	
	
  <form action="" name="formulario" id="formulario" method="POST">
	 
	   <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Bienes y consumibles(*):</label>
           <select id="det_id" onchange="ShowSelected();" name="det_id" data-live-search="true" class="form-control selectpicker" required></select>
		</div>
		
	      <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Detalle(*)(Máximo 200 caractéres): </label>
      <input type="text" class="form-control" name="uso_descripcion" id="uso_descripcion" placeholder="Descripcion" maxlength="200">
    </div>
	  
	<div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="" id="cantidadtxt">Cantidad(*)</label>
      <input class="form-control" type="text" name="uso_cantidad" id="uso_cantidad" onchange="Cantidad();" maxlength="20" placeholder="Cantidad" required>
    </div>
	  
	  <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Usuario(*)</label>
     <select id="usu_id" name="usu_id" class="form-control selectpicker" data-live-search="true" required></select>
    </div>
	  
    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i>  Guardar</button>
    </div>
  </form>
</div>
		  <div style="width:900" id="listadoregistros">
  <table id="tbllistado"  class="table table-striped table-bordered table-condensed table-hover"> 
    <thead>
		<th>Accion</th>
     <th>Articulo</th>
		<th>Descripcion</th>
	 <th>Detalle</th>
	 <th>Cantidad</th>	
	<th>Uauario</th>	
	<th>F.Registro</th>	
    </thead>
    <tbody>
    </tbody>   
  </table>
</div>
<!--fin centro-->
      </div>
      </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>

<?php 
}else{
 require 'noacceso.php'; 
}
require 'footer.php';
 ?>
 <script src="scripts/hmac-sha256.js"></script>
 <script src="scripts/usos.js"></script>
 <?php 
}

ob_end_flush();
  ?>