<?php
//activamos almacenamiento en el buffer
ob_start();
session_start();
if (!isset($_SESSION['usu_nombre'])) {
  header("actas: login.html");
}else{

require 'header.php';
if ($_SESSION['Acceso']==0) {
 ?>
 
<div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <!-- Default box -->
      <div class="row">
        <div class="col-md-12">
      <div class="box">
<div class="box-header with-border">
  <h1 class="box-title">Stock</h1>
  <div class="box-tools pull-right">
    
  </div>
</div>
<!--box-header-->
<!--centro-->
<div style="width:900" id="listado">
  <table id="tbllistado_stock"  class="table table-striped table-bordered table-condensed table-hover"> 
    <thead>
      <th>Consumible</th>
	  <th>Cantidad</th>
	  <th>Fecha de caducidad</th>
	  <th></th>
    </thead>
    <tbody>
    </tbody>   
  </table>
</div>
		
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
 <script src="scripts/Stockconsumibles.js"></script>
 <?php 
}
ob_end_flush();
  ?>
