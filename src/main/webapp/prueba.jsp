<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Prueba sesión/title>
</head>

<body>
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
	
	<p align = center>
		Si lees esto, estás en sesión.
		<br><br>
		Usuario: <%= userS.getName() %>
		</br><br>
		<a href = welcomeUser.jsp>Probar sesión</a>
		<br><br>
		<a href = "<%=request.getContextPath()%>/CloseSession">Salir</a>
		<!-- Creo que no se cierra -->
	</p>
</body>
</html>