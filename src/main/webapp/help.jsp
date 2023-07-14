<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Ayuda</title>
			
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
	
	
	<div class="container">
		<div class="content-center topmargin-lg">
			<h2 class ="text-center pb-2 pt-3 h2"><b>Preguntas frecuentes</b></h2>
			<div class ="text-left">
				<br>
				<b>1. ¿Cuál es el tiempo de entrega de los productos?</b>
				<br>
				El tiempo de entrega de nuestros productos varía según la ubicación. Por lo general, el plazo de entrega es de 3 a 5 días hábiles dentro del país.
				<br><br>
				
				<b>2. ¿Cuáles son las opciones de pago disponibles?</b>
				<br>
				Actualmente solo trabajamos con pago en efectivo, por medio de Rapipago o Pagofácil. Al momento de realizar tu compra, podrás seleccionar la opción de pago que más te convenga.
				<br><br>
				
				<b>3. ¿Puedo realizar cambios o devoluciones?</b>
				<br>
				Sí, aceptamos cambios y devoluciones dentro de los 14 días posteriores a la recepción de tu pedido. El producto debe estar en su estado original y sin usar. Debes ponerte en contacto con nuestro equipo de atención al cliente para iniciar el proceso de cambio o devolución.
				<br><br>
				
				<b>4. ¿Qué hago si mi producto llega dañado o defectuoso?</b>
				<br>
				Lamentamos cualquier inconveniente. Si tu producto llega dañado o defectuoso, por favor, ponte en contacto con nuestro equipo de atención al cliente lo antes posible. Puedes decidir si devolver el producto o recibir un resarcimiento económico.
				<br><br>
				
				<b>5. ¿Ofrecen envío gratis?</b>
				<br>
				Por ahora no realizamos envíos gratuitos. Eso no significa que en un futuro no cambiemos de opinión!
				<br><br>
				
				<b>6. ¿Puedo comprar más de un producto al mismo tiempo, pagando el envío una única vez?</b>
				<br>
				Lastimosamente no contamos con un carrito de compras que permita realizar dicha función. Deberás comprar cada producto por su propia cuenta y pagar el envío correspondiente a cada uno.
				<br><br>
				
				<b>7. ¿Tienen un programa de fidelidad o descuentos para clientes habituales?</b>
				<br>
				Nuestro equipo de desarrollo se está encargando para ofrecer un programa de fidelidad en el futuro. ¡Queremos premiar a aquellos clientes leales!
				<br><br>
				
				<b>8. ¿Puedo realizar cambios en mi pedido después de haberlo realizado?</b>
				<br>
				Una vez que hayas realizado tu pedido, los cambios pueden ser difíciles de realizar. Sin embargo, te recomendamos ponerte en contacto con nuestro equipo de atención al cliente lo antes posible para verificar si es posible realizar modificaciones en tu pedido en función del estado de procesamiento del mismo.
				<br><br>
				
				<b>9. ¿Tienen un servicio de atención al cliente por teléfono?</b>
				<br>
				Si, además de contactarnos por mail, puedes contactarnos por teléfono. Nuestro número de teléfono es: 03492-319041. También puedes contactarnos por nuestras redes sociales, respondemos todos los mensajes.
				<br><br>
				
				<b>10. ¿Ofrecen garantía en sus productos?</b>
				<br>
				Sí, ofrecemos garantía en nuestros productos. La duración de la garantía es de un año para todos los productos, sin excepción. Si experimentas algún problema con un producto, por favor, ponte en contacto con nuestro equipo de atención al cliente para recibir asistencia.
				<br><br>
				
			</div>
			<div class ="text-center">
				<a href = "indexUser.jsp"><button class="btn btn-primary margintop3" style = "width:230px">Ir al inicio</button></a>
			</div>
			
			<br>
		</div>
	</div>

</body>
</html>