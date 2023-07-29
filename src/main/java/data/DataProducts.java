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
		PreparedStatement pstmt2 = null;
		
		try {
			DbConnector.getInstancia().getConn().setAutoCommit(false);
			
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Producto WHERE id_prod = ?");
			pstmt.setInt(1, p.getId_prod());
			pstmt.executeQuery();
			
			pstmt2 = DbConnector.getInstancia().getConn().prepareStatement("UPDATE Producto SET stock = ? WHERE id_prod = ?");
			pstmt2.setInt(1, p.getStock());
			pstmt2.setInt(2, p.getId_prod());
			pstmt2.executeUpdate();
			
			DbConnector.getInstancia().getConn().commit();
			
		} catch (SQLException e) {
            e.printStackTrace();
            
            try {
                if (DbConnector.getInstancia().getConn() != null)
        			DbConnector.getInstancia().getConn().rollback();
            } catch (SQLException e2) {
            	e2.printStackTrace();
            }
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				
				if (pstmt2 != null)
					pstmt2.close();
				
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

	public LinkedList<Product> getProductsByType(int idType) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Product> prods = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Producto p INNER JOIN Tipo_producto tp ON p.tipo_prod = tp.id_tipo "
					+ "WHERE tp.id_tipo = ?");
			stmt.setInt(1, idType);
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
				
					prods.add(p);
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
		
		return prods;
	}

	public void addNewProduct(Product p) {
		PreparedStatement stmt = null;

		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
				   "INSERT INTO Producto (tipo_prod, nombre, descripcion, precio, imagen, stock, activo) VALUES (?, ?, ?, ?, ?, ?, ?)");
			
			stmt.setInt(1, p.getType().getId());
			stmt.setString(2, p.getName());
			stmt.setString(3, p.getDescription());
			stmt.setDouble(4, p.getPrice());
			stmt.setString(5, p.getImg());
			stmt.setInt(6, p.getStock());
			stmt.setBoolean(7, p.isActive());
			
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

	public LinkedList<Product> getSixRandomProducts() {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Product> randomProds = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Producto WHERE activo = 1 ORDER BY RAND() LIMIT 6");
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
					
					randomProds.add(p);
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
		
		return randomProds;
	}

	public LinkedList<Product> getActiveProducts() {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		LinkedList<Product> allProducts = new LinkedList<>();
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT * FROM Producto p INNER JOIN Tipo_producto tp ON p.tipo_prod = tp.id_tipo "
					+ "WHERE p.activo = 1");
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

}
