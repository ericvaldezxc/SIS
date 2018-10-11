package controller.student.registration;

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
import connection.DBConfiguration;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/Student/Controller/Student/Registration/GetBreakdownFee")
public class GetBreakdownFee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBreakdownFee() {
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


		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		
		String sql = "select *,format(Breakdown_Fee_Amount,2) as bamo from t_breakdown_fee where Breakdown_Fee_Student_Account_ID = (SELECT Student_Account_ID FROM `t_student_account` where Student_Account_Student_Number = '"+username+"' ) ";
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
//		out.print(sql);
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			JSONObject fee = new JSONObject();
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("desc", rs.getString("Breakdown_Fee_Description"));
				 obj.put("amount", rs.getString("bamo"));
				 arr.add(obj);
			      
			}
			String totamo = "";
			sql = "select format(Breakdown_Fee_Amount,2) as bamo from t_breakdown_fee where Breakdown_Fee_Student_Account_ID = (SELECT Student_Account_ID FROM `t_student_account` where Student_Account_Student_Number = '"+username+"' ) ";
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Breakdown_Fee_Description")));
				 obj.put("amount", ec.decrypt(ec.key, ec.initVector, rs.getString("bamo")));
				 arr.add(obj);
			      
			}
			
			fee.put("totamo", arr);
			fee.put("items", arr);
			
			out.print(arr);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
