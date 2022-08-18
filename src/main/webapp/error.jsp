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
	   String volver = "";
	   
	   switch (error) {
	   		case 1:
	   			msg = "Usuario y/o contraseña erróneos.";
	 		    volver = "login.html";
	   			break;
	   			
	   		case 2:
	   			msg = "Sesión expirada.";
	 		    volver = "index.html";
	   			break;
	   			
	   		case 3:
	   			msg = "La contraseña debe tener como mínimo 8 caracteres.";
	 		    volver = "registro.jsp";	
	   			break;
	   			
	   		case 4:
	   			msg = "Las contraseñas ingresadas no coinciden.";
	 		    volver = "registro.jsp";
	   			break;
	   			
	   		case 5:
	   			msg = "Ya existe una cuenta con el dni ingresado. <br><br><a href = \"olvideContraseña\">¿Olvidaste tu contraseña?</a>";
	 		    volver = "registro.jsp";
	   			break;
	   			
	   		case 6:
	   			msg = "Ya existe una cuenta con el nombre de usuario ingresado. <br><br><a href = \"olvideContraseña\">¿Olvidaste tu contraseña?</a>";
	 		    volver = "registro.jsp";
	   			break;
	   			
	   		case 7:
	   			msg = "Ya existe una cuenta con el mail ingresado. <br><br><a href = \"olvideContraseña\">¿Olvidaste tu contraseña?</a>";
	 		    volver = "registro.jsp";
	   			break;
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
		<a href = <%=volver%>>Regresar</a>
	</p>
</body>