package controller.registrar.student;

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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.*;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/GetEducationalAttainment")
public class GetEducationalAttainment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEducationalAttainment() {
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
		String studentnumber = request.getParameter("studentnumber");
		Fullname fn = new Fullname();
		
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
		String contactnum = "";
		String guardiannum = "";
		String dob = "";
		String pob = "";
		String gender = "";
		String emailaddress = "";
		String civil = "";
		String address = "";
		JSONArray arr = new JSONArray();
		try {
			sql = "SELECT * FROM `r_educational_attainment` inner join t_student_account on Student_Account_ID = Educational_Attainment_StudentAccountID  where Student_Account_Student_Number= '"+studentnumber+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			
				
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("row", rs.getString("Educational_Attainment_ID"));
				obj.put("school", rs.getString("Educational_Attainment_School"));
				obj.put("lvl", rs.getString("Educational_Attainment_School_Level"));
				obj.put("address", rs.getString("Educational_Attainment_Address"));
				obj.put("year", rs.getString("Educational_Attainment_Inclusive_Year"));
				obj.put("course", rs.getString("Educational_Attainment_School_Course"));
				arr.add(obj);
			}
			PrintWriter out = response.getWriter();	
			
			out.print(arr);
				
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
