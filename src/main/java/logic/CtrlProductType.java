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

	public void changeName(ProductType pt, String newName) {
		dpt.changeName(pt, newName);
	}

	public void disableProductType(ProductType pt) {
		dpt.disableProductType(pt);
	}
	
	public void enableProductType(ProductType pt) {
		dpt.enableProductType(pt);
	}

	public void addNewProductType(ProductType pt) {
		dpt.addNewProductType(pt);	
	}
	
}