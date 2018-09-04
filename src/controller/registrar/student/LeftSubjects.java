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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.*;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/LeftSubjects")
public class LeftSubjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeftSubjects() {
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
//		String studentnumber = request.getParameter("stnum");
		String studentnumber = "2018-00001-CM-0";
		Fullname fn = new Fullname();
		
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
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
		String yearlvl = "";
		String courid = "";
		String curyear = "";
		
		try {
			sql = "SELECT * from t_student_account inner join r_student_profile on Student_Account_Student_Profile_ID  =  Student_Profile_ID  where Student_Account_Student_Number= '"+studentnumber+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				yearlvl = rs.getString("Student_Account_Year");
				courid = rs.getString("Student_Account_CourseID");
				curyear = rs.getString("Student_Account_CurriculumYearID");

				
			}
		
			sql = "SELECT * FROM r_curriculumitem inner join `r_curriculum` on  CurriculumItem_CurriculumID = Curriculum_ID inner join r_semester on Curriculum_SemesterID = Semester_ID where Curriculum_CourseID = '"+courid+"'  and Curriculum_CurriculumYearID = '"+curyear+"' and CurriculumItem_Display_Status = 'Active' group by Curriculum_YearLevel ";
			rs = stmnt.executeQuery(sql);
			String peryearlvl ="";
			String persem = "";
			String semid = "";

			PrintWriter out = response.getWriter();	
			JSONArray wholecurriculum = new JSONArray();
			
			while(rs.next()){
				peryearlvl = rs.getString("Curriculum_YearLevel");
				String sql2 = "SELECT * FROM r_curriculumitem inner join `r_curriculum` on  CurriculumItem_CurriculumID = Curriculum_ID inner join r_semester on Curriculum_SemesterID = Semester_ID where Curriculum_CourseID = '"+courid+"'  and Curriculum_CurriculumYearID = '"+curyear+"' and Curriculum_YearLevel = '"+peryearlvl+"' and CurriculumItem_Display_Status = 'Active' group by Semester_ID ";
//				out.print(sql2+"\n");
				ResultSet rs2 = stmnt2.executeQuery(sql2);
				while(rs2.next()){
					persem =  ec.decrypt(ec.key, ec.initVector,  rs2.getString("Semester_Description"));
					semid = rs2.getString("Semester_ID");
					String sql3 = "SELECT Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject as t1 ON CurriculumItem_SubjectID = Subject_ID  WHERE Curriculum_CourseID = '"+courid+"' and Curriculum_SemesterID = '"+semid+"' and Curriculum_YearLevel = '"+peryearlvl+"' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' order by (select count(*) from r_subject as er where er.Subject_Group = t1.Subject_ID) asc ";
					//out.print(sql3+"\n");
					JSONArray subjectcurholder = new JSONArray();
					ResultSet rs3 = stmnt3.executeQuery(sql3);
					while(rs3.next()){
						JSONObject subjectcur = new JSONObject();
						subjectcur.put("code", ec.decrypt(ec.key, ec.initVector, rs3.getString("Subject_Code")));
						subjectcur.put("desc", ec.decrypt(ec.key, ec.initVector, rs3.getString("Subject_Description")));
						subjectcur.put("tuition", rs3.getString("Subject_Tuition_Hours"));
						subjectcur.put("units", rs3.getString("Subject_Credited_Units"));

						subjectcurholder.add(subjectcur);
					
					}
					JSONObject curyearsem = new JSONObject();
					curyearsem.put("yearlvl", peryearlvl);
					curyearsem.put("semester", persem);
					curyearsem.put("subject", subjectcurholder);
					//out.print(curyearsem);
					wholecurriculum.add(curyearsem);
					
				}
					
				
			}
			out.print("\n"+wholecurriculum);
				
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
