package configuration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import connection.DBConfiguration;

/**
 * Servlet implementation class FillCourse
 */
@WebServlet("/FillRoom")
public class FillRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FillRoom() {
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
		String Campus = request.getParameter("Campus");
		DBConfiguration db = new DBConfiguration(); 
		EncryptandDecrypt ec = new EncryptandDecrypt();
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		JSONArray arr = new JSONArray();
		
		PrintWriter out = response.getWriter();	
		try {
			String sql = "";

			sql = "Select * from r_room inner join r_campus on Room_CampusID = Campus_ID where Campus_Display_Status = 'Active' and Room_Display_Status = 'Active' and Campus_Code = '"+ec.encrypt(ec.key, ec.initVector, Campus)+"' ";
			//out.print(sql);
			stmnt = conn.createStatement();
			String convertedAmount = "";
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Room_Code")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Room_Description")));
				 arr.add(obj);
			}

			out.print(arr);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
