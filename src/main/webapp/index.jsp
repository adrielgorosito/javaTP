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
	<link href = "style/indexStyle.css" rel = "stylesheet">
	<link href = "css/bootstrap.min.css" rel = "stylesheet">
	
</head>

<body>

	<!-- Header/Barra de navegación/Navbar -->
	<nav class="navbar navbar-expand-sm navbar-light sticky-top" id="nave">
		<div class="container-fluid">
			<a class="navbar-brand" href = "index.jsp">
				<img src="imgs/logo.png" alt="" width="200">
			</a>
			
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toogle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarSupportedContent" >
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="#">Inicio</a></li>
					&emsp;&emsp;&emsp;&emsp; <!-- Dudosos estos espacios en blanco -->
					<li class="nav-item"><a class="nav-link" href="#productos">Productos</a></li>
					&emsp;&emsp;&emsp;&emsp;
					<li class="nav-item"><a class="nav-link" href="#contacto">Contacto</a></li> 
					</ul>
				<ul class="navbar-nav ml-auto">
					<li><span title = "Registro"><a href = "registro.jsp"><img src = "imgs/user.png" alt="" width="60"></a></span></li>
				</ul>
			</div>		
		</div>
	</nav>
	
	<!-- Separador -->
	<div id="ribbon">
		<div class="row align-items-center content-center topmargin-sm">
			<div class="col-sm p-1">
			 	 <img alt="" src="" >
			</div>
		</div>		 
	</div>
	
	<!-- Inicio -->
	<section id = "inicio">
		<div class="container-fluit">
			<div class="content-center topmargin-sm botmargin-no item" id="text1">
				<h1><b>¡Bienvenido!</b></h1>
				<h3><b>Te estábamos esperando.</b></h3>
				<br>
				<p><b> Lorem Ipsum is simply dummy<br>
				 text of the printing and typesetting industry.<br>
				Lorem Ipsum has been the industry's standard<br>
				dummy text ever since the 1500s, when an unknown printer 
				took a galley of type and scrambled it to make a type specimen book.<br>
				 It has survived not only five centuries, but also the leap <br>
				nto electronic typesetting, remaining essentially unchanged.<br>
				 It was popularised in the 1960s with the release of Letraset <br>
				sheets containing Lorem Ipsum passages, and more recently<br>
				with desktop publishing software like Aldus PageMaker including<br>
				 versions of Lorem Ipsum.</b></p>
				 <!-- Dudoso este manejo con <br> -->
			</div>
		</div>
		<div class="img-border">
			<img alt="" src="imgs\logo.png" style="width:1020px;height:530px;margin-left:0px;padding-right:200px"> </a>
		</div>	
	</section>
	
	
	
	
	<%@ page language = "java" import = "java.lang.Math"%>
	
	<%
		int nroRandom = (int) Math.floor(Math.random()*10+1);
		
		
	%>
	<%= nroRandom %>
	<!-- Tarjetas de productos -->
	<section id="productos">
 		<div id="games" class="botpad-1">
			<div class="container-md p-5">
				<div class="row pt-5">
					<h3 class="text-center pb-5 pt-5 h1" style="color:#ffffff">Algunos de nuestros productos</h3>
				</div>
				<div class="row">
					<div class="col-sm">
						<div class="card w-100 card-border mb-5">
  							<img src="imgs\LOGO2.jpg" class="card-img-top" alt="...">
  							<div class="card-body">
   								<h5 class="card-title">Card title</h5>
   								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
 							 </div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card w-100 card-border mb-5">
  							<img src="imgs\LOGO2.jpg" class="card-img-top" alt="...">
  							<div class="card-body">
   								<h5 class="card-title">Card title</h5>
   								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
 							 </div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card w-100 card-border mb-5">
  							<img src="imgs\LOGO2.jpg" class="card-img-top" alt="...">
  							<div class="card-body">
   								 <h5 class="card-title">Card title</h5>
   								 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
 							 </div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm">
						<div class="card w-100 card-border mb-5">
  							<img src="imgs\LOGO2.jpg" class="card-img-top" alt="...">
  							<div class="card-body">
   								<h5 class="card-title">Card title</h5>
   								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
 							 </div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card w-100 card-border mb-5">
  							<img src="imgs\LOGO2.jpg" class="card-img-top" alt="...">
  							<div class="card-body">
   								<h5 class="card-title">Card title</h5>
   								<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
 							 </div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card w-100 card-border mb-5">
  							<img src="imgs\LOGO2.jpg" class="card-img-top" alt="...">
  							<div class="card-body">
   								 <h5 class="card-title">Card title</h5>
   								 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
 							 </div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--  Hacer un "Para ver más, inicia sesión" y un botón -->
	</section>
	
	
	<!-- Separador -->
	<div id="separator-2">
		<div class="content" style="background:#f5f5f5;margin-bottom:-4%;">
		</div>
	</div>
	
	
	

	<!-- Contacto -->
	<section id="contacto">
		<div id="cont" class="p-5" style="padding-top:110px">
			<div class="container w-50 pt-5" style="margin-top:-6%">
				<div class="col text-center">
					<br>
					<h1><b>Contacto</b></h1>
				</div>
				<div class="row justify-content-md-center py-5">
					<div class="col text-center font-weight-light">
						<h4>Teléfono</h4>
						<p>03492-319041</p>
					</div>
					<div class="col text-center font-weight-light">
						<h4>Gmail</h4>
						<p>bgelectronics@gmail.com</p>
					</div>
					<div class="col text-center font-weight-light">
						<h4>Redes sociales</h4>
						
						<div id="block_container">
							<div id="bloc1">
								<div class="img-border">
									<a href="http://www.facebook.com"><img alt="" src="imgs/logosRedes/facebookLogo.png" height=40px width=40px> </a>
								</div>
							</div>
    						<div id="bloc2">
    							<div class="img-border">
									<a href="http://www.instagram.com"><img alt="" src="imgs/logosRedes/instagramLogo.png" height=40px width=40px> </a>
								</div>
    						</div>
    						<div id="bloc3">
    							<div class="img-border">
    								<a href="http://www.linkedin.com"><img alt="" src="imgs/logosRedes/linkedinLogo.png" height=40px width=40px> </a>
    							</div>
							</div>  
    						<div id="bloc4">
    							<div class="img-border">
    								<a href="http://www.whatsapp.com"><img alt="" src="imgs/logosRedes/whatsappLogo.png" height=40px width=40px> </a>
    							</div>
    						</div>
						</div>
					</div>
				</div>
				<div class="row justify-content-md-center py-1">
					<div class="mb-3">
  						<label for="exampleFormControlInput1" class="form-label">Email</label>
  						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="@gmail.com">
					</div>
					<div class="mb-3">
  						<label for="exampleFormControlInput1" class="form-label">Asunto</label>
  						<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="Escriba el asunto...">
 						<label for="exampleFormControlTextarea1" class="form-label">Mensaje</label>
 		 				<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
					</div>
					<a class="btn btn-info topmargin-sm" href="#" role="button" style="top-margin:5px; width:680px;"><b>Enviar</b></a>
				</div>
			</div>
		</div>
	</section>
	
	
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	
	







	<!-- Ejemplo de header/barra de menú -->
	<table border=5 width=100% bgcolor=white>
		<tr>
			<th align = "left" style= "max-width: 11px">
				<img src = "logoejemplo.png">
			</th>
			<th>
				<a href = "index.html">Inicio</a>
			</th>
			<th align = "right">
				<a href = "login.html">Iniciar sesión</a>
			</th>
			<th align = "right">
				<a href = "registro.jsp">Nuevo usuario</a>
			</th>
		</tr>
	</table>
	
	<br>
	
	<!-- Ejemplo de buscador -->
	<fieldset>
		<legend>Buscador</legend>
		<form action = "" method = "post">
  			<label>Nombre:</label>
  			<input type = "text" name = "search">
  			<input type = "submit" value = "Buscar">
		</form>
	</fieldset>
	
	<!-- Ejemplo tooltip -->
	Ejemplo de una <u><span title="Dejas el mouse arriba y muestra sto">prueba de tooltip</span></u> (poner 
	el mouse arriba de "prueba de tooltip").
	
	<!-- En vez de iniciar sesión poner una foto de usuario (prueba) -->
	<!-- Hacer tabla producto_historial para el usuario -->
</body>

</html>