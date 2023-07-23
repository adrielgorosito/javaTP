package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import entities.ShoppingHistory;
import entities.User;

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
	
	public LinkedList<ShoppingHistory> getHistoryByUser(User u) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<ShoppingHistory> shList = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Historial_compras WHERE dniUser = ? ORDER BY fecha DESC");
			stmt.setInt(1, u.getDni());
			rs = stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					ShoppingHistory sh = new ShoppingHistory();
					sh.setIdProd(rs.getInt("idProd"));
					sh.setDniUser(rs.getInt("dniUser"));
					sh.setFecha(rs.getTimestamp("fecha").toLocalDateTime());
					sh.setCantidad(rs.getInt("cantidad"));
					sh.setPrecio(rs.getDouble("precio"));
					sh.setFormaPago(rs.getString("formaPago"));
				
					shList.add(sh);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if (stmt != null) {
					stmt.close();
				}
				
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return shList;
	}

	public void deleteHistoryByUser(User u) {
        PreparedStatement stmt = null;

        try {
            stmt = DbConnector.getInstancia().getConn().prepareStatement(
                    "DELETE FROM Historial_compras WHERE dniUser = ?");
            stmt.setInt(1, u.getDni());

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

	public LinkedList<ShoppingHistory> getAll() {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<ShoppingHistory> shList = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Historial_compras ORDER BY fecha DESC");
			rs = stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					ShoppingHistory sh = new ShoppingHistory();
					sh.setIdProd(rs.getInt("idProd"));
					sh.setDniUser(rs.getInt("dniUser"));
					sh.setFecha(rs.getTimestamp("fecha").toLocalDateTime());
					sh.setCantidad(rs.getInt("cantidad"));
					sh.setPrecio(rs.getDouble("precio"));
					sh.setFormaPago(rs.getString("formaPago"));
				
					shList.add(sh);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if (stmt != null) {
					stmt.close();
				}
				
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return shList;
	}
	
}