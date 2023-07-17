package logic;

import data.DataUsers;
import entities.*;
import utils.SpecialCharactersChecker;

public class CtrlSignUp {
	
	private DataUsers du = new DataUsers();
	private CtrlUser cu = new CtrlUser();
	private SpecialCharactersChecker scc = new SpecialCharactersChecker();
	
	public boolean checkCharacters(String word) {
		return scc.hasSpecialCharacters(word);
	}
	
	public int createNewUser(User u1) {
		User u2 = new User();
		int error;
		
		u2 = cu.searchUserByDni(u1);
		if (u2 == null) {
			u2 = cu.searchUserByUsername(u1);
			if (u2 == null) {
				u2 = cu.searchUserByMail(u1);
				if (u2 == null) {
					du.addNewUser(u1);
					error = 0;
				} else {
					error = 7;
				}
			} else {
				error = 6;
			}
		} else {
			error = 5;
		}
		
		return error;
	}
	
}
