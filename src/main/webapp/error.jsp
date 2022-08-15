<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Error</title>
</head>

<body>
	<% int error = (int) request.getAttribute("errorType");
	   String msg = "";
	   
	   if (error == 1) {
		   msg = "Usuario y/o contraseña erróneos.";
	   }
	%>
	
	<table border = 5 width = 100% bgcolor = white>
		<tr>
			<th align = "left" style= "max-width: 11px">
				<img src = "logoejemplo.png">
			</th>
			<th>
				<a href = "index.html">Inicio</a>
			</th>
			<th align = "right">
				<a href = "login.html">Iniciar sesión</a>
			</th>
		</tr>
	</table>
	
	<p align = "center">
		<font face = "tahoma" size = "15" color = "red"><b>Error</b></font>
		<br><br>
		<font face = "tahoma" size = "5"><%=msg%></font>
		<br><br>
		<a href = "index.html">Regresar</a>
	</p>
</body>