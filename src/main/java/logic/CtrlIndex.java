package logic;

public class CtrlIndex {
	
	
	public static void main(String[] args) { // Borrar esto
		int integ;
	}
	
	public void tarjProd() {
		int min = 1;
		int max = 5;
		
		for (int i = 0; i < 6; i++) {
			int randomValue = (int) (Math.random()*(max-min)) + min;
			
			min = min + 5;
			max = max + 5;
			
			
			// método a db, retorno una linkedList de productos,
			// desde index uso dicha linkedList
			
			
			System.out.println(randomValue);
		}
	}
}
