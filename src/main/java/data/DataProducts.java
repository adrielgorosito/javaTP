package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entities.Product;
import entities.ProductType;

public class DataProducts {
	
	public Product searchProductById(Product p)  {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Product p2 = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Producto p INNER JOIN tipo_producto tp ON "
					+ "p.tipo_prod = tp.id_tipo WHERE id_prod = ?");
			stmt.setInt(1, p.getId_prod());
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				p2 = new Product();
				p2.setId_prod(rs.getInt("id_prod"));
				p2.setName(rs.getString("nombre"));
				p2.setDescription(rs.getString("descripcion"));
				p2.setPrice(rs.getDouble("precio"));
				p2.setImg(rs.getString("imagen"));
				p2.setStock(rs.getInt("stock"));
				
				ProductType pt = new ProductType();
				pt.setId(rs.getInt("id_tipo"));
				pt.setName(rs.getString("tipo"));
				p2.setType(pt);
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
		
		return p2;
	}
	
	
	public int getMaxId()  {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT MAX(id_prod) tot FROM producto");
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				tot = rs.getInt("tot");
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
		
		return tot;
	}
	
	
	
}
