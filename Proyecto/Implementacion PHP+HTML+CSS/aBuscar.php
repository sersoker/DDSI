<!doctype html public "-//W3C//DTD HTML 4.0 //EN">
<html>

<head>
 <title>Visualizar los datos</title>
</head>

<?
	 $conexion=mysql_connect("db4free.net","sersoker","sersoker@yopmail.com");
	 mysql_select_db("aosuidgsjb",$conexion);
			
	if (isset ($_POST["Buscar"])){
		$sql="SELECT * FROM Productos WHERE Referencia='$_POST[DATO]' or Nombre='$_POST[DATO]' or Tipo='$_POST[DATO]';";

			 $tabla=mysql_query($sql,$conexion);
			echo ' <table border solid><tr>
			 <td>Referencia</td> <td>Nombre</td> <td>Tipo</td> <td>PrecioCompra</td>
			 <td>PrecioVenta</td> <td>IVA</td> <td>Peso</td> <td>Volumen</td> <td>Proveedor</td> ';
	if(mysql_num_rows($tabla)==0){
		echo '<h1> NO HAY RESULTADOS</h1>';	
	}
	else{
	 $numfila=mysql_num_rows($tabla);
			for ($i=0;$i<$numfila;$i++){
				$fila=mysql_fetch_row($tabla);
				echo" <tr>
				 <td> $fila[0] </td> <td> $fila[1] </td>
				 <td> $fila[2] </td> <td> $fila[3] </td>
				 <td> $fila[4] </td> <td> $fila[5] </td>
				 <td> $fila[6] </td> <td> $fila[7] </td>
				 <td> $fila[8] </td> </tr>";
		 	} 
			
			echo '</table>
			<form action="aBuscar.php" method="post">
			<input type="submit" value="Buscar Otro Producto"/>
			</form>
			<form action="almacen.html" method="post">
			<input type="submit" value="Inicio"/>
			</form>';
	}	
	}
	else{
 		echo '
		<form action="aBuscar.php" method="post">
		Dato a Buscar: <input type="text" name="DATO" value="Referencia/Tipo/Nombre">
		<br>
		<input type="submit" name="Buscar" value="Buscar">
		</form>';
	}

?>

</body>
</html>
