package logic;

import entities.User;
import java.util.LinkedList;
import data.DataUsers;

public class CtrlUser {
	
	DataUsers du = new DataUsers();
	
	public LinkedList<User> getAllUsers() {
		LinkedList<User> listUsers = new LinkedList<>();
		
		listUsers = du.getAll();
		
		return listUsers;
	}

	public void deleteUser(User u) {
		du.deleteUser(u);
	}
	
	public User searchUserByDni(User u) {
		return du.searchUserByDni(u);
	}
	
	public User searchUserByUsername(User u) {
		return du.searchUserByUsername(u);
	}
	
	public User searchUserByMail(User u) {
		return du.searchUserByMail(u);
	}
}
