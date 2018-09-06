package controller.registrar.admission;

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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Admission/CurriculumItems")
public class CurriculumItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumItems() {
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
		String curcode = request.getParameter("curcode");
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
		String sql2 = "";
//bagoo baguhin		sql = "SELECT Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject as t1 ON CurriculumItem_SubjectID = Subject_ID  WHERE Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"') and Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Active_Flag = 'Active') and Curriculum_YearLevel = 'First Year' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' order by (select count(*) from r_subject as er where er.Subject_Group = t1.Subject_ID) asc ";
		sql = "SELECT Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject as t1 ON CurriculumItem_SubjectID = Subject_ID  WHERE Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"') and Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Active_Flag = 'Active') and Curriculum_YearLevel = 'First Year' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' order by (select count(*) from r_subject as er where er.Subject_Group = t1.Subject_ID) asc ";
		
		JSONArray arr = new JSONArray();
		JSONArray grouplist = new JSONArray();
		PrintWriter out = response.getWriter();	
//		out.print(sql);
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			ResultSet rs2;

			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 JSONObject group = new JSONObject();
				 grouplist = new JSONArray();

				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));
				 obj.put("tuition", rs.getString("Subject_Tuition_Hours"));
				 obj.put("units", rs.getString("Subject_Credited_Units"));
				 		
				 
				 sql2 = "SELECT * FROM `r_subject` AS T1 WHERE T1.Subject_Group = (SELECT T2.Subject_ID FROM r_subject AS T2 where T2.Subject_Code = '"+rs.getString("Subject_Code")+"' )";
				 rs2 = stmnt2.executeQuery(sql2);
				 while(rs2.next()){
					 group = new JSONObject();
					 group.put("code", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code")));
					 group.put("desc", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Description")));
					 group.put("units", rs2.getString("Subject_Credited_Units"));
					 group.put("tuition", rs.getString("Subject_Tuition_Hours"));
					 grouplist.add(group);
					 
					 
				 }
				 obj.put("group", grouplist);
				 
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
