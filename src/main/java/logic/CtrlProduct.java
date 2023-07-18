package logic;

import java.util.LinkedList;
import data.DataProducts;
import entities.Product;

public class CtrlProduct {
	
	DataProducts dp = new DataProducts();
	
	public Product getProduct(int id) {
		Product p = new Product();
		p.setId_prod(id);
		
		return dp.searchProductById(p);
	}
	
	public int getMaxIdProducts() {
		return dp.getMaxId();
	}
	
	public LinkedList<Product> getAllProducts() {
		return dp.getAll();
	}
	
	public LinkedList<Product> fillTarjs() {
		return dp.getSixRandomProducts();
	}
	
	public void updateStock(Product p) {
		dp.updateStock(p);
	}
	
	public void disableProduct(Product p) {
		dp.disableProduct(p);
	}
	
	public void enableProduct(Product p) {
		dp.enableProduct(p);
	}

	public void updateProduct(Product p) {
		dp.updateProduct(p);
	}
	
	public LinkedList<Product> getProductsByType(int idType) {
		LinkedList<Product> prods = new LinkedList<>();
		prods = dp.getProductsByType(idType);
		
		return prods;
	}

	public void addNewProduct(Product p) {
		dp.addNewProduct(p);
	}
	
}
