package controller.cashier.account;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/Cashier/Controller/Cashier/Print/GetRecentOffset")
public class GetRecentOffset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRecentOffset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		EncryptandDecrypt ec = new EncryptandDecrypt();
		Fullname fn = new Fullname();
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();

		Statement stmnt = null;
		Statement stmnt2 = null;
		try {
			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		sql = "SELECT Payment_Log_OR_Number,TIME_FORMAT(Payment_Log_Date_Added, '%h:%i %p') as gtime,TIME_FORMAT(Payment_Log_Date_Added, '%M %d, %Y') as gdate FROM `t_payment_log` WHERE Payment_Log_Display_Status = 'Active' and Payment_Log_Type = 'Offset' order by Payment_Log_ID desc limit 1";
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			JSONObject obj = new JSONObject();
			while(rs.next()){
				
				obj.put("date",  rs.getString("gdate"));
				obj.put("time", rs.getString("gtime") );				 
				obj.put("ornumber", rs.getString("Payment_Log_OR_Number"));		 
				 
				  
			}
			out.print(obj);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
