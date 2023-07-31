<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="ISO-8859-1">
	<title>BG Electronics</title>
	
	<!-- Bootstrap -->
	<meta name = "viewport" content = "width=device-width, initial-scale=1">
	<link href = "https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300&display=swap" rel = "stylesheet">
	<link href = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel = "stylesheet" integrity = "sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin = "anonymous">
	<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity = "sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin = "anonymous"></script>
	<link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity = "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin = "anonymous">
	<script src = "https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integriy = "sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin = "anonymous"></script>
	
	<!-- CSS -->
	<link href = "style/estilos.css" rel = "stylesheet">
	<link href = "css/bootstrap.min.css" rel = "stylesheet">
	
</head>

<body>

	<nav class="navbar navbar-expand-sm navbar-light sticky-top" id="nave">
		<div class="container-fluid">
			<a class="navbar-brand" href = "index.jsp">
				<img src="imgs/index/logo.png" alt="" width="200">
			</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toogle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent" >
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp#">Inicio</a></li>
					&emsp;&emsp;&emsp;&emsp;
					<li class="nav-item"><a class="nav-link" href="index.jsp#productos">Productos</a></li>
					&emsp;&emsp;&emsp;&emsp;
					<li class="nav-item"><a class="nav-link" href="index.jsp#contacto">Contacto</a></li> 
					</ul>
				<ul class="navbar-nav ml-auto">
					<li><span title = "Registro"><a href = "registro.jsp"><img src = "imgs/user.png" alt="" width="60"></a></span></li>
				</ul>
			</div>		
		</div>
	</nav>
	
	<div id="ribbon">
		<div class="row align-items-center content-center topmargin-sm">
			<div class="col-sm p-1">
			 	 <img alt="" src="" >
			</div>
		</div>		 
	</div>
	
	<%  if (request.getAttribute("mailSent") != null) {
			String mailSent = (String) request.getAttribute("mailSent");
	    %>
		<section>
			<div class="container">
				<div class="content-center topmargin-lg">
					<h3 class ="text-center pt-5 h3"><b>Contraseña enviada</b></h3>
					<br>
					<p class ="text-center">
						Hemos envíado un email al correo: <i><b><%=mailSent%></b></i>.
					</p>
					<p class ="text-center">
						Asegúrate de revisar la bandeja de correo no deseado (Spam).
					</p>
					<p class ="text-center">
						En caso de que no encuentres el mensaje en ninguna parte, ponte en contacto con nosotros <a href = "index.jsp#contacto">clickeando aquí</a>.
					</p>
				</div>
				<br>
				<form action = "index.jsp">
					<div style = "text-align: center">
	  					<button	type="submit" class="btn btn-primary margintop3" style = "margin: 0 auto;">Ir al inicio</button>
					</div>
				</form>
			</div>
		</section>
	<% } else if (request.getAttribute("contactSent") != null) { 
		String contactSent = (String) request.getAttribute("contactSent"); %>
		<section>
			<div class="container">
				<div class="content-center topmargin-lg">
					<h3 class ="text-center pt-5 h3"><b>Mail recibido</b></h3>
					<br>
					<p class ="text-center">
						Hemos recibido un correo de tu parte (<i><b><%=contactSent%></b></i>).
					</p>
					<p class ="text-center">
						Nos pondremos en contacto a la brevedad!
					</p>
				</div>
				<br>
				<form action = "index.jsp">
					<div style = "text-align: center">
	  					<button	type="submit" class="btn btn-primary margintop3" style = "margin: 0 auto;">Ir al inicio</button>
					</div>
				</form>
			</div>
		</section>
	<% } %>
</body>

</html>