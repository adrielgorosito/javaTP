package logic;

import data.DataProducts;
import entities.Product;

public class CtrlProduct {
	
	public Product getProduct(int id) {
		DataProducts dp = new DataProducts();
		
		Product p = new Product();
		p.setId_prod(id);
		
		return dp.searchProductById(p);
	}
}
