<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Comprar producto</title>
		
	<%@ page language = "java" import = "javax.*" %>
	<%@ page language = "java" import = "java.io.*" %>
	<%@ page language = "java" import = "entities.*" %>
	
	<%
	HttpSession session1 = request.getSession();
	User userS = (User) session1.getAttribute("userSession");

	if (userS == null) {
		request.setAttribute("errorType", 2);
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
			<a class="navbar-brand" href = "indexUser.jsp">
				<img src="imgs/index/logo.png" alt="" width="200">
			</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toogle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="indexUser.jsp">Inicio</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown">
    					<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><img src = "imgs/index/user.png" alt="" width="60"><%=userS.getName()%> </a>
   						<div class="dropdown-menu dropdown-menu-right">
      						<a class="dropdown-item" href="myProfile.jsp">Mi perfil</a>
            	    		<a class="dropdown-item" href="#">Mis compras</a>
            	    		<a class="dropdown-item" href="help.jsp">Ayuda</a>
            	    		<div class="dropdown-divider"></div>
            	    		<a class="dropdown-item" href = "<%= request.getContextPath()%>/CloseSession">Cerrar Sesión</a>
            	    	</div>
            		</li>
				</ul>
			</div>		
		</div>
	</nav>
	
	<%Product p = (Product) request.getAttribute("prod");%>
	<%int cant = (int) request.getAttribute("cant");%>

	
	<section id="producto">
		<div class="container mt-5">
			<form action = "FinishBuy" method = "post">
				<input type="hidden" name="id_prod" value=<%=p.getId_prod()%>>
				<input type="hidden" name="quantityInput" value=<%=cant%>>
				<div class="card mb-3">
					<div class="row g-0">
						<div class="col-md-4">
							<img src="<%=p.getImg()%>" class="img-fluid rounded-start" alt="...">
   						</div>
    					<div class="col-md-8">
    						<div class="card-body">
    							<h4 class="card-title"><b><%=p.getName()%></b></h4>
    							<p class="card-text">Precio unitario: $<%=p.getPrice()%></p>
        						<p class="card-text">Cantidad: <%=cant%></p>
        						<hr class="ml-auto">
        						<h5 class="card-text">Subtotal: $<%=cant * p.getPrice()%></h5>
        						<br><br>
        						<table class="table">
        							<thead>
        								<tr>
        									<th scope="col">Datos del envío</th>
        									<th scope="col">Método de pago</th>
        								</tr>
        							</thead>
        							<tbody>
        								<tr>
        									<td>
        										<p>Dirección: <%=userS.getState()%>, <%=userS.getCity()%>, <%=userS.getAddress()%></p>
        										<p>Costo de envío: $600</p>
        									</td>
        									<td>
        										<div class="form-check">
        											<input class="form-check-input" type="radio" name="metodoPago" id="radio1" value="Pagofacil" checked>
   													<label class="form-check-label" for="radio1">Pago fácil</label>
        										</div>
        										<div class="form-check">
        											<input class="form-check-input" type="radio" name="metodoPago" id="radio2" value="Rapipago">
     												<label class="form-check-label" for="radio2">Rapipago</label>
        										</div>
											</td>
        								</tr>
        							</tbody>
        						</table>
        						
        						<div class="d-flex bd-highlight mb-3">
        							<div class="ms-auto p-2 bd-highlight">
        								<h5 class="card-text"><b>Total: $<%=cant * p.getPrice() + 600%></b></h5>
        							</div>
        						</div>
        						
        						
        						<div class="d-flex bd-highlight mb-3">
        							<div class="ms-auto p-2 bd-highlight">
        								<a	class="btn btn-outline-primary"	href="indexUser.jsp" role="button">Cancelar</a>
        								<input type = "submit" class="btn btn-primary" value = "Comprar" style = "top-margin:5px; width:330px">
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