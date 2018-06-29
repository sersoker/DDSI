<!doctype html public "-//W3C//DTD HTML 4.0 //EN">
<html>

<head>
 <title>Visualizar los datos</title>
</head>

<body>
<table border solid>

	<tr>
	 <td>Referencia</td>
	 <td>Nombre</td>
	 <td>Tipo</td>
	 <td>PrecioCompra</td>
	 <td>PrecioVenta</td>
	 <td>IVA</td>
	 <td>Peso</td>
	 <td>Volumen</td>
	 <td>Proveedor</td>

	 <?

	 $conexion=mysql_connect("db4free.net","sersoker","sersoker@yopmail.com");

	 mysql_select_db("aosuidgsjb",$conexion);

	 $tabla = mysql_query ('select * from Productos', $conexion);

	 $numfila=mysql_num_rows($tabla);

	 for ($i=0;$i<$numfila;$i++)

	 {

	 $fila=mysql_fetch_row($tabla);

	 echo"<tr>";
	 echo"<td>";
	 echo "$fila[0]";
	 echo"</td>";
	 echo"<td>";
	 echo "$fila[1]";
	 echo"</td>";
	echo"<td>";
	 echo"$fila[2]";
	 echo"</td>";
	echo"<td>";
	 echo"$fila[3]";
	 echo"</td>";
	echo"<td>";
	 echo"$fila[4]";
	 echo"</td>";
	echo"<td>";
	 echo"$fila[5]";
	 echo"</td>";
	echo"<td>";
	 echo"$fila[6]";
	 echo"</td>";
	echo"<td>";
	 echo"$fila[7]";
	 echo"</td>";
	echo"<td>";
	 echo"$fila[8]";
	 echo"</td>";

	 $tabla2=mysql_query ("select * from Productos where Referencia=$fila[0];",$conexion);

	 $numfila2=mysql_num_rows($tabla2);

	 $contador=0;

	 {

	 $fila2=mysql_fetch_row($tabla2);

	 $contador=$contador+$fila2[1];

	 }

	 echo"</tr>";

	 }

	 ?>

	</table>

	<form action="almacen.html" method="post">

	<input type="submit" value="Atras"/>

	</form>

</body>
</html>
