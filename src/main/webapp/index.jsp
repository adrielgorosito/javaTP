<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<head>
	<meta charset="ISO-8859-1">
	<meta name = "viewport" content = "width=device-width, initial-scale=1">
	<title>BG Electronics</title>
	
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

	<!-- Header/Barra de navegación/Navbar -->
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
					<li class="nav-item"><a class="nav-link" href="#">Inicio</a></li>
					&emsp;&emsp;&emsp;&emsp;
					<li class="nav-item"><a class="nav-link" href="#productos">Productos</a></li>
					&emsp;&emsp;&emsp;&emsp;
					<li class="nav-item"><a class="nav-link" href="#contacto">Contacto</a></li> 
					&emsp;&emsp;&emsp;&emsp;
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a	class="btn btn-primary" href="registro.jsp" role="button"><b>Registrarse</b></a></li> 
					<li class="nav-item"><a	class="btn btn-outline-primary topmargin-sm margenleft-sm"	href="login.jsp" role="button"><b>Iniciar Sesion</b></a></li> 
				</ul>
			</div>		
		</div>
	</nav>

	<!-- Inicio -->
	<section id = "inicio">
		<div class="container-fluit">
			<div class="content-center topmargin-sm botmargin-no item" id="text1">
				<h1><b>¡Bienvenido!</b></h1>
				<h3><b>Te estábamos esperando.</b></h3>
				<br>
				<p>BG Electronics es una tienda online basada exclúsivamente en periféricos gaming.<br><br>
				Aquí encontrarás, todo lo que estás buscando:<br>
				<img src = "imgs/index/check.png"> Monitores.<br>
				<img src = "imgs/index/check.png"> Mouses.<br>
				<img src = "imgs/index/check.png"> Teclados.<br>
				<img src = "imgs/index/check.png"> Y más!<br><br>
				En BG Electronics nos caracterizamos por pensar siempre en el cliente. Por
				eso te ofrecemos:<br>
				<img src = "imgs/index/check.png"> Productos exclusivos de excelente calidad con garantías de 12 meses.<br>
				<img src = "imgs/index/check.png"> Precios baratos, con cualquier forma de pago.<br>
				<img src = "imgs/index/check.png"> Hasta 12 cuotas sin interés.<br>
				<img src = "imgs/index/check.png"> Un servicio al cliente pensado única y exclúsivamente para vos.<br><br>
				No te preocupes más por la incomodidad, con nosotros podrás librar<br>
				tus batallas más legendarias de forma segura y sin ningún tipo<br>
				de inconveniente.<br>
				<h6 align = "right"><i>© BG Electronics 2022</i></h6>
			</div>
		</div>
		<div class="img-border">
			<img alt="" src="imgs/index/intro.jpg" style="width:1200px;height:740px;margin-left:0px;padding-right:100px;">
		</div>
	</section>

	<div class="row topmargin-dlong m-auto">
	</div>

	<!-- Separadores  -->
	<div id="ribbon" style="margin-top:-5.2%;padding-bottom:-2px;">
		 <div class="content bg-dark" id="fonblanco">
			 <div class="row align-items-center content-center topmargin-sm"></div>			 
		 </div>
	</div>
	<div id="separator-ribbon"><div class="content bg-dark"></div></div>
	<div id="separator-2"><div class="content bg-dark"></div></div>

	<%@ page language = "java" import = "logic.CtrlProduct" %>
	<%@ page language = "java" import = "entities.Product" %>
	<%@ page language = "java" import = "java.util.LinkedList" %>
	<% CtrlProduct cp = new CtrlProduct();
	   LinkedList<Product> tarjProds = cp.fillTarjs();%>

	<!-- Tarjetas de productos -->
	<% if (tarjProds.size() == 6) { %>
	<section id="productos">
 		<div id="tarjetaProducts" class="botpad-1">
			<div class="container-md p-5">
				<div class="row pt-5">
					<h3 class="text-center pb-5 pt-5 h1" style="color:#ffffff">Algunos de nuestros productos</h3>
				</div>
				<div class="row">
					<div class="col-sm">
						<div class="card w-100 card-border mb-5 h-100">
  							<img src= "<%=tarjProds.get(0).getImg()%>" class="card-img-top img-fluid" style="max-height: 300px;">
  							<div class="card-body d-flex flex-column">
   								<h4 class="card-title"><b><%=tarjProds.get(0).getName()%></b></h4>
   								<p class="card-text"><%=tarjProds.get(0).getDescription()%></p>
   								<h5 class="card-text">$<%=tarjProds.get(0).getPrice()%></h5>
 							 </div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card w-100 card-border mb-5 h-100">
  							<img src= "<%=tarjProds.get(1).getImg()%>" class="card-img-top img-fluid" style="max-height: 300px;">
  							<div class="card-body d-flex flex-column">
   								<h4 class="card-title"><b><%=tarjProds.get(1).getName()%></b></h4>
   								<p class="card-text"><%=tarjProds.get(1).getDescription()%></p>
   								<h5 class="card-text">$<%=tarjProds.get(1).getPrice()%></h5>
 							 </div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card w-100 card-border mb-5 h-100">
  							<img src= "<%=tarjProds.get(2).getImg()%>" class="card-img-top img-fluid" style="max-height: 300px;">
  							<div class="card-body d-flex flex-column">
   								<h4 class="card-title"><b><%=tarjProds.get(2).getName()%></b></h4>
   								<p class="card-text"><%=tarjProds.get(2).getDescription()%></p>
   								<h5 class="card-text">$<%=tarjProds.get(2).getPrice()%></h5>
 							 </div>
						</div>
					</div>
				</div>
				<br><br><br>
				<div class="row">
					<div class="col-sm">
						<div class="card w-100 card-border mb-5 h-100">
  							<img src= "<%=tarjProds.get(3).getImg()%>" class="card-img-top img-fluid" style="max-height: 300px;">
  							<div class="card-body d-flex flex-column">
   								<h4 class="card-title"><b><%=tarjProds.get(3).getName()%></b></h4>
   								<p class="card-text"><%=tarjProds.get(3).getDescription()%></p>
   								<h5 class="card-text">$<%=tarjProds.get(3).getPrice()%></h5>
 							 </div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card w-100 card-border mb-5 h-100">
  							<img src= "<%=tarjProds.get(4).getImg()%>" class="card-img-top img-fluid" style="max-height: 300px;">
  							<div class="card-body d-flex flex-column">
   								<h4 class="card-title"><b><%=tarjProds.get(4).getName()%></b></h4>
   								<p class="card-text"><%=tarjProds.get(4).getDescription()%></p>
   								<h5 class="card-text">$<%=tarjProds.get(4).getPrice()%></h5>
 							 </div>
						</div>
					</div>
					<div class="col-sm">
						<div class="card w-100 card-border mb-5 h-100">
  							<img src= "<%=tarjProds.get(5).getImg()%>" class="card-img-top img-fluid" style="max-height: 300px;">
  							<div class="card-body d-flex flex-column">
   								<h4 class="card-title"><b><%=tarjProds.get(5).getName()%></b></h4>
   								<p class="card-text"><%=tarjProds.get(5).getDescription()%></p>
   								<h5 class="card-text">$<%=tarjProds.get(5).getPrice()%></h5>
 							 </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<% } %>
	
	<!-- Separador -->
	<div id="separator-2">
		<div class="content" style="background:#f5f5f5">
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
						<p>bgelectronicsofficial@gmail.com</p>
					</div>
					<div class="col text-center font-weight-light">
						<h4>Redes sociales</h4>
						
						<div id="block_container">
							<div id="bloc1">
								<div class="img-border">
									<a href="http://www.facebook.com"><img alt="" src="imgs/index/logosRedes/facebookLogo.png" height=40px width=40px> </a>
								</div>
							</div>
    						<div id="bloc2">
    							<div class="img-border">
									<a href="http://www.instagram.com"><img alt="" src="imgs/index/logosRedes/instagramLogo.png" height=40px width=40px> </a>
								</div>
    						</div>
    						<div id="bloc3">
    							<div class="img-border">
    								<a href="http://www.linkedin.com"><img alt="" src="imgs/index/logosRedes/linkedinLogo.png" height=40px width=40px> </a>
    							</div>
							</div>  
    						<div id="bloc4">
    							<div class="img-border">
    								<a href="http://www.whatsapp.com"><img alt="" src="imgs/index/logosRedes/whatsappLogo.png" height=40px width=40px> </a>
    							</div>
    						</div>
						</div>
					</div>
				</div>
				<form action = "Contact" method = "post">
					<div class="row justify-content-md-center py-1">
						<div class="mb-3">
  							<label class="form-label">Email</label>
  							<input name = "mailInput" type="email" class="form-control" id="exampleFormControlInput1" placeholder="@gmail.com">
						</div>
						<div class="mb-3">
  							<label class="form-label">Asunto</label>
  							<input name = "subjectInput" class="form-control" id="exampleFormControlInput1" placeholder="Escriba el asunto...">
 						</div>
 						<div class="mb-3">
 							<label class="form-label">Mensaje</label>
 		 					<textarea name = "msgInput" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
						</div>
						<input class="btn btn-primary topmargin-sm" role="button" style="top-margin:5px; width:680px;" type = "submit" value = "Enviar">
					</div>
				</form>
			</div>
		</div>
	</section>
	
	<div class="footer" style="background-color: #444; color: white; padding: 10px 0;">
		<div style="display: flex; align-items: center; justify-content: center;">
	    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-github" viewBox="0 0 16 16" style="width: 18px; height: 18px; margin-right: 5px;">
	    		<path d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.012 8.012 0 0 0 16 8c0-4.42-3.58-8-8-8z"/>
	    	</svg>
	    	<p class="text-center mb-0">
	      		Creado por <a href="https://github.com/adrielgorosito" target="_blank" style="color: #fff; text-decoration: underline;">Adriel Gorosito</a> y <a href="https://github.com/santiagobotali" target="_blank" style="color: #fff; text-decoration: underline;">Santiago Botali</a>
	    	</p>
	  	</div>
	</div>

</body>
</html>