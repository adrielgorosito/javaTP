package data;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import entities.ShoppingHistory;

public class DataShoppingHistory {
	
	public void addNewShoppingHistory(ShoppingHistory sh) {
		PreparedStatement stmt = null;

		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
				   "INSERT INTO Historial_compras VALUES (?, ?, ?, ?, ?, ?)");
			
			stmt.setInt(1, sh.getIdProd());
			stmt.setInt(2, sh.getDniUser());
			stmt.setTimestamp(3, Timestamp.valueOf(sh.getFecha()));
			stmt.setInt(4, sh.getCantidad());
			stmt.setDouble(5, sh.getPrecio());
			stmt.setString(6, sh.getFormaPago());
			
			stmt.executeUpdate();
		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if (stmt != null)
                	stmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
		
	}
	
}