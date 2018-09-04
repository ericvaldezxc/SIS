package controller.student.profile;

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
 * Servlet implementation class FillMandatoryFee
 */
@WebServlet("/Student/Controller/Student/Profile/GetProfile")
public class GetProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProfile() {
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
		String fullname = "";	
		String fname = "";	
		String mname = "";	
		String lname = "";	
		String sql = "";
		
		sql = "SELECT * FROM `t_student_account` inner join r_student_profile on Student_Profile_ID = Student_Account_Student_Profile_ID inner join r_section on Section_ID = Student_Account_SectionID inner join r_course on Course_ID = Student_Account_CourseID where Student_Account_Student_Number = '"+username+"' ";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				Fullname fn = new Fullname();
				fullname = fn.fullname(fname, mname, lname);
				JSONObject obj = new JSONObject();
				obj.put("fullname",fullname);
				obj.put("section", rs.getString("Section_Code"));				
				obj.put("yearlvl", rs.getString("Student_Account_Year"));				
				obj.put("status", rs.getString("Student_Account_Scholastic_Status"));		
				obj.put("studentnumber", rs.getString("Student_Account_Student_Number"));
				obj.put("course", ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description")));
				
				out.print(obj);
				
			}
			
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
