<!doctype html public "-//W3C//DTD HTML 4.0 //EN">
<html>

<head>
 <title>Visualizar los datos</title>
</head>

<body>
<table border solid>

	<tr>
	 <td>Referencia</td>
	 <td>Unidades Vendidas</td>

	 <?

	 $conexion=mysql_connect("db4free.net","sersoker","sersoker@yopmail.com");

	 mysql_select_db("aosuidgsjb",$conexion);

	 $tabla = mysql_query ('select * from Historial', $conexion);

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


	 $tabla2=mysql_query ("select * from Historial where Referencia=$fila[0];",$conexion);

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
