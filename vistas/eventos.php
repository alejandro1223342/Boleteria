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
  <h1 class="box-title">Eventos</h1>
  <div class="box-tools pull-right">
    
  </div>
</div>
<!--box-header-->
<!--centro-->

<div class="panel-body" id="formularioregistros">
  <form action="" name="formulario" id="formulario" method="POST">
    <div class="form-group col-lg-6 col-md-12 col-xs-12">
      <label for="">Nombre del evento(*):</label>
      <!--<input class="form-control" type="text" name="usu_id" id="usu_id">-->
      <input class="form-control" type="text" name="eve_nombre" id="eve_nombre" maxlength="100" placeholder="Nombre del evento" required>
    </div>
   
    <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Lugar del Evento(*):</label>
      <input type="text" class="form-control" name="eve_nombrelugar" id="eve_nombrelugar" placeholder="Lugar del Event" maxlength="200" required>
    </div>
     <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Fecha y Hora del Evento(*)</label>
      <input class="form-control" type="datetime-local" name="eve_fecha" id="eve_fecha" maxlength="20" placeholder="Fecha y Hora del Evento" required>
    </div>
   
    <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Dirección</label>
      <input class="form-control" type="text" name="eve_direccion" id="eve_direccion" maxlength="100" placeholder="Direccion" required>
    </div>
	  
	    <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Organizador(*):</label>
           <select id="organizador" name="organizador" class="form-control selectpicker"></select>
		</div>
	  
	  <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Tipo de Evento(*):</label>
           <select id="tipoevento" name="tipoevento" class="form-control selectpicker"></select>
		</div>
	  
	 
	  
   
	  <!--
    <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Articulo(*):</label>
           <select id="materiales" name="materiales" class="form-control selectpicker"></select>
		</div>
		
    <div class="form-group col-lg-4 col-md-6 col-xs-12">
		<label for="">Estado(*):</label>
           <select id="estado" name="estado" class="form-control selectpicker"></select>
		</div>
	  
	 <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Cantidad(*)</label>
      <input class="form-control" type="text" name="det_cantidad" id="det_cantidad" maxlength="20" placeholder="Cantidad">
    </div>
	  
	     <div class="form-group col-lg-6 col-md-6 col-xs-12">
      <label for="">Caducidad(*):</label>
      <input class="form-control" type="date" name="det_fechacad" id="det_fechacad" maxlength="20" placeholder="Fecha de caducidad" required>
    </div>
	  -->
    <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i>  Guardar</button>
      <button class="btn btn-danger" onclick="cancelarform()" type="button"><i class="fa fa-arrow-circle-left"></i> Cancelar</button>
    </div>
  </form>
</div>
		  <div style="width:900" id="listadoregistros">
  <table id="tbllistado"  class="table table-striped table-bordered table-condensed table-hover"> 
    <thead>
	  
      <th>Nombre</th>
      <th>Lugar</th>
      <th>Fecha</th>
      <th>Dirección</th>
      <th>Organizador</th>
      <th>Evento</th>
    
		
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
 <script src="scripts/eventos.js"></script>
 <?php 
}

ob_end_flush();
  ?>
