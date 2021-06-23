<?php
  require_once 'layout/autor_header_layout.php';
?>
      <!--------------------------
        | Your Page Content Here |
        -------------------------->
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
		    <!-- Content Header (Page header) -->
		    <section class="content">
		        <div class="row">

		            <div class="col-xs-12">
		                <div class="box">
		                    <div class="box-header">
		                        <h3 class="box-title"><b>Articulos</b></h3>
		                    </div>
		                    <!-- /.box-header -->
		                    <div class="box-body">
		                        <table id="example2" class="table table-bordered table-hover">
		                            <tbody>
		                            <th>Titulo:</th>
		                            <th>Palabras clave:</th>
		                            <th>Estado:</th>
		                            <th></th>
		                            
		                            <?php
			                            if (empty($this->datos)) {
			                                echo '<tr><td>No hay articulos disponibles</td></tr>';
			                            } else {
			                                foreach ($this->datos as $dato) {
			                                    echo "<tr>";

			                                    echo "<td>" . $dato->titulo . "</td>";
			                                    echo "<td>" . $dato->p_claves . "</td>";
			                                    echo "<td>" . $dato->estado . "</td>";
			                                    echo '<td>' .
			                                    '<form action="' . constant('URL') . 'articulos/detalles" method="get">' .
			                                    '<input type="hidden" name="articulo" value="' . $dato->id . '">' .
			                                    '<input type="submit"  class="btn btn-primary" value="detalles">' .
			                                    '</form>' .
			                                    '</td>';
			                                    echo "</tr>";
			                                }
			                            }
		                            ?>
		                            
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- /.box-body -->
		                </div>
		                <!-- /.box -->

		                <!-- /.box -->
		            </div>
		            <!-- /.col -->
		        </div>
		        <!-- /.row -->
		    </section>
		    <!-- /.content -->
		</div>
		<!-- /.content -->
</div>

<?php
  require_once 'layout/autor_footer_layout.php';
?>