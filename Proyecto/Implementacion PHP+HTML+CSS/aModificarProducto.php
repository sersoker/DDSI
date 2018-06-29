<!doctype html public "-//W3C//DTD HTML 4.0 //EN">
<html>

<head>
 <title>Visualizar los datos</title>
</head>

<body>
<table border solid>

	 <?

	 $conexion=mysql_connect("db4free.net","sersoker","sersoker@yopmail.com");
	 mysql_select_db("aosuidgsjb",$conexion);

	 echo '

		 <form action="aModificarProducto.php" method="post">
		
		 Referencia de producto a modificar: <input type="text" name="Referencia"><br>
		NUEVOS DATOS: <br>
		 Nombre: <input type="text" name="Nombre">
		 Tipo: <input type="text" name="Tipo"><br>
		 Precio Compra: <input type="text" name="PrecioCompra">
		 Precio Venta: <input type="text" name="PrecioVenta"><br>
		 IVA: <input type="text" name="IVA">
		 Peso: <input type="text" name="Peso"><br>
		 Volumen: <input type="text" name="Volumen">
		 Proveedor: <input type="text" name="Proveedor"><br><br>


		 <input type="submit" name="Modificar" value="Modificar">

		 </form>';


		 if (isset ($_POST["Modificar"])) {

			 if ( mysql_select_db("aosuidgsjb",$conexion)) {

			 $sql="UPDATE Productos
				SET Nombre='$_POST[Nombre]'
				,Tipo='$_POST[Tipo]'
				,PrecioCompra='$_POST[PrecioCompra]'
				,PrecioVenta= '$_POST[PrecioVenta]'		
				,IVA='$_POST[IVA]'
				,Peso='$_POST[Peso]'
				,Volumen='$_POST[Volumen]'
				,Proveedor='$_POST[Proveedor]'
				WHERE Referencia='$_POST[Referencia]'";

			 mysql_query($sql,$conexion);
			 }

		 }


		 ?>

		<form action="almacen.html" method="post">

		<a href="almacen.html"><input type="submit" value="Atras"/></a>
<br><br><br>
		</form>
		
		<?
			if (isset ($_POST["Modificar"])){
			echo "<br>";
			 echo "Art&iacute;culos introducido correctamente <br> <br>";
			 echo "Datos Modificados: '$_POST[Referencia]','$_POST[Nombre]','$_POST[Tipo]',
								'$_POST[PrecioCompra]','$_POST[PrecioVenta]','$_POST[IVA]',
								'$_POST[Peso]','$_POST[Volumen]','$_POST[Proveedor]'";
			}

		?>

</body>
</html>

<?

