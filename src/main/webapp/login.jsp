<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="ISO-8859-1">
	<meta name = "viewport" content = "width=device-width, initial-scale=1">
	<title>Inicio de sesión</title>
	
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
					<li class="nav-item"><a class="nav-link" href="index.jsp">Inicio</a></li>
					&emsp;&emsp;&emsp;&emsp;
					<li class="nav-item"><a class="nav-link" href="index.jsp#productos">Productos</a></li>
					&emsp;&emsp;&emsp;&emsp;
					<li class="nav-item"><a class="nav-link" href="index.jsp#contacto">Contacto</a></li> 
					&emsp;&emsp;&emsp;&emsp;
				</ul>
			</div>		
		</div>
	</nav>
	
	<section>
		<div class="container">
			<div class="content-center topmargin-lg">
				<h2 class ="text-center pb-5 pt-5 h1"><b>Iniciar sesión</b></h2>
				<form action = "Login" class="form-inline" method = "post">
					<div class = "form-group mx-sm-3">
						<label for="inputName" class="sr-only">Nombre de usuario, mail o dni</label>
						<input type="text" name = "userInput" class="form-control" id="inputName" placeholder="Nombre de usuario, mail o dni" style = "width: 350px; margin-left:390px; margin-top:10px;">
					</div>
					<div class = "form-group mx-sm-3">
						<label for="inputLName"	class="sr-only">Contraseña</label>
						<input type="password" name = "userPass" class="form-control" id="inputPass" placeholder="Contraseña" style = "width : 350px; margin-left:390px; margin-top:10px;">
					</div>
					<input type = "submit" class="btn btn-primary margintop3" style="margin-left:530px; margin-top:10px" value = "Iniciar sesión">
				</form>
			</div>
			<br>
			<br>
			<a href = "passwordRecovery.jsp" style = "margin-left:490px; margin-top:40px">¿Olvidaste tu contraseña?</a>
			<br>
			<a href = "registro.jsp" style = "margin-left:460px; margin-top:10px">¿No tienes cuenta? Regístrate...</a>
		</div>
	</section>
	
</body>
</html>