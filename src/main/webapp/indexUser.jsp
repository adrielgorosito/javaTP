<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Productos</title>
	</head>
<body>
	<table border=5 width=100% bgcolor=white>
		<tr>
			<th align = "left" style= "max-width: 11px">
				<img src = "logoejemplo.png">
			</th>
			<th>
				<a href = "index.html">Inicio</a>
			</th>
			<th align = "right">
				<a href = "index.html">Volver</a>
			</th>
		</tr>
	</table>
	
	<%@ page language = "java" import = "javax.*" %>
	<%@ page language = "java" import = "java.io.*" %>
	<%@ page import = "entities.*" %>
	
	<%
	HttpSession session1 = request.getSession();
	User userS = (User) session1.getAttribute("userSession");

	if (userS == null) {
		request.setAttribute("errorType", 2);
		RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
		rd.forward(request, response);
	}
	%>
	
	<p align = "center">
		<font>Bienvenido, <%= request.getAttribute("userType") %></font>
	</p>
	<p align = "center">Prueba</p><br>
	<a href = index.html>Salir</a>
</body>
</html>