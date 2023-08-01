# Sistema de una tienda de computación
Sistema integrador final para la materia "Lenguaje de programación JAVA"


Integrantes:

    Gorosito, Adriel (Legajo: 47066)
    Botali, Santiago (Legajo: 47477)
    
<h4>Descripción del trabajo</h4>
Realizamos una página web e-commerce que es una tienda online de productos de computación. En la misma podrás interactuar como visitante, usuario o administrador. 

   
<h4>Stack utilizado</h4>

<p align="left">
  <a href="https://www.w3.org/html/" target="_blank" rel="noreferrer">
    <img src="https://www.w3.org/html/logo/downloads/HTML5_Badge_256.png" alt="html5" width="40" height="40"/>
  </a>
  <a href="https://www.w3schools.com/css/" target="_blank" rel="noreferrer">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/CSS3_logo.svg/800px-CSS3_logo.svg.png" alt="css3" width="40" height="40"/>
  </a>
  <a href="https://getbootstrap.com" target="_blank" rel="noreferrer"> 
     <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Bootstrap_logo.svg/512px-Bootstrap_logo.svg.png" alt="bootstrap" width="45" height="40"/>
  </a>
  <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank" rel="noreferrer">
    <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/javascript/javascript-original.svg" alt="javascript" width="40" height="40"/>
  </a>
  <a href="https://www.java.com" target="_blank" rel="noreferrer">
    <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/java/java-original.svg" alt="java" width="40" height="40"/>
  </a>
  <a href="https://www.mysql.com/" target="_blank" rel="noreferrer">
    <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="40" height="40"/>
  </a>
</p>

<br>

<h1>Requisitos</h1>

<h2>Checklist Regularidad</h2> 	
	
| Requerimiento | Cantidad mínima<br>2 integrantes | Detalle / Listado de casos incluidos 
| --- | --- | --- |
| ABMC simple | 1 x integrante | ABMC - Usuario <br> ABMC - Productos|			 
| ABMC dependiente | 1 | ABMC - Tipo producto |
| CU NO-ABMC | 1 | CUS - Comprar producto|
| Listado simple | 1 | Listado de productos |
| Listado complejo | 0 | - |

<h2>Checklist Aprobación Directa</h2> 	

| Requerimiento | Cantidad minima<br>2 Integrantes | Detalle/ Listado de casos incluidos 
| --- | --- | --- |
| ABMC | Todos | ABMC - Usuario <br> ABMC - Productos <br> ABMC - Tipo de producto |			 
| CU NO-ABMC | 1 | CUS - Comprar producto |
| Listado complejo | 1 | -|
| Nivel de acceso | 2 | Cliente<br>Administrador<br>Visitante |
| Manejo de errores | Obligatorio | No requiere detalles |
| Requerimientos extra | 1 | Envio de mail para contactarse<br>Envio de mail para recuperar contraseña |
| Rublicar el sitio | Obligatorio | No requiere detalles |

<br>
	
<h1>Alcance funcional</h1>

<h4>Niveles de acceso</h4>

- Invitado: es aquella persona que visita la página sin estar logueado. Puede ver algunos productos que se encuentran a la venta pero no puede realizar ningún tipo de compra. También puede enviar mails de contacto.
- Usuario registrado: es aquella persona que dispone de una cuenta. Puede realizar el proceso de compra de un producto, acceder a un historial de compras y modificar sus datos personales (como dirección, mail y contraseña). Para modificar su contraseña es necesario que confirme un código enviado por mail.
- Administrador: es un empleado que tiene permisos completos dentro de la página. Puede gestionar los productos (consultar, añadir uno nuevo, modificar y dar de alta o de baja) y los tipos de producto (consultar, añadir uno nuevo, modificar y dar de alta o de baja) y los usuarios (ver el historial de compras completo o eliminar sus cuentas).

<h4>Datos de acceso</h4>

- Visitante (sin cuenta)
- Usuario 
    * nombre: gastonbg
    * contraseña: 123456789
- Administrador
   * nombre: admin
   * contraseña: admin

<h4>ABMCs</h4>

- ABMC de productos (por parte de un administrador), depende de categoría.
- ABMC de categorías de productos (por parte de un administrador).
- ABMC de usuarios (alta y modificación por parte de un usuario y consulta y baja por parte de un administrador).

<h4>Listados</h4>

- Listado complejo de todos los productos.
- Listado de todos los tipos de productos.
- Listado de todos los usuarios.
- Listado del historial de compras (por usuario o general)

<h2>Caso de uso no ABMC</h2>

<h4>CUS: Compra de un producto<h4>

<h5>Camino principal</h5>
1. El cliente ingresa a la página y se loguea con su cuenta en el sistema.<br>
2. El cliente se decide por un producto y procede con la compra. El sistema lo redirecciona para completar el pedido.<br>
3. El cliente elige la cantidad que desea. El sistema lo redirecciona para terminar la compra.<br>
4. El cliente elige si pagar en Rapipago o Pagofácil. El sistema muestra el subtotal, dirección del cliente, precio del envío y el total.<br>
5. El cliente confirma la compra y el sistema lo registra.<br>

<h5>Camino alternativo</h5>
 1.a. <Durante> El cliente no tiene cuenta.<br>
 &emsp;1.a.1. El cliente se crea una cuenta y el sistema lo registra.<br> 
 2.a. <Anterior> El cliente no se decide por ningún producto.<br> 
 &emsp;2.a.1. Fin de CU.<br> 
 5.a. <Reemplaza> El cliente no confirma o cancela la compra.<br> 
 &emsp;5.a.1. Fin de CU.<br> 

<h2>Modelo de Dominio</h2>

![image](https://github.com/adrielgorosito/javaTP/assets/111536783/2c3c0cec-737f-4329-8cd3-c04b9bbb1c6c)

<h2>Diagrama de entidad-relación</h2>

![image](https://github.com/adrielgorosito/javaTP/assets/111536783/50964fcd-532a-4b4d-aa42-7ae480cece1d)





