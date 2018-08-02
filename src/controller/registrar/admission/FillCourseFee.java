package controller.registrar.admission;

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
 * Servlet implementation class FillMandatoryFee
 */
@WebServlet("/Registrar/Controller/Registrar/Admission/FillCourseFee")
public class FillCourseFee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FillCourseFee() {
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

		String course = request.getParameter("course");
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		sql = "SELECT *,format(Course_Fee_Item_Amount,2) as amo FROM `r_course_fee` inner join r_course on Course_Fee_CourseID = Course_ID inner join r_course_fee_items on Course_Fee_Item_CourseFeeID = Course_Fee_ID   inner join r_fee on Fee_ID = Course_Fee_Item_FeeID  inner join r_academic_year on Course_Fee_AcademicYearID = Academic_Year_ID  where Academic_Year_Active_Flag = 'Present'  and Academic_Year_Display_Status = 'Active' and Fee_Display_Status = 'Active' and Course_Fee_Display_Status = 'Active' and Course_Fee_Item_Display_Status = 'Active' and Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"'  ";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		//out.print(sql);
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("amount", rs.getString("amo"));
				 obj.put("fee", ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description")));
				 arr.add(obj);
			      
			}
			out.print(arr);	
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
