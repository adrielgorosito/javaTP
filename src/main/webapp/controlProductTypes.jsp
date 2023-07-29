<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Tipos de productos</title>
		
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
	
	<!-- Para el modal -->
	<script>
		$(function(){
    		$('#editModal').on('show.bs.modal', function (event) {
        		var button = $(event.relatedTarget);
        		var productType = button.data('id');
        		var modal = $(this);
        		modal.find('.modal-body input').val(productType);
    		});
		});
		
		$(function(){
    		$('#deleteModal').on('show.bs.modal', function (event) {
        		var button = $(event.relatedTarget);
        		var product = button.data('id');
        		var modal = $(this);
        		modal.find('.modal-title').text(product);
        		modal.find('.modal-body input').val(product);
        		modal.find('.modal-body label').html(product);
    		});
		});
		
		$(function(){
    		$('#updateModal').on('show.bs.modal', function (event) {
        		var button = $(event.relatedTarget);
        		var product = button.data('id');
        		var modal = $(this);
        		modal.find('.modal-body input').val(product);
        		modal.find('.modal-body label').html(product);
    		});
		});
		
		$(function(){
    		$('#errorModal').on('show.bs.modal', function (event) {
        		var button = $(event.relatedTarget);
        		var product = button.data('id');
        		var modal = $(this);
        		modal.find('.modal-title').text(product);
        		modal.find('.modal-body input').val(product);
        		modal.find('.modal-body label').html(product);
    		});
		});

	</script>
	
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
	
	<%@ page language = "java" import = "logic.CtrlProductType" %>
	<%@ page language = "java" import = "java.util.LinkedList" %>
	<% CtrlProductType cpt = new CtrlProductType();
	   LinkedList<ProductType> allTypes = cpt.getAllProductTypes(); %>
	
	
	<h3 class ="text-center pt-5 pb-2 h1"><b>Nuevo tipo de producto</b></h3>
	<div class="container w-25">
		<div class="content-center topmargin-lg">
			<form action = "NewProductType" method = "post">
				<div class="row justify-content-md-center py-1">
					<div class="input-group mb-3 align-items-center">
  						<label for="nameInput" style ="height:20px">Nombre:&ensp;</label>
  						<input id = "nameInput" name = "nameInput" type="text" class="form-control" required>
					</div>
						
					<input type = "submit" class="btn btn-primary" value = "Añadir tipo" style = "top-margin:5px; width:330px">
				</div>
			</form>
		</div>
	</div>
	
	<div class="container">
		<div class="content-center topmargin-lg">
			<h3 class ="text-center pt-5 pb-5 h1"><b>Listado de tipos de productos</b></h3>
			<% if (!allTypes.isEmpty()) {%>
			<table class="table table-striped">
  				<thead>
    				<tr>
      					<th scope="col">ID</th>
      					<th scope="col">Tipo de producto</th>
      					<th scope="col">Estado</th>
     					<th scope="col">Acción</th>
    				</tr>
  				</thead>
  				<tbody>
  					<%for (int i = 0; i < allTypes.size(); i++) {%>
  						<tr>
      						<th scope="row"><%=allTypes.get(i).getId()%></th>
      						<td><%=allTypes.get(i).getName()%></td>
      						<td>
      							<%if (allTypes.get(i).isActive()) {%>
      								<img src= "imgs/indexAdmin/enabled.png" style = "width: 20px; weight: 20px">
      							<%} else {%>
      								<img src= "imgs/indexAdmin/disabled.png" style = "width: 20px; weight: 20px">
      							<%}%>
      						</td>
      						<td align = "center">
      							<a href="#" data-toggle="modal" data-target="#editModal" data-id="<%=allTypes.get(i).getName()%>">
      								<img src= "imgs/indexAdmin/edit.png" style = "width: 20px; weight: 20px">
      							</a>
      							
      							<%@ page language = "java" import = "logic.CtrlProduct" %>
      							<%if (allTypes.get(i).isActive() == true) {
      							   		CtrlProduct cp = new CtrlProduct();
      							   		LinkedList<Product> listProds = new LinkedList<>();
      							   		listProds = cp.getProductsByType(allTypes.get(i).getId());
      							   		
      							   		int cont = 0;
 								  		
								  		for (Product prod : listProds) {
								      		if (prod.isActive()) {
								    	  		cont++;
								      		}
								 		}
      							   		
      									if (listProds == null || cont == 0) { %>
      										<a href="#" data-toggle="modal" data-target="#deleteModal" data-id="<%=allTypes.get(i).getName()%>">
      											<img src= "imgs/indexAdmin/disable2.png" style = "width: 20px; weight: 20px">
      										</a>
      								 <% } else { %>
      							   			<a href="#" data-toggle="modal" data-target="#errorModal" data-id="<%=allTypes.get(i).getName()%>">
      											<img src= "imgs/indexAdmin/disable2.png" style = "width: 20px; weight: 20px">
      										</a>
      								<% } %>
      							<%} else { %>
      								<a href="#" data-toggle="modal" data-target="#updateModal" data-id="<%=allTypes.get(i).getId()%>">
                   						<img src="imgs/indexAdmin/setActive2.png" style="width: 20px; height: 20px;">
               						</a>
      							<%}%>
      							
      						</td>
    					</tr>
    				<%}%>
  				</tbody>
			</table>
			<%} else {%>
				<p>No hay tipos de productos</p>
			<%}%>
		</div>
	</div>
	
	<!-- Edit Modal -->
	<form action = "EditProductType" method = "post">
    	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
        		<div class="modal-content">
            		<div class="modal-header">
            			<h4 class="modal-title" id="editModalLabel">Modificar nombre</h4>
                		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		</div>
           			<div class="modal-body">
                    	<div class="form-group">
                        	Ingrese el nuevo nombre: <input name="newProdName">
                    	</div>
                    	<input type = "hidden" name="oldProdName">
            		</div>
            		
            		<div class="modal-footer">
                		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                		<input type = "submit" class="btn btn-primary" value = "Confirmar">
            		</div>
        		</div>
    		</div>
		</div>
	</form>
	
	<!-- Delete Modal -->
	<form action = "DisableProductType" method = "post">
    	<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
        		<div class="modal-content">
            		<div class="modal-header">
            			<h4 class="modal-title" id="deleteModalLabel">Titulo</h4>
                		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		</div>
           			<div class="modal-body">
                    	<div class="form-group">
                        	Estás a punto de dar de baja: <label></label>
                        	<input type = "hidden" name="typeName">
                        	<br>
                        	<p>Estás seguro?</p>
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
	
	<!-- Active Modal -->
	<form action = "EnableProductType" method = "post">
    	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
    		<div class="modal-dialog">
        		<div class="modal-content">
            		<div class="modal-header">
            			<h4 class="modal-title" id="updateModalLabel">Dar de alta</h4>
                		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            		</div>
           			<div class="modal-body">
                    	<div class="form-group">
                        	Estás a punto de dar de alta la categoría con id: <b><label></label></b>
                        	<input type = "hidden" name="typeId">
                        	<br>
                        	<p>Estás seguro?</p>
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
	
	<!-- Error Modal -->
    <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
    	<div class="modal-dialog">
        	<div class="modal-content">
            	<div class="modal-header">
            		<h4 class="modal-title" id="errorModalLabel">Error</h4>
                	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            	</div>
           		<div class="modal-body">
                    <div class="form-group">
                        No puedes dar de baja la categoría "<label></label>" porque posee productos activos.
                    </div>
            	</div>
            		
            	<div class="modal-footer">
                	<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
            	</div>
        	</div>
    	</div>
	</div>
	
	<div class ="text-center">
		<a href = "indexAdmin.jsp"><button class="btn btn-primary margintop3" style = "width:230px">Volver</button></a>
	</div>
	
	<br>
	
</body>
</html>