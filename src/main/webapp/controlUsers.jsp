<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Usuarios</title>
		
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

</head>
	
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
            	    		<a class="dropdown-item" href = "<%= request.getContextPath()%>/CloseSession">Cerrar Sesi�n</a>
            	    	</div>
            		</li>
				</ul>
			</div>		
		</div>
	</nav>
	
	
	<%@ page language = "java" import = "logic.CtrlUser" %>
	<%@ page language = "java" import = "entities.User" %>
	<%@ page language = "java" import = "java.util.LinkedList" %>
	<% CtrlUser cu = new CtrlUser();
	   User u = new User();
	   
	   LinkedList<User> allUsers = cu.getAllUsers();
	   
	   
	   // Hacer q busque para no admins
	   %>
	   
	
	<div class="container">
		<div class="content-center topmargin-lg">
			<h3 class ="text-center pt-5 pb-5 h1"><b>Listado de usuarios</b></h3>
			<table class="table table-striped">
  				<thead>
    				<tr>
      					<th scope="col">DNI</th>
      					<th scope="col">Apellido y nombre</th>
      					<th scope="col">Username</th>
      					<th scope="col">Email</th>
     					<th scope="col">Tel�fono</th>
     					<th scope="col">Domicilio</th>
     					<th scope="col">Acci�n</th>
    				</tr>
  				</thead>
  				<tbody>
  					<%for (int i = 0; i < allUsers.size(); i++) {%>
  						<%if (allUsers.get(i).isAdmin() == false) {%>
  							<tr>
      							<th scope="row"><%=allUsers.get(i).getDni()%></th>
      							<td><%=allUsers.get(i).getSurname()%>, <%=allUsers.get(i).getName()%></td>
      							<td><%=allUsers.get(i).getUsername()%></td>
      							<td><%=allUsers.get(i).getMail()%></td>
      							<td>
      								<%if (allUsers.get(i).getPhone() == null) {%>
      									-
      								<%} else {%>
      									<%=allUsers.get(i).getPhone()%>
      								<%}%>
      							</td>
      							<td>
      								<%if (allUsers.get(i).getPhone() == null) {%>
      									-
      								<%} else {%>
      									<%=allUsers.get(i).getPhone()%>
      								<%}%>
      							</td>
      							<td>
      								<%if (allUsers.get(i).getAddress() == null) {%>
      									-
      								<%} else {%>
      									<%=allUsers.get(i).getState()%>, <%=allUsers.get(i).getCity()%>, <%=allUsers.get(i).getAddress()%>
      								<%}%>
      							</td>
      							<td align = "center">
      								<form action = "DeleteUser" method = "post">
      									<input type="hidden" name="dni_user" value=<%=allUsers.get(i).getDni()%>>
      									<input type = "image" src = "imgs/indexAdmin/disable.png" style = "width: 20px; weight: 20px">
      								</form>
      							</td>
    						</tr>
    					<%}%>
    				<%} %>
  				</tbody>
			</table>
		</div>
	</div>
	
	
	
	<!-- Delete Modal -->
	<form action = "DisableProduct" method = "post">
    	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
        		<div class="modal-content">
            		<div class="modal-header">
            			<h4 class="modal-title" id="deleteModalLabel">Titulo</h4>
                		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		</div>
           			<div class="modal-body">
                    	<div class="form-group">
                        	Est�s a punto de dar de baja: <label></label>
                        	<input type = "hidden" name="prodName">
                        	<br>
                        	<p>Est�s seguro?</p>
                    	</div>
            		</div>
            		
            		
            		<div class="modal-footer">
                		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                		<input type = "submit" class="btn btn-primary" value = "Confirmar">
            		</div>
        		</div>
    		</div>
		</div>
	</form>
	
	<!-- Update Modal -->
	<form action = "EnableProduct" method = "post">
    	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
        		<div class="modal-content">
            		<div class="modal-header">
            			<h4 class="modal-title" id="updateModalLabel">Titulo</h4>
                		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		</div>
           			<div class="modal-body">
                    	<div class="form-group">
                        	Est�s a punto de dar de alta: <label></label>
                        	<input type = "hidden" name="prodName">
                        	<br>
                        	<p>Est�s seguro?</p>
                    	</div>
            		</div>
            		
            		
            		<div class="modal-footer">
                		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                		<input type = "submit" class="btn btn-primary" value = "Confirmar">
            		</div>
        		</div>
    		</div>
		</div>
	</form>
	
</body>
</html>