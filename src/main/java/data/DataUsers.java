package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import entities.*;

public class DataUsers {

	public User getUser(User u)  {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		User userFound = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement(
					"SELECT id, usuario, nombre, apellido, email "
					+ "FROM User WHERE usuario = ? AND contraseña = ?");
			stmt.setString(1, u.getUsername());
			stmt.setString(2, u.getPassword());
			rs = stmt.executeQuery();
			
			if (rs != null && rs.next()) {
				userFound = new User();
				userFound.setId(rs.getInt("id"));
				userFound.setUsername(rs.getString("usuario"));
				userFound.setName(rs.getString("nombre"));
				userFound.setSurname(rs.getString("apellido"));
				userFound.setMail(rs.getString("email"));
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

}