package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import entities.Product;
import entities.ProductType;

public class DataProductTypes {
	
	public LinkedList<ProductType> getAllProductTypes()  {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ProductType pt = null;
		LinkedList<ProductType> allProductTypes = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Tipo_producto");
			
			rs = stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					pt = new ProductType();
					pt.setId(rs.getInt("id_tipo"));
					pt.setName(rs.getString("tipo"));
					pt.setActive(rs.getBoolean("activo"));
					
					allProductTypes.add(pt);
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
		
		return allProductTypes;
	}

	public ProductType getProductTypeByName(Product p) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ProductType pt = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Tipo_producto WHERE tipo = ?");
			
			stmt.setString(1, p.getType().getName());
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				pt = new ProductType();
				pt.setId(rs.getInt("id_tipo"));
				pt.setName(rs.getString("tipo"));
				pt.setActive(rs.getBoolean("activo"));
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
		
		return pt;
	}

	public void changeName(ProductType pt, String newName) {
		PreparedStatement pstmt = null;

		try {
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
				   "UPDATE Tipo_producto SET tipo = ? WHERE id_tipo = ?");
			pstmt.setString(1, newName);
			pstmt.setInt(2, pt.getId());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if (pstmt != null)
                	pstmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
	}

	public void disableProductType(ProductType pt) {
		PreparedStatement pstmt = null;

		try {
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
				   "UPDATE Tipo_producto SET activo = false WHERE id_tipo = ?");
			pstmt.setInt(1, pt.getId());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if (pstmt != null)
                	pstmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
		
	}

	public void enableProductType(ProductType pt) {
		PreparedStatement pstmt = null;

		try {
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
				   "UPDATE Tipo_producto SET activo = true WHERE id_tipo = ?");
			pstmt.setInt(1, pt.getId());
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
            e.printStackTrace();
		} finally {
            try {
                if (pstmt != null)
                	pstmt.close();
                DbConnector.getInstancia().releaseConn();
            } catch (SQLException e) {
            	e.printStackTrace();
            }
		}
		
	}
	
}
