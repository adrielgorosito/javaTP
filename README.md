# Sistema de una tienda de electrodomésticos
Sistema integrador final para la materia "Lenguaje de programación JAVA"


Integrantes:

    Gorosito, Adriel (Legajo: 47066)
    Botali, Santiago (Legajo: 47477)
    
Descripción del trabajo:

   Realizaremos una página web acerca de una tienda online de artículos de computación.

<h2>Alcance funcional</h2>

<h4>Niveles de acceso</h4>

- Invitado: es aquella persona que visita la página sin estar logueado, pudiendo ver algunos productos que se encuentran a la venta pero sin poder realizar ningún tipo de compra. Además pueden enviar un mail de contacto.
- Usuario registrado: cumple las mismas funciones que el invitado, a diferencia de que si puede realizar compras, teniendo un historial de las mismas a su alcance (en su perfil).
- Administrador: es un empleado que tiene permisos completos dentro de la página cuyas funciones incluyen consultar productos, darlos de alta/baja, actualizarlos, manejo de usuarios, etc.

<h4>ABMCs</h4>

- ABMC de productos (por parte de un administrador), depende de categoría.
- ABMC de categorías de productos (por parte de un administrador).
- ABMC de usuarios (alta por parte de un usuario y lo demás por un administrador).

<h4>Listados</h4>

- Listado de todos los productos (listado simple).
- Listado de productos específicos por categoría (ej., productos → audio → auricular).

<h2>Caso de uso complejo</h2>

<b>CUS: Compra de un producto<b>

Camino principal
1. El cliente ingresa a la página y se loguea con su cuenta en el sistema.
2. El cliente se decide por un producto y procede con la compra. El sistema lo redirecciona para completar el pedido.
3. El cliente elige la cantidad que desea. El sistema lo redirecciona para terminar la compra.
4. El cliente elige si pagar en Rapipago o Pagofácil. El sistema muestra el subtotal, dirección del cliente, precio del envío y el total.
5. El cliente confirma la compra y el sistema lo registra.

Camino alternativo
	
1.a. <Durante> El cliente no tiene cuenta.<t>	
1.a.1. El cliente se crea una cuenta y el sistema lo registra.<t>
2.a. <Anterior> El cliente no se decide por ningún producto.
	2.a.1. Fin de CU.
5.a. <Reemplaza> El cliente no confirma o cancela la compra
	5.a.1. Fin de CU.

    
    
[![MDTP-Java.png](https://i.postimg.cc/JhVCs5Gb/MDTP-Java.png)](https://postimg.cc/Yv3sVgN9)
