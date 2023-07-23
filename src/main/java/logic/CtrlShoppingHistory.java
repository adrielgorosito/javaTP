package logic;

import java.util.LinkedList;
import data.DataShoppingHistory;
import entities.ShoppingHistory;
import entities.User;

public class CtrlShoppingHistory {
	
	DataShoppingHistory dsh = new DataShoppingHistory();
	
	public void newShoppingHistory(ShoppingHistory sh) {
		dsh.addNewShoppingHistory(sh);
	}
	
	public LinkedList<ShoppingHistory> getHistoryByUser(User u) {
		return dsh.getHistoryByUser(u);
	}
	
	public LinkedList<ShoppingHistory> getAll() {
		return dsh.getAll();
	}

	public void deleteByUser(User u) {
		dsh.deleteHistoryByUser(u);
	}
	
}