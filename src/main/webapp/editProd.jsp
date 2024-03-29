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

	<%@ page language = "java" import = "logic.CtrlProductType" %>
	<%@ page language = "java" import = "java.util.LinkedList" %>
	<%Product p = (Product) request.getAttribute("prod");%>

	<section id = "editProd">
		<div class="container mt-5">
			<form action = "SaveEditProduct" method = "post">
				<div class="card mb-3">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="<%=p.getImg()%>" class="img-fluid rounded-start">
   						</div>
    					<div class="col-md-8">
    						<div class="card-body">
                        		<input type = "hidden" name="id_prod" value = "<%=p.getId_prod()%>">
    							<h5 class="card-title"><b>ID: <%=p.getId_prod()%></b></h5>
    							
    							<div class="input-group mb-3 align-items-center">
  									<%CtrlProductType cpt = new CtrlProductType(); 
  									  LinkedList<ProductType> listpt = new LinkedList<ProductType>();
  									  listpt = cpt.getAllProductTypes();
  									%>
  									
  									<label for="catInput" style ="height:20px">Categor�a:&ensp;</label>
  									
  									<select id = "catInput" name ="catInput" class="form-select">
   										<option selected><%=p.getType().getName()%></option>
   									
   										<%for (int i = 0; i < listpt.size(); i++) {%>
   											<%if (!listpt.get(i).getName().equals(p.getType().getName())) {%>
   												<option value = "<%=listpt.get(i).getName()%>"><%=listpt.get(i).getName()%></option>
   											<%}%>
   										<%}%>
   									
   									</select>
								</div>
								
    							<div class="input-group mb-3 align-items-center">
  									<label for="nameInput" style ="height:20px">Nombre:&ensp;</label>
  									<input id = "nameInput" name = "nameInput" type="text" class="form-control" value="<%=p.getName()%>" required>
								</div>
    							<div class="input-group mb-3 align-items-center">
  									<label for="descInput" style ="height:20px">Descripci�n:&ensp;</label>
  									<input id = "descInput" name = "descInput" type="text" class="form-control" value="<%=p.getDescription()%>" required>
								</div>
								<div class="input-group mb-3 align-items-center">
  									<label for="priceInput" style ="height:20px">Precio:&ensp;</label>
  									<input id = "priceInput" name = "priceInput" type="text" class="form-control" value="<%=p.getPrice()%>" required>
								</div>
								<div class="input-group mb-3 align-items-center">
  									<label for="stockInput" style ="height:20px">Stock:&ensp;</label>
  									<input id = "stockInput" name = "stockInput" type="text" class="form-control" value="<%=p.getStock()%>" required>
								</div>
        						
        						<div class="d-flex bd-highlight mb-3">
        							<div class="ms-auto p-2 bd-highlight">
        								<a	class="btn btn-outline-primary"	href="controlProducts.jsp" role="button">Cancelar</a>
        								<input type = "submit" class="btn btn-primary" value = "Guardar cambios" style = "top-margin:5px; width:330px">
        							</div>
        						</div>
      						</div>
    					</div>
  					</div>
				</div>
			</form>
		</div>
	</section>
	
</body>
</html>