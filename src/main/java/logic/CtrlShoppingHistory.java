package logic;

import data.DataShoppingHistory;
import entities.ShoppingHistory;

public class CtrlShoppingHistory {
	
	DataShoppingHistory dsh = new DataShoppingHistory();
	
	public void newShoppingHistory(ShoppingHistory sh) {
		dsh.addNewShoppingHistory(sh);
	}
}