package controller.registrar.preenrollment;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class FeeController
 */
@WebServlet("/Registrar/Controller/Registrar/PreEnrollment/CourseFeeItemView")
public class CourseFeeViewtem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseFeeViewtem() {
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

		String latcode = request.getParameter("latcode");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";

		sql = "SELECT *,Course_Fee_Item_Amount as amo FROM `r_course_fee_items` INNER JOIN r_fee ON Course_Fee_Item_FeeID = Fee_ID INNER JOIN r_course_fee ON Course_Fee_ID = Course_Fee_Item_CourseFeeID WHERE Course_Fee_Item_Display_Status = 'Active' and Course_Fee_ID = '"+latcode+"' ";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("code",  ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Code")) );
				 obj.put("amount",  rs.getString("amo"));
				 arr.add(obj);
			      
			}
			out.print(arr);	

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
