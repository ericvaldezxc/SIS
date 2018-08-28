package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfiguration {
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sis_9", "root", "");
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
		catch ( SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
