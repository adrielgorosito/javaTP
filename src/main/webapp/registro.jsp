	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registro</title>
	</head>
<body>
	<table border=5 width=100% bgcolor=white>
		<tr>
			<th align = "left" style= "max-width: 11px">
				<img src = "logoejemplo.png">
			</th>
			<th>
				<a href = "index.html">Inicio</a>
			</th>
			<th align = "right">
				<a href = "index.html">Volver</a>
			</th>
		</tr>
	</table>
	
	<br>
	<br>
	<form action = "SignUpServlet" method = "post">
		<table align = center>
			<caption><font face = "tahoma" size = "5"><b>Registro</b></font></p></caption>
			<tr>
				<th colspan = "2" align = "left"><font face = "tahoma" size = "4"><u>Datos personales</u></font></th>
			</tr>
			<tr><th colspan = "2"></th></tr>
			<tr><th colspan = "2"></th></tr>
			<tr>
				<th align = "left"><font size = "2" face = "tahoma">Nombre:</font><font color = red> *</font></th>
				<th><input type = "text" required name = "name"></input></th>
			</tr>
			<tr>
				<th align = "left"><font size = "2" face = "tahoma">Apellido:</font><font color = red> *</font></th>
				<th><input type = "text" required  name = "surname"></input></th>
			</tr>
			<tr>
				<th align = "left"><font size = "2" face = "tahoma">DNI:</font><font color = red> *</font></th>
				<th><input type = "text" required  name = "dni"></input></th>
			</tr>
			<tr>
				<th align = "left"><font size = "2" face = "tahoma">Teléfono:</font></th>
				<th><input type = "text" name = "phone"></input></th>
			</tr>
			<tr><th colspan = "2"></th></tr>
			<tr><th colspan = "2"></th></tr>
			<tr><th colspan = "2"></th></tr>
			<tr>
				<th colspan = "2" align = "left"><font face = "tahoma" size = "4"><u>Datos de la cuenta</u></font></th>
			</tr>
			<tr><th colspan = "2"></th></tr>
			<tr><th colspan = "2"></th></tr>
			<tr>
				<th align = "left"><font size = "2" face = "tahoma">Email:</font><font color = red> *</font></th>
				<th><input type = "text" required name = "mail"></input></th>
			</tr>
			<tr>
				<th align = "left"><font size = "2" face = "tahoma">Nombre de usuario:</font><font color = red> *</font></th>
				<th><input type = "text" required name = "username"></input></th>
			</tr>
			<tr>
				<th align = "left"><font size = "2" face = "tahoma">Contraseña:</font><font color = red> *</font></th>
				<th><input type = "password" required name = "password1"></input></th>
			</tr>
						<tr>
				<th align = "left"><font size = "2" face = "tahoma">Repetir contraseña:</font><font color = red> *</font></th>
				<th><input type = "password" required name = "password2"></input></th>
			</tr>
			<tr><th colspan = "2"></th></tr>
			<tr><th colspan = "2"></th></tr>
			<tr>
				<th colspan = "2"><input type = "submit" value = "Crear cuenta"></th>
			</tr>
			<tr><th colspan = "2"></th></tr>
			<tr><th colspan = "2"></th></tr>
			<tr>
				<th colspan = "2" align = "left"><font face = "tahoma" size = "1" color = red>*: Datos obligatorios</font></th>
			</tr>
			<tr><th colspan = "2"></th></tr>
			<tr><th colspan = "2"></th></tr>
			<tr>
				<th colspan = "2" align = "right"><a href = login.jsp><font face = "tahoma" size = "2">¿Olvidaste tu contraseña?</font></a></th>
			</tr>
			<tr><th colspan = "2"></th></tr>
			<tr><th colspan = "2"></th></tr>
			<tr>
				<th colspan = "2" align = "right"><a href = login.jsp><font face = "tahoma" size = "2">¿Ya tienes una cuenta? Ingresar...</font></a></th>
			</tr>
		</table>
	</form>
	
</body>
</html>