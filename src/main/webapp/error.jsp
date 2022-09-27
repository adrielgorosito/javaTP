<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Error</title>
	
	<!-- Bootstrap -->
	<!-- ? -->  <link href = "https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300&display=swap" rel = "stylesheet">
	<!-- b5 --> <link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel = "stylesheet" integrity = "sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin = "anonymous">
	<!-- b5 --> <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity = "sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin = "anonymous"></script>
	<!-- b5 --> <script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integriy = "sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin = "anonymous"></script>
	<!-- b4 --> <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity = "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin = "anonymous">

	<!-- CSS -->
	<link href = "style/indexStyle.css" rel = "stylesheet">
	<link href = "css/bootstrap.min.css" rel = "stylesheet">
	
</head>

<body>

	<% int error = (int) request.getAttribute("errorType");
	   String msg = "";
	   String indexBack = "index.jsp";
	   
	   switch (error) {
	   		case 1:
	   			msg = "Usuario y/o contraseña erróneos.";
	   			break;
	   			
	   		case 2:
	   			msg = "Sesión expirada.";
	   			break;
	   			
	   		case 3:
	   			msg = "La contraseña debe tener como mínimo 8 caracteres.";	
	   			break;
	   			
	   		case 4:
	   			msg = "Las contraseñas ingresadas no coinciden.";
	   			break;
	   			
	   		case 5:
	   			msg = "Ya existe una cuenta con el dni ingresado. <br><br><a href = \"olvideContraseña\">¿Olvidaste tu contraseña?</a>";
	   			break;
	   			
	   		case 6:
	   			msg = "Ya existe una cuenta con el nombre de usuario ingresado. <br><br><a href = \"olvideContraseña\">¿Olvidaste tu contraseña?</a>";
	   			break;
	   			
	   		case 7:
	   			msg = "Ya existe una cuenta con el mail ingresado. <br><br><a href = \"olvideContraseña\">¿Olvidaste tu contraseña?</a>";
	   			break;
	   			
	   		case 8:
	   			msg = "El usuario no puede contener caracteres especiales";
	   			break;
	   			
	   		case 9:
	   			msg = "No hay ninguna cuenta asociada al correo electrónico asociado";
	   			break;
	   			
	   		case 10:
	   			msg = "La contraseña ingresada no coincide.";
	   			break;
	   			
	   		case 11:
	   			msg = "El código ingresado no es correcto.";
	   			break;

	   		// Acordarse de esto
	   		// Acordarse de esto
	   		// Acordarse de esto
	   		// Acordarse de esto
	   		// Acordarse de esto
	   		case 12:
	   			msg = "Producto no encontrado";
	 		    // volver = "PaginaTodaviaNoHecha.jsp";
	 		    indexBack = "indexUser.jsp";
	   			break;
	   }
	%>
	
	<nav class="navbar navbar-expand-sm navbar-light sticky-top" id="nave">
		<div class="container-fluid">
			<a class="navbar-brand" href = "index.jsp">
				<img src="imgs/index/logo.png" alt="" width="200">
			</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toogle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					
					<li class="nav-item"><a class="nav-link" href="<%=indexBack%>">Inicio</a></li>
				</ul>
			</div>		
		</div>
	</nav>

	<h3 class="text-center pt-5 h1"><font color = "red"><b>Error</b></font></h3>
	<%if (error == 2) {%>
		<p align = "center">
			<br>
			<font face = "tahoma" size = "5"><%=msg%></font>
			<br><br>
			<a class="btn btn-primary" href="index.jsp" role="button">Regresar</a>
		</p>
	<%} else {%>
		<p align = "center">
			<br>
			<font face = "tahoma" size = "5"><%=msg%></font>
			<br><br>
			<a class="btn btn-primary topmargin-sm" href = "index.jsp" role="button" type="button" onclick="history.back()">Regresar</a>
		</p>
	<%}%>
</body>