package configuration;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.DBConfiguration;

public class GetActive {
	EncryptandDecrypt ec = new EncryptandDecrypt();
	DBConfiguration db = new DBConfiguration(); 
	Connection conn = db.getConnection();
	
	ResultSet rs = null;
	public String getAcadYear() throws SQLException {
		
		Statement stmnt = conn.createStatement();
		rs = stmnt.executeQuery("SELECT * FROM `r_academic_year` where Academic_Year_Active_Flag =  'Present' ");
		int  i = 0 ;
		String yearid = "";
		while(rs.next()){
			yearid = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));
			 
			
		}
		return yearid;
		
	}
}
