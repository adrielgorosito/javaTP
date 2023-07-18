<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Productos</title>
		
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
	
	
	<%@ page language = "java" import = "logic.CtrlProduct" %>
	<%@ page language = "java" import = "logic.CtrlProductType" %>
	<%@ page language = "java" import = "entities.Product" %>
	<%@ page language = "java" import = "java.util.LinkedList" %>
	<% CtrlProduct cp = new CtrlProduct();
	   Product p = new Product();
	   
	   LinkedList<Product> allProducts = cp.getAllProducts();%>
	
	<div class="container">
		<h3 class ="text-center pt-3 pb-3 h1"><b>Añadir un producto</b></h3>
		<form action = "NewProduct" method = "post" enctype="multipart/form-data">
			<div class="card mb-3">
				<div class="row g-0">
					<div class="col-md-4">
						<div class="card-body">
							<h3 class ="text-center pt-5 pb-5 h5"><b>Vista previa</b></h3>
							<img id="fotoCargada"  style = "width: 300px; weight: 300px">
						</div>
   					</div>
    				<div class="col-md-8">
    					<div class="card-body">
    						<div class="input-group mb-3 align-items-center">
  								<label for="nameInput" style ="height:20px">Nombre:&ensp;</label>
  								<input id = "nameInput" name = "nameInput" type="text" class="form-control" required>
							</div>
    							
    						<div class="input-group mb-3 align-items-center">
  								<%CtrlProductType cpt = new CtrlProductType(); 
  								  LinkedList<ProductType> listpt = new LinkedList<ProductType>();
  								  listpt = cpt.getActiveProductTypes();
  								%>
  								
  								<label for="catInput" style ="height:20px">Categoría:&ensp;</label>
  								
  								<select id = "catInput" name ="catInput" class="form-select">
   									<option selected>Seleccione una categoría activa</option>
  									<%for (int i = 0; i < listpt.size(); i++) {%>
   										<option value = "<%=listpt.get(i).getName()%>"><%=listpt.get(i).getName()%></option>
   									<%}%>
   								</select>
							</div>
							
							<div class="input-group mb-3 align-items-center">
  								<label for="photoInput" style ="height:20px">Foto:&ensp;</label>
  								
  								<input id = "photoInput" name = "photoInput" type="file" class="form-control" accept="image/png, image/jpeg" onchange="cargaFoto(event)">
								<script>
									var cargaFoto = function(event) {
										var mostrarFoto = document.getElementById('fotoCargada');
										mostrarFoto.src = URL.createObjectURL(event.target.files[0]);
										mostrarFoto.onload = function() {
											URL.revokeObjectURL(mostrarFoto.src) // Para liberar la memoria
										}
									};
								</script>
							</div>
							
    						<div class="input-group mb-3 align-items-center">
  								<label for="descInput" style ="height:20px">Descripción:&ensp;</label>
  								<input id = "descInput" name = "descInput" type="text" class="form-control" required>
							</div>
							<div class="input-group mb-3 align-items-center">
  								<label for="priceInput" style ="height:20px">Precio:&ensp;</label>
  								<input id = "priceInput" name = "priceInput" type="text" class="form-control" required>
							</div>
							<div class="input-group mb-3 align-items-center">
  								<label for="stockInput" style ="height:20px">Stock:&ensp;</label>
  								<input id = "stockInput" name = "stockInput" type="text" class="form-control" required>
							</div>
        					
        					<div class="d-flex bd-highlight mb-3">
        						<div class="ms-auto bd-highlight">
        							<input type = "submit" class="btn btn-primary" value = "Crear producto" style = "width:330px">
       							</div>
       						</div>
       						
     					</div>
   					</div>
  				</div>
			</div>
		</form>
	</div>
	
	
	<div class="container">
		<div class="content-center topmargin-lg">
			<h3 class ="text-center pt-3 pb-5 h1"><b>Listado de productos</b></h3>
			<% if (!allProducts.isEmpty()) {%>
			<table class="table table-striped">
  				<thead>
    				<tr>
      					<th scope="col">Id</th>
      					<th scope="col">Foto</th>
      					<th scope="col">Nombre</th>
      					<th scope="col">Descripción</th>
     					<th scope="col">Stock</th>
     					<th scope="col">Precio</th>
     					<th scope="col">Estado</th>
     					<th scope="col">Acción</th>
    				</tr>
  				</thead>
  				<tbody>
  					<%for (int i = 0; i < allProducts.size(); i++) {%>
    					<tr>
      						<th scope="row"><%=allProducts.get(i).getId_prod()%></th>
      						<td><img src= "<%=allProducts.get(i).getImg()%>" style = "width: 50px; weight: 50px"></td>
      						<td><%=allProducts.get(i).getName()%></td>
      						<td><%=allProducts.get(i).getDescription()%></td>
      						<td><%=allProducts.get(i).getStock()%></td>
      						<td>$<%=allProducts.get(i).getPrice()%></td>
      						<td>
      							<%if (allProducts.get(i).isActive()) {%>
      								<img src = "imgs/indexAdmin/enabled.png" style = "width: 20px; weight: 20px">
      							<%} else {%>
      								<img src = "imgs/indexAdmin/disabled.png" style = "width: 20px; weight: 20px">
      							<%}%>
      						</td>
      						<td align = "center">
      							<form action = "EditProduct" method = "post">
      								<input type="hidden" name="id_prod" value=<%=allProducts.get(i).getId_prod()%>>
      								<input type = "image" src = "imgs/indexAdmin/edit.png" style = "width: 20px; weight: 20px">
      							</form>
      							<%if (allProducts.get(i).isActive()) {%>
      								<a href="#" data-toggle="modal" data-target="#deleteModal" data-id="<%=allProducts.get(i).getName()%>">
      									<img src= "imgs/indexAdmin/disable.png" style = "width: 20px; weight: 20px">
      								</a>
      							<%} else {%>
      								<a href="#" data-toggle="modal" data-target="#updateModal" data-id="<%=allProducts.get(i).getName()%>">
      									<img src= "imgs/indexAdmin/setActive.png" style = "width: 20px; weight: 20px">
      								</a>
      							<%}%>
      							
      						</td>
    					</tr>
    				<%} %>
  				</tbody>
			</table>
			<%} else {%>
			<p>No hay productos</p>
			<%}%>
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
                        	Estás a punto de dar de baja: <label></label>
                        	<input type = "hidden" name="prodName">
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
                        	Estás a punto de dar de alta: <label></label>
                        	<input type = "hidden" name="prodName">
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
	
</body>
</html>