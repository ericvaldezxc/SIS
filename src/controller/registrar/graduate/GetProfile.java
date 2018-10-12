package controller.registrar.graduate;

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
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class CurriculumViewItemController
 */
@WebServlet("/Registrar/Controller/Registrar/GraduatedStudents/GetProfile")
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
		response.setContentType("plain/text");
		EncryptandDecrypt ec = new EncryptandDecrypt();
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();

		String uname = request.getParameter("stnum");
		Statement stmnt = null;
		Statement stmnt2 = null;
		Statement stmnt3 = null;
		try {
			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
			stmnt3 = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	

		String fullname = "";	
		String fname = "";	
		String mname = "";	
		String lname = "";	
		try {
			//out.print(sql);
			sql = "SELECT *,year(Student_Account_Date_Added) as gety FROM `t_student_account` inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID where Student_Account_Student_Number = '"+uname+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			JSONObject obj = new JSONObject();
			while(rs.next()){
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				Fullname fn = new Fullname();
				fullname = fn.fullname(fname, mname, lname);
				obj.put("name", fullname);
				obj.put("studnum", uname);
				obj.put("year", rs.getString("gety"));
				obj.put("address", ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Address")));
					
				
			}
			out.print(obj);	

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		
//		 List<String> list = new ArrayList<String>();
//		    list.add("item1");
//		    list.add("item2");
//		    list.add("item3");	
//		    
//		    
	
	}

}
