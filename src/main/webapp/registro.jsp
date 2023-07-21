<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registro</title>
    
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
	<!-- Header/Barra de navegación/Navbar -->
	<nav class="navbar navbar-expand-sm navbar-light sticky-top" id="nave">
		<div class="container-fluid">
			<a class="navbar-brand" href = "index.jsp">
				<img src="imgs/index/logo.png" alt="" width="200">
			</a>
			
			<button class="navbar-toggler" 
				type="button"
				data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent"
				aria-expanded="false"
				aria-label="Toogle navigation">
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
					<li class="nav-item"><a	class="btn btn-primary"	href="login.jsp" role="button"><b>Iniciar Sesion</b></a></li>
				</ul>
			</div>		
		</div>
	</nav>
	
	<section>
		<div class="container w-25">
			<div class="content-center topmargin-lg">
				<h2 class ="text-center pb-3 pt-5 h1"><b>Registro</b></h2>
				<h5>Datos Personales</h5>
				<form action = "SignUp" method = "post">
					<div class="row justify-content-md-center py-1">
						<div class="input-group mb-3 align-items-center">
							<label for="inputName" class="sr-only">Nombre</label>
							<input type="text" name = "name" class="form-control" id="inputName" placeholder="Nombre">
						</div>
						<div class="input-group mb-3 align-items-center">
							<label for="inputSurname" class="sr-only">Apellido</label>
							<input type="text" name = "surname" class="form-control" id="inputSurname" placeholder="Apellido">
						</div>
						<div class="input-group mb-3 align-items-center">
							<label for="inputUser" class="sr-only">DNI</label>
							<input type="text" name = "dni" class="form-control" id="inputUser" placeholder="DNI">
						</div>
						<div class="input-group mb-3 align-items-center">
							<label for="inputPhone" class="sr-only">Telefono</label>
							<input type="text" name = "phone" class="form-control" id="inputPhone"	placeholder="Telefono (Opcional)">
						</div>
				
						<h5 style = "margin-top:30px">Datos de la cuenta </h5>
						<div class="input-group mb-3 align-items-center">
							<label for="inputMail" class="sr-only">Email</label>
							<input type="text" name = "mail" class="form-control" id="inputMail" placeholder="Email">
						</div>
						<div class="input-group mb-3 align-items-center">
							<label for="inputUsuario" class="sr-only">Nombre de usuario</label>
							<input type="text" name = "username" class="form-control" id="inputUsuario" placeholder="Nombre de usuario">
						</div>
						<div class="input-group mb-3 align-items-center">
							<label for="inputPass" class="sr-only">Contraseña</label>
							<input type="password" name = "password1" class="form-control" id="inputPass" placeholder="Contraseña">
						</div>
						<div class="input-group mb-3 align-items-center">
							<label for="inputPass" class="sr-only">Repetir contraseña</label>
							<input type="password" name = "password2" class="form-control" id="inputPass" placeholder="Repetir contraseña">
						</div>
						<input type = "submit" class="btn btn-primary margintop3" value = "Registrarse" style = "top-margin:5px; width:330px">
               		</div>
                </form>
			</div>
			<br>
			<a href = "passwordRecovery.jsp">¿Olvidaste tu contraseña?</a>
			<br>
			<a href = "login.jsp">¿Ya tienes una cuenta? Ingresar...</a>
		</div>
	</section>
	
    
</body>
</html>