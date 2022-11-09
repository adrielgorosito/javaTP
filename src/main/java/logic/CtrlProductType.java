package logic;

import java.util.LinkedList;
import data.DataProductTypes;
import entities.Product;
import entities.ProductType;

public class CtrlProductType {
	
	DataProductTypes dpt = new DataProductTypes();
	
	public LinkedList<ProductType> getAllProductTypes() {
		return dpt.getAllProductTypes();
	}
	
	public ProductType getProductTypeByName(Product p) {
		return dpt.getProductTypeByName(p);
	}
}