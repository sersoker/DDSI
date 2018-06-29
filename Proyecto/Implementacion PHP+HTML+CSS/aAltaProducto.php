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

		 <form action="aAltaProducto.php" method="post">

		 Referencia: <input type="text" name="Referencia"><br>
		 Nombre: <input type="text" name="Nombre"><br>
		 Tipo: <input type="text" name="Tipo"><br>
		 Precio Compra: <input type="text" name="PrecioCompra"><br>
		 Precio Venta: <input type="text" name="PrecioVenta"><br>
		 IVA: <input type="text" name="IVA"><br>
		 Peso: <input type="text" name="Peso"><br>
		 Volumen: <input type="text" name="Volumen"><br>
		 Proveedor: <input type="text" name="Proveedor"><br><br>


		 <input type="submit" name="Insertar" value="A&nacute;adir">

		 </form>';


		 if (isset ($_POST["Insertar"])) {

			 if ( mysql_select_db("aosuidgsjb",$conexion)) {

			 $sql="INSERT INTO Productos(`Nombre`,`Tipo`,`PrecioCompra`,`PrecioVenta`,
  				`IVA`,`Peso`,`Volumen`,`Proveedor`) VALUES ('$_POST[Nombre]','$_POST[Tipo]',
								'$_POST[PrecioCompra]','$_POST[PrecioVenta]','$_POST[IVA]',
								'$_POST[Peso]','$_POST[Volumen]','$_POST[Proveedor]')";

			 mysql_query($sql,$conexion);
			 }

		 }


		 ?>

		<form action="almacen.html" method="post">

		<a href="almacen.html"><input type="submit" value="Atras"/></a>
<br><br><br>
		</form>
		
		<?
			if (isset ($_POST["Insertar"])){
			echo "<br>";
			 echo "Art&iacute;culos introducido correctamente <br> <br>";
			 echo "Datos añadidos: '$_POST[Referencia]','$_POST[Nombre]','$_POST[Tipo]',
								'$_POST[PrecioCompra]','$_POST[PrecioVenta]','$_POST[IVA]',
								'$_POST[Peso]','$_POST[Volumen]','$_POST[Proveedor]'";
			}

		?>

</body>
</html>

<?

