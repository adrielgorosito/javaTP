package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

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
				p2.setActive(rs.getBoolean("activo"));
				
				ProductType pt = new ProductType();
				pt.setId(rs.getInt("id_tipo"));
				pt.setName(rs.getString("tipo"));
				pt.setActive(rs.getBoolean("activo"));
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
		int maxId = 0;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT MAX(id_prod) maxId FROM producto");
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				maxId = rs.getInt("maxId");
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
		
		return maxId;
	}
	
	public LinkedList<Product> getAll()  {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Product> allProducts = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Producto p INNER JOIN Tipo_producto tp ON p.tipo_prod = tp.id_tipo;");
			rs = stmt.executeQuery();
			
			if (rs != null) {
				while (rs.next()) {
					Product p = new Product();
					p.setId_prod(rs.getInt("id_prod"));
					p.setName(rs.getString("nombre"));
					p.setDescription(rs.getString("descripcion"));
					p.setPrice(rs.getDouble("precio"));
					p.setImg(rs.getString("imagen"));
					p.setStock(rs.getInt("stock"));
					p.setActive(rs.getBoolean("activo"));
				
					ProductType pt = new ProductType();
					pt.setId(rs.getInt("id_tipo"));
					pt.setName(rs.getString("tipo"));
					pt.setActive(rs.getBoolean("activo"));
					p.setType(pt);
				
					allProducts.add(p);
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
		
		return allProducts;
	}
	
	public void updateStock(Product p)  {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
					   "UPDATE Producto SET stock = ? WHERE id_prod = ?");
			pstmt.setInt(1, p.getStock());
			pstmt.setInt(2, p.getId_prod());
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

	public void enableProduct(Product p) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
					   "UPDATE Producto SET activo = 1 WHERE nombre = ?");
			pstmt.setString(1, p.getName());
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
	
	public void disableProduct(Product p) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
					   "UPDATE Producto SET activo = 0 WHERE nombre = ?");
			pstmt.setString(1, p.getName());
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

	public void updateProduct(Product p) {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
					   "UPDATE Producto SET nombre = ?, descripcion = ?, precio = ?, "
					   + "stock = ?, tipo_prod = ? WHERE id_prod = ?");
			
			pstmt.setString(1, p.getName());
			pstmt.setString(2, p.getDescription());
			pstmt.setDouble(3, p.getPrice());
			pstmt.setInt(4, p.getStock());
			pstmt.setInt(5, p.getType().getId());
			pstmt.setInt(6, p.getId_prod());
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
