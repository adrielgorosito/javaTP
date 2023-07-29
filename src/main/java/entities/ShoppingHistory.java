package entities;

import java.time.LocalDateTime;

public class ShoppingHistory {
	private Product prod;
	private User u;
	private LocalDateTime fecha;
	private int cantidad;
	private double precio;
	private String formaPago;
	
	public ShoppingHistory(Product prod, User u, LocalDateTime now, int cant, Double price, String metodoPago) {
		this.setProd(prod);
		this.setU(u);
		this.setFecha(now);
		this.setCantidad(cant);
		this.setPrecio(price);
		this.setFormaPago(metodoPago);
	}
	
	public ShoppingHistory() {}
	
	public Product getProd() {
		return prod;
	}

	public void setProd(Product prod) {
		this.prod = prod;
	}

	public User getU() {
		return u;
	}

	public void setU(User u) {
		this.u = u;
	}

	public LocalDateTime getFecha() {
		return fecha;
	}
	public void setFecha(LocalDateTime fecha) {
		this.fecha = fecha;
	}
	
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	public String getFormaPago() {
		return formaPago;
	}
	public void setFormaPago(String formaPago) {
		this.formaPago = formaPago;
	}
	
}