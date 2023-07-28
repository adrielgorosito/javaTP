package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;

import entities.Product;
import entities.ProductType;
import entities.ShoppingHistory;
import entities.User;

public class DataShoppingHistory {
	
	public void addNewShoppingHistory(ShoppingHistory sh) {
		PreparedStatement stmt = null;

		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
				   "INSERT INTO Historial_compras VALUES (?, ?, ?, ?, ?, ?)");
			
			stmt.setInt(1, sh.getProd().getId_prod());
			stmt.setInt(2, sh.getU().getDni());
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
					"SELECT * FROM Historial_compras hc"
					+ " INNER JOIN Producto p on p.id_prod = hc.idProd "
					+ " WHERE dniUser = ?"
					+ " ORDER BY fecha DESC");
			stmt.setInt(1, u.getDni());
			rs = stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					ShoppingHistory sh = new ShoppingHistory();
					sh.setFecha(rs.getTimestamp("fecha").toLocalDateTime());
					sh.setCantidad(rs.getInt("cantidad"));
					sh.setPrecio(rs.getDouble("precio"));
					sh.setFormaPago(rs.getString("formaPago"));
					
					Product p = new Product();
					p.setId_prod(rs.getInt("idProd"));
					p.setName(rs.getString("nombre"));
					p.setImg(rs.getString("imagen"));
					sh.setProd(p);
					
					sh.setU(u);
				
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
					"SELECT u.nombUsuario, tp.tipo, tp.id_tipo, p.id_prod, p.nombre, p.imagen, hc.fecha, hc.cantidad, hc.precio, hc.formaPago FROM Historial_compras hc"
					+ " INNER JOIN Producto p on p.id_prod = hc.idProd"
					+ " INNER JOIN User u on u.dni = hc.dniUser"
					+ " INNER JOIN Tipo_producto tp on tp.id_tipo = p.tipo_prod"
					+ " ORDER BY fecha DESC");
			rs = stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					ShoppingHistory sh = new ShoppingHistory();
					sh.setFecha(rs.getTimestamp("fecha").toLocalDateTime());
					sh.setCantidad(rs.getInt("cantidad"));
					sh.setPrecio(rs.getDouble("precio"));
					sh.setFormaPago(rs.getString("formaPago"));
					
					Product p = new Product();
					p.setId_prod(rs.getInt("id_prod"));
					p.setName(rs.getString("nombre"));
					p.setImg(rs.getString("imagen"));
					
					ProductType tp = new ProductType();
					tp.setId(rs.getInt("id_tipo"));
					tp.setName(rs.getString("tipo"));
					p.setType(tp);
					
					sh.setProd(p);
					
					User u = new User();
					u.setUsername(rs.getString("nombUsuario"));
					sh.setU(u);
				
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