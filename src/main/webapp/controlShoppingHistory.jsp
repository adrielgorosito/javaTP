<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Historial de compras</title>
		
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
	} else if (userS.isAdmin() == false) {
		request.setAttribute("errorType", 12);
		RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
		rd.forward(request, response);
	}
	%>
	
	<!-- Bootstrap -->
	<!-- ? -->  <link href = "https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300&display=swap" rel = "stylesheet">
	<!-- b5 --> <link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel = "stylesheet" integrity = "sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin = "anonymous">
	<!-- b5 --> <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity = "sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin = "anonymous"></script>
	<!-- b5 --> <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integriy = "sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin = "anonymous"></script>
	<!-- b4 --> <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity = "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin = "anonymous">
	
	<!-- Para el dropdown -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!-- CSS -->
	<link href = "style/estilos.css" rel = "stylesheet">
	<link href = "css/bootstrap.min.css" rel = "stylesheet">
	
		
</head>
<body>

	<nav class="navbar navbar-expand-sm navbar-light sticky-top" id="nave">
		<div class="container-fluid">
			<a class="navbar-brand" href = "indexAdmin.jsp">
				<img src="imgs/index/logo.png" alt="" width="200">
			</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toogle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="indexAdmin.jsp">Inicio</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
    					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><img src = "imgs/index/user.png" alt="" width="60"><%=userS.getName()%> </a>
   						<div class="dropdown-menu dropdown-menu-right">
            	    		<a class="dropdown-item" href = "<%= request.getContextPath()%>/CloseSession">Cerrar Sesión</a>
            	    	</div>
            		</li>
				</ul>
			</div>		
		</div>
	</nav>
	
	<%@ page language = "java" import = "logic.CtrlUser" %>
	<%@ page language = "java" import = "logic.CtrlProduct" %>
	<%@ page language = "java" import = "logic.CtrlShoppingHistory" %>
	<%@ page language = "java" import = "entities.User" %>
	<%@ page language = "java" import = "entities.ShoppingHistory" %>
	<%@ page language = "java" import = "entities.Product" %>
	<%@ page language = "java" import = "java.util.LinkedList" %>
	<%@ page language = "java" import = "java.time.LocalDate" %>
    <%@ page language = "java" import = "java.time.format.DateTimeFormatter" %>
	<% CtrlUser cu = new CtrlUser();
	   User u = new User();
	   ShoppingHistory sh = new ShoppingHistory();
	   
	   if (request.getAttribute("shList") != null) {
		   @SuppressWarnings("unchecked")
		   LinkedList<ShoppingHistory> userHistory = (LinkedList<ShoppingHistory>) request.getAttribute("shList"); %>
	 
			<div class="container">
				<div class="content-center topmargin-lg">
					<% if (!userHistory.isEmpty()) {
							u.setDni(userHistory.get(0).getU().getDni());
							u = cu.searchUserByDni(u);%>
			
							<h3 class ="text-center pt-5 pb-5 h1">Historial de compras de: <b><%=u.getName()%> <%=u.getSurname()%></b></h3>
							<table class="table table-striped">
  								<thead>
    								<tr>
      									<th scope="col">Foto</th>
      									<th scope="col">Producto</th>
      									<th scope="col">Cantidad</th>
      									<th scope="col">Precio</th>
     									<th scope="col">Forma de pago</th>
     									<th scope="col">Fecha</th>
    								</tr>
  								</thead>
  								<tbody>
  									<%for (int i = 0; i < userHistory.size(); i++) {%>
    									<tr>
      										<td><img src= "<%=userHistory.get(i).getProd().getImg()%>" style = "width: 50px; weight: 50px"></td>
      										<th><%=userHistory.get(i).getProd().getName()%></th>
      										<td><%=userHistory.get(i).getCantidad()%></td>
      										<td>$<%=userHistory.get(i).getPrecio()%></td>
      										<td><%=userHistory.get(i).getFormaPago()%></td>
      						
      										<% LocalDate date = userHistory.get(i).getFecha().toLocalDate(); 
      									   	   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
      									   	   String formattedDate = date.format(formatter); %>
      						
      										<td><%=formattedDate%></td>
    									</tr>
    								<% } %>
  								</tbody>
							</table>
							<%} else {%>
								<p align = "center">
									<br>
									<font face = "tahoma" size = "5"><b>No hay historial de compras</b></font>
									<br><br>
								</p>
							<%}%>
					</div>
			</div>
			
			<div class ="text-center">
				<a href = "controlUsers.jsp"><button class="btn btn-primary margintop3" style = "width:230px">Volver</button></a>
			</div>
	   <%} else {
		    CtrlShoppingHistory csh = new CtrlShoppingHistory();
		   
		    LinkedList<ShoppingHistory> shList = csh.getAll(); %>
		    
	   		<div class="container">
				<div class="content-center topmargin-lg">
					<% if (!shList.isEmpty()) {%>
							<h3 class ="text-center pt-3 pb-3 h1"><b>Historial de compras</b></h3>
							<table class="table table-striped">
  								<thead>
    								<tr>
      									<th scope="col">Foto</th>
      									<th scope="col">Categoría</th>
      									<th scope="col">Producto</th>
      									<th scope="col">Cantidad</th>
      									<th scope="col">Precio final</th>
     									<th scope="col">Forma de pago</th>
     									<th scope="col">Usuario</th>
     									<th scope="col">Fecha</th>
    								</tr>
  								</thead>
  								<tbody>
  									<%for (int i = 0; i < shList.size(); i++) {%>
    									<tr>
      										<td><img src= "<%=shList.get(i).getProd().getImg()%>" style = "width: 50px; weight: 50px"></td>
      										<td><%=shList.get(i).getProd().getType().getName()%></td>
      										<th><%=shList.get(i).getProd().getName()%></th>
      										<td><%=shList.get(i).getCantidad()%></td>
      										<td>$<%=shList.get(i).getPrecio()%></td>
      										<td><%=shList.get(i).getFormaPago()%></td>
      										<td><%=shList.get(i).getU().getUsername()%></td>
      						
      										<% LocalDate date = shList.get(i).getFecha().toLocalDate(); 
      									   	   DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
      									   	   String formattedDate = date.format(formatter); %>
      						
      										<td><%=formattedDate%></td>
    									</tr>
    								<% } %>
  								</tbody>
							</table>
							<%} else {%>
								<p align = "center">
									<br>
									<font face = "tahoma" size = "5"><b>No hay historial de compras</b></font>
									<br><br>
								</p>
							<%}%>
					</div>
			</div>
			
			<div class ="text-center">
				<a href = "indexAdmin.jsp"><button class="btn btn-primary margintop3" style = "width:230px">Volver</button></a>
			</div>
	   <%}%>
	   
	<br>
</body>
</html>