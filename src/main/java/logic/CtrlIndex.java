package logic;

import java.util.LinkedList;

import data.DataProducts;
import entities.Product;

public class CtrlIndex {
	
	public DataProducts dp = new DataProducts();
	
	public Product getProduct(int id) {
		Product p = new Product();
		p.setId_prod(id);
		p = dp.searchProductById(p);
		
		return p;
	}
	
	public int getMaxIdProducts() {
		return dp.searchTotalProducts();
	}
	
	public int getRandomId(int max) {
		int randomId = (int) (Math.random()*(max-1)) + 1;
		return randomId;
	}
	
	public LinkedList<Integer> fillTarjs(int totProds) {
		LinkedList<Integer> tarjProds = new LinkedList<>();
		
		while (tarjProds.size() < 3) {
			   int idRandom = getRandomId(totProds);
			
			   if (!tarjProds.contains(idRandom)) {
				   tarjProds.add(idRandom);
			   }
		   }
		   
		return tarjProds;
	}
	
	
}
