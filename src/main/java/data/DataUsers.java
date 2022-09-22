package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entities.*;

public class DataUsers {

	public User loginByUsername(User u)  {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userFound = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT dni, nombUsuario, nombre, apellido, email, telefono, isAdmin, image "
					+ "FROM User WHERE nombUsuario = ? AND contraseña = ?");
			stmt.setString(1, u.getUsername());
			stmt.setString(2, u.getPassword());
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				userFound = new User();
				userFound.setDni(rs.getInt("dni"));
				userFound.setUsername(rs.getString("nombUsuario"));
				userFound.setName(rs.getString("nombre"));
				userFound.setSurname(rs.getString("apellido"));
				userFound.setMail(rs.getString("email"));
				userFound.setPhone(rs.getString("telefono"));
				userFound.setAdmin(rs.getBoolean("isAdmin"));
				userFound.setImage(rs.getString("image"));
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
		
		return userFound;
	}
	
	public User loginByMail(User u)  {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userFound = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT dni, nombUsuario, nombre, apellido, email, telefono, isAdmin, image "
					+ "FROM User WHERE email = ? AND contraseña = ?");
			stmt.setString(1, u.getMail());
			stmt.setString(2, u.getPassword());
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				userFound = new User();
				userFound.setDni(rs.getInt("dni"));
				userFound.setUsername(rs.getString("nombUsuario"));
				userFound.setName(rs.getString("nombre"));
				userFound.setSurname(rs.getString("apellido"));
				userFound.setMail(rs.getString("email"));
				userFound.setPhone(rs.getString("telefono"));
				userFound.setAdmin(rs.getBoolean("isAdmin"));
				userFound.setImage(rs.getString("image"));
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
		
		return userFound;
	}
	
	public User searchUserByDni(User u) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userFound = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT dni, nombUsuario FROM User WHERE dni = ?");
			stmt.setInt(1, u.getDni());
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				userFound = new User();
				userFound.setDni(rs.getInt("dni"));
				userFound.setUsername(rs.getString("nombUsuario"));
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
		
		return userFound;
	}
	
	public User searchUserByUsername(User u) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userFound = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT dni, nombUsuario FROM User WHERE nombUsuario = ?");
			stmt.setString(1, u.getUsername());
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				userFound = new User();
				userFound.setDni(rs.getInt("dni"));
				userFound.setUsername(rs.getString("nombUsuario"));
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
		
		return userFound;
	}
	
	public User searchUserByMail(User u) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userFound = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT dni, nombre, email, contraseña FROM User WHERE email = ?");
			stmt.setString(1, u.getMail());
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				userFound = new User();
				userFound.setDni(rs.getInt("dni"));
				userFound.setName(rs.getString("nombre"));
				userFound.setMail(rs.getString("email"));
				userFound.setPassword(rs.getString("contraseña"));
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
		
		return userFound;
	}
	
	public void addNewUser(User u) {
		PreparedStatement stmt = null;

		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
				   "INSERT INTO user VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
			stmt.setInt(1, u.getDni());
			stmt.setString(2, u.getUsername());
			stmt.setString(3, u.getPassword());
			stmt.setString(4, u.getName());
			stmt.setString(5, u.getSurname());
			stmt.setString(6, u.getMail());
			stmt.setString(7, u.getPhone());
			stmt.setInt(8, 0);
			
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
	
	public void changePassword(User u) {
		PreparedStatement pstmt = null;

		try {
			pstmt = DbConnector.getInstancia().getConn().prepareStatement(
				   "UPDATE User SET contraseña = ? WHERE dni = ?");
			pstmt.setString(1, u.getPassword());
			pstmt.setInt(2, u.getDni());
			
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