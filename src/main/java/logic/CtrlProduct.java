package logic;

import java.util.LinkedList;

import data.DataProducts;
import entities.Product;
import utils.Randomize;

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
	
	public LinkedList<Integer> fillTarjs(int totProds) {
		Randomize r = new Randomize();
		
		LinkedList<Integer> tarjProds = new LinkedList<>();
		
		while (tarjProds.size() < 6) {
			   int idRandom = r.getRandomId(totProds);
			
			   if (!tarjProds.contains(idRandom)) {
				   tarjProds.add(idRandom);
			   }
		   }
		   
		return tarjProds;
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
	
	
	
}
