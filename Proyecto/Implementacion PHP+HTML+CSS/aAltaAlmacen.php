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

		 <form action="aAltaAlmacen.php" method="post">

		 idAlmacen: <input type="text" name="idAlmacen" value="AUTOMATICO"><br>
		 Direccion: <input type="text" name="Direccion"><br>


		 <input type="submit" name="Insertar" value="A&nacute;adir">

		 </form>';


		 if (isset ($_POST["Insertar"])) {

			 if ( mysql_select_db("aosuidgsjb",$conexion)) {

			 $sql="INSERT INTO Almacen(`direccion`) VALUES ('$_POST[Direccion]')";

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
			 echo "Almacen introducido correctamente <br> <br>";
			 echo "Datos añadidos: '$_POST[Direccion]'";
			}

		?>

</body>
</html>

<?

