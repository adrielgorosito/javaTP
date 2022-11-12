# Sistema de una tienda de computación
Sistema integrador final para la materia "Lenguaje de programación JAVA"


Integrantes:

    Gorosito, Adriel (Legajo: 47066)
    Botali, Santiago (Legajo: 47477)
    
<h4>Descripción del trabajo</h4>

   Realizamos una página web acerca de una tienda online de artículos de computación.

<h2>Alcance funcional</h2>

<h4>Niveles de acceso</h4>

- Invitado: es aquella persona que visita la página sin estar logueado. Puede ver algunos productos que se encuentran a la venta pero no puede realizar ningún tipo de compra. También puede enviar mails de contacto.
- Usuario registrado: es aquella persona que dispone de una cuenta. Puede realizar el proceso de compra de un producto y modificar sus datos personales (como dirección, mail y contraseña). Para modificar su contraseña es necesario que confirme un código enviado por mail.
- Administrador: es un empleado que tiene permisos completos dentro de la página. Puede gestionar los productos y los tipos de producto (para ambos casos, darlos de alta o de baja, modificarlos o añadir nuevos) y los usuarios (eliminar sus cuentas).

<h4>ABMCs</h4>

- ABMC de productos (por parte de un administrador), depende de categoría.
- ABMC de categorías de productos (por parte de un administrador).
- ABMC de usuarios (alta y modificación por parte de un usuario y consulta y baja por parte de un administrador).

<h4>Listados</h4>

- Listado de todos los productos.
- Listado de todos los tipos de productos.
- Listado de todos los usuarios.
- Listado de productos específicos por tipo (listado complejo).

<h2>Caso de uso complejo</h2>

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

<h2>Modelo de Dominio regularidad</h2>

[![MDTP-Java.png](https://i.postimg.cc/JhVCs5Gb/MDTP-Java.png)](https://postimg.cc/Yv3sVgN9)

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




