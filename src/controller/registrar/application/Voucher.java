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
@WebServlet("/Registrar/Controller/Registrar/Application/Voucher")
public class Voucher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Voucher() {
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
		
		sql = "select Student_Account_Student_Profile_ID,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,Student_Account_Year,Course_Description,(select Semester_Description from r_semester where Semester_Active_Flag = 'Active') as sem,(SELECT Academic_Year_Description FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present') as year from t_student_account inner join r_course on Student_Account_CourseID = Course_ID  inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID order by Student_Account_Student_Profile_ID desc limit 1 ";
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			JSONObject obj = new JSONObject();
			while(rs.next()){
				String fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				String mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				String lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				String fullname = fn.fullname(fname, mname, lname);
				String studnum = rs.getString("Student_Account_Student_Number");
				obj.put("accnum",  studnum);
				obj.put("name", fullname );				 
				obj.put("year", ec.decrypt(ec.key, ec.initVector, rs.getString("year")));				 
				obj.put("course",ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description")));				 
				obj.put("sem",  ec.decrypt(ec.key, ec.initVector, rs.getString("sem")));				 
				String sql2 = "SELECT * FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Account_ID = Student_Taken_Curriculum_Subject_StudentAccountID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join  r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID left join r_section on  Student_Taken_Curriculum_Subject_SectionID = Section_ID where Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Account_Student_Number = '"+studnum+"'";
				JSONObject obj2 = new JSONObject();
				JSONArray arr2 = new JSONArray();
				ResultSet rs2 = stmnt2.executeQuery(sql2);
//				out.print(sql2+"\n");
				while(rs2.next()){
					obj2.put("code", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code")));				 
					obj2.put("desc", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Description")));				 
					obj2.put("section",rs2.getString("Section_Code"));				 
					arr2.add(obj2);
					
				}
				obj.put("subj",  arr2);				 
				  
			}
			arr.add(obj);
			out.print(arr);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
