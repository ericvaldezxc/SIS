package controller.registrar.application;

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
 * Servlet implementation class GetDocument
 */
@WebServlet("/Registrar/Controller/Registrar/Application/TakenSubject")
public class TakenSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TakenSubject() {
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
		String studnum = request.getParameter("studnum");
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		sql = "SELECT * FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Account_ID = Student_Taken_Curriculum_Subject_StudentAccountID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join  r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID left join r_section on  Student_Taken_Curriculum_Subject_SectionID = Section_ID where Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Account_Student_Number = '"+studnum+"' ";
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));				 
				obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));				 
				obj.put("section",ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description")));				 
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
