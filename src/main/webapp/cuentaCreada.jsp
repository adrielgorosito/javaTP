<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registro</title>
	
	<%@ page language = "java" import = "javax.*" %>
	<%@ page language = "java" import = "java.io.*" %>
	<%@ page import = "entities.*" %>
	<% User newUser = (User) request.getAttribute("newUser");
	
		HttpSession sesion = request.getSession();
		sesion.setAttribute("userSession", newUser);
		sesion.setMaxInactiveInterval(30*60); 
	%>
</head>
<body>

	<table border=5 width=100% bgcolor=white>
		<tr>
			<th align = "left" style= "max-width: 11px">
				<img src = "logoejemplo.png">
			</th>
			<th>
				<a href = "index.jsp">Inicio</a>
			</th>
			<th align = "right">
				<a href = "index.jsp">Volver</a>
			</th>
		</tr>
	</table>
	

	<p align = "center">
		<font face = "tahoma" size = 4 color = "green"><b>Cuenta creada exitosamente.</b></font>
		<br><br>
		<font face = "tahoma" size = 3>
			Usuario: <%= newUser.getUsername() %>.<br>
			Nombre y apellido: <%= newUser.getName() %> <%= newUser.getSurname() %>.<br>
			DNI: <%= newUser.getDni() %>.<br>
		</font>
		<br>
		<font face = "tahoma" size = 2><a href = "indexUser.jsp">Ir al inicio</a></font>	
	</p>
</body>
</html>