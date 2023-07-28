 <?php 
if (strlen(session_id())<1) 
  session_start();

  ?>
 <!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>BOLETERIA</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="../public/css/bootstrap.min.css">
  <!-- Font Awesome -->

  <link rel="stylesheet" href="../public/css/font-awesome.min.css">

  <link rel="stylesheet" href="../public/css/AdminLTE.min.css">
  <link rel="stylesheet" href="../public/css/_all-skins.min.css">
  <!-- Morris chart --><!-- Daterange picker -->

<!-- DATATABLES-->
<link rel="stylesheet" href="../public/datatables/jquery.dataTables.min.css">
<link rel="stylesheet" href="../public/datatables/buttons.dataTables.min.css">
<link rel="stylesheet" href="../public/datatables/responsive.dataTables.min.css">
<link rel="stylesheet" href="../public/css/bootstrap-select.min.css">
<link rel="stylesheet" href="../public/css/daterangepicker.css">
</head>
<body class="hold-transition skin-blue sidebar-mini " >

<div class="wrapper">

  <header class="main-header">
    <!-- Logo -->
    <a href="escritorio.php" class="logo" >
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><font size="4">=></font></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><font size="4">MENU</font></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span><font size="4" style="color:#FFF">BOLETERIA - VENTA DE BOLETOS</font></span>
        
      </a>
      
      <div class="navbar-custom-menu">
       
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <span class="hidden-xs"><?php echo $_SESSION['usu_nombre']; ?></span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
             
                <p>
                  BOLETERIA
                  <small>Noviembre 2022</small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
  
                </div>
                <div class="pull-right">
                  <a href="../ajax/usuario.php?op=salir" class="btn btn-default btn-flat">Salir</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->

        </ul>
      </div>
    </nav>
</header>

  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
  
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
     
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      
      <ul class="sidebar-menu" data-widget="tree">

<br>
               <?php 

if ($_SESSION['Actas']==0) {
  echo ' <li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> <span>Registro</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="clientes.php"><i class="fa fa-circle-o"></i>Clientes</a></li>  <li><a href="eventos.php"><i class="fa fa-circle-o"></i>Eventos</a></li>  
			<li><a href="boletos.php"><i class="fa fa-circle-o"></i>Boletos</a></li>  
			<li><a href="organizadores.php"><i class="fa fa-circle-o"></i>Organizadores</a></li>

                 
          </ul>
        </li>';
}
        ?>
               <?php
		  /*
if ($_SESSION['Activos']==1) {
  echo ' <li class="treeview">
          <a href="#">
            <i class="fa fa-th"></i> <span>Opciones de Docente</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="ingreso.php"><i class="fa fa-circle-o"></i> Horario</a></li>
			<li><a href="informes.php"><i class="fa fa-circle-o"></i> Informes</a></li>
            <li><a href="imphorario.php"><i class="fa fa-circle-o"></i> Impresión Horario</a></li>
			<li><a href="cliente.php"><i class="fa fa-circle-o"></i> Permisos</a></li>
          </ul>
        </li>';
}
*/
        ?>
        
               <?php 
if ($_SESSION['Generación']==0) {
  echo '<li class="treeview">
          <a href="#">
            <i class="fa fa-folder"></i> <span>Reportes</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="stock.php"><i class="fa fa-circle-o"></i> Stock</a></li>
			<li><a href="donacionescad.php"><i class="fa fa-circle-o"></i> Donaciones Caducadas</a></li>
			<li><a href="stock_two.php"><i class="fa fa-circle-o"></i> Usos</a></li>
			
            
          </ul>
        </li>';
}
        ?>

                             <?php 
if ($_SESSION['Acceso']==0) {
  echo '  <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i> <span>Acceso</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="usuario.php"><i class="fa fa-circle-o"></i> Usuarios</a></li>
            <li><a href="permiso.php"><i class="fa fa-circle-o"></i> Permisos</a></li>
			 <li><a href="categoria.php"><i class="fa fa-circle-o"></i> Catálogos</a></li>
          </ul>
        </li>';
}
        ?>  
                                     <?php 
		  /*
if ($_SESSION['Reportes']==1) {
  echo '     <li class="treeview">
          <a href="#">
            <i class="fa fa-bar-chart"></i> <span>Reportes</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
             <li><a href="reportesbio.php"><i class="fa fa-circle-o"></i>Reportes de Inventario</a></li>
            
          </ul>
        </li>';
}
        ?>  
              
                                                <?php 
if ($_SESSION['Custodios']==1) {
  echo '<li class="treeview">
          <a href="#">
            <i class="fa fa-bar-chart"></i> <span>Usos</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="usos.php"><i class="fa fa-circle-o"></i> Registro de usos</a></li>
         
     

          </ul>
        </li>';
}
*/
        ?>     

        
        
      </ul>
    </section>
    <!-- /.sidebar -->
 
  </aside>