package logic;

import data.DataProducts;
import entities.Product;

public class CtrlIndex {
	
	public DataProducts dp = new DataProducts();
	
	public Product getRandomProduct(int max, int min) {
		// Recibe dos números
		int randomId = (int) (Math.random()*(max-min)) + 1;
		
		Product p = new Product();
		p.setId_prod(randomId);
		p = dp.searchProductById(p);
		
		return p;
	}
}
