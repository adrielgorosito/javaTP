package entities;

import java.time.LocalDateTime;

public class ShoppingHistory {
	private int idProd;
	private int dniUser;
	private LocalDateTime fecha;
	private int cantidad;
	private double precio;
	private String formaPago;
	
	public ShoppingHistory(int id_prod, int dni, LocalDateTime now, int cant, Double price, String metodoPago) {
		this.setIdProd(id_prod);
		this.setDniUser(dni);
		this.setFecha(now);
		this.setCantidad(cant);
		this.setPrecio(price);
		this.setFormaPago(metodoPago);
	}
	
	public ShoppingHistory() {}
	
	public int getIdProd() {
		return idProd;
	}
	public void setIdProd(int idProd) {
		this.idProd = idProd;
	}
	
	public int getDniUser() {
		return dniUser;
	}
	public void setDniUser(int dniUser) {
		this.dniUser = dniUser;
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