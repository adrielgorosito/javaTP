<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Modificar dirección</title>
			
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
      						<a class="dropdown-item" href="myProfile.jsp">Perfil</a>
            	    		<a class="dropdown-item" href="shoppingHistory.jsp">Mis compras</a>
            	    		<a class="dropdown-item" href="help.jsp">Ayuda</a>
            	    		<div class="dropdown-divider"></div>
            	    		<a class="dropdown-item" href = "<%= request.getContextPath()%>/CloseSession">Cerrar Sesión</a>
            	    	</div>
            		</li>
				</ul>
			</div>		
		</div>
	</nav>
	
	<div class="container w-25 pt-5">
		<form action = "ChangeAddress" method = "post">
			<div class="row justify-content-md-center py-1">
				<h3 class = "text-center pt-3 pb-4 h3"><b>Modificar dirección</b></h3>
				<%if (userS.getCity() != null) {%>
					<div class="input-group mb-3 align-items-center">
  						<label for="stateInput" style ="height:20px">Provincia:&ensp;</label>
  						<select id = "stateInput" name ="stateInput" class="form-select">
   							<option selected><%=userS.getState()%></option>
   							<option value="Buenos Aires">Buenos Aires</option>
   							<option value="Ciudad Autónoma de Buenos Aires">Ciudad Autónoma de Buenos Aires</option>
   							<option value="Catamarca">Catamarca</option>
   							<option value="Chaco">Chaco</option>
   							<option value="Chubut">Chubut</option>
   							<option value="Córdoba">Córdoba</option>
   							<option value="Corrientes">Corrientes</option>
   							<option value="Entre Ríos">Entre Ríos</option>
   							<option value="Formosa">Formosa</option>
   							<option value="Jujuy">Jujuy</option>
   							<option value="La Pampa">La Pampa</option>
   							<option value="Mendoza">Mendoza</option>
   							<option value="Misiones">Misiones</option>
   							<option value="Neuquén">Neuquén</option>
   							<option value="Río Negro">Río Negro</option>
   							<option value="Salta">Salta</option>
   							<option value="San Juan">San Juan</option>
   							<option value="San Luis">San Luis</option>
   							<option value="Santa Cruz">Santa Cruz</option>
   							<option value="Santa Fe">Santa Fe</option>
   							<option value="Santiago del Estero">Santiago del Estero</option>
   							<option value="Tucumán">Tucumán</option>
   						</select>
					</div>
					<div class="input-group mb-3 align-items-center">
  						<label for="cityInput" style ="height:20px">Ciudad:&ensp;</label>
  						<input id = "cityInput" name = "cityInput" type="text" class="form-control" value = "<%=userS.getCity()%>" required>
  						
					</div>
					<div class="input-group mb-3 align-items-center">
  						<label for="addressInput" style ="height:20px">Dirección:&ensp;</label>
  						<input id = "addressInput" name = "addressInput" type="text" class="form-control" value="<%=userS.getAddress()%>" required>
					</div>
				<%} else {%>
					<div class="input-group mb-3 align-items-center">
  						<label for="stateInput" style ="height:20px">Provincia:&ensp;</label>
  						<select id = "stateInput" name ="stateInput" class="form-select">
   							<option selected>Elija una opción...</option>
   							<option value="Buenos Aires">Buenos Aires</option>
   							<option value="Ciudad Autónoma de Buenos Aires">Ciudad Autónoma de Buenos Aires</option>
   							<option value="Catamarca">Catamarca</option>
   							<option value="Chaco">Chaco</option>
   							<option value="Chubut">Chubut</option>
   							<option value="Córdoba">Córdoba</option>
   							<option value="Corrientes">Corrientes</option>
   							<option value="Entre Ríos">Entre Ríos</option>
   							<option value="Formosa">Formosa</option>
   							<option value="Jujuy">Jujuy</option>
   							<option value="La Pampa">La Pampa</option>
   							<option value="Mendoza">Mendoza</option>
   							<option value="Misiones">Misiones</option>
   							<option value="Neuquén">Neuquén</option>
   							<option value="Río Negro">Río Negro</option>
   							<option value="Salta">Salta</option>
   							<option value="San Juan">San Juan</option>
   							<option value="San Luis">San Luis</option>
   							<option value="Santa Cruz">Santa Cruz</option>
   							<option value="Santa Fe">Santa Fe</option>
   							<option value="Santiago del Estero">Santiago del Estero</option>
   							<option value="Tucumán">Tucumán</option>
   						</select>
					</div>
					<div class="input-group mb-3 align-items-center">
  						<label for="cityInput" style ="height:20px">Ciudad:&ensp;</label>
  						<input id = "cityInput" name = "cityInput" type="text" class="form-control" placeholder="Ciudad" required>
					</div>
					<div class="input-group mb-3 align-items-center">
  						<label for="addressInput" style ="height:20px">Dirección:&ensp;</label>
  						<input id = "addressInput" name = "addressInput" type="text" class="form-control" placeholder="Dirección" required>
					</div>
				<%}%>
				<input class="btn btn-primary topmargin-sm" role="button" type="submit" value="Modificar">
				<a class="btn btn-outline-primary topmargin-sm" href="myProfile.jsp" role="button" style="margin-top: 10px; width:120px;">Cancelar</a>
			</div>
		</form>
	</div>

</body>
</html>