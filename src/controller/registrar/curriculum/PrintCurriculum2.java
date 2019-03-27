package controller.registrar.curriculum;

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
@WebServlet("/Registrar/Controller/Registrar/Curriculum/PrintCurriculum2")
public class PrintCurriculum2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrintCurriculum2() {
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
		String course = request.getParameter("course");
		String curyear = request.getParameter("curyear");
		Fullname fn = new Fullname();
		
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		Statement stmnt2 = null;
		Statement stmnt3 = null;
		Statement stmnt4 = null;
		Statement stmnt5 = null;

		
		try {
			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
			stmnt3 = conn.createStatement();
			stmnt4 = conn.createStatement();
			stmnt5 = conn.createStatement();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		String yearlvl = "";
		String courid = "";
		String studaccid = "";
		try {
			PrintWriter out = response.getWriter();	
	
			sql = "SELECT *,Curriculum_CourseID,Curriculum_CurriculumYearID FROM r_curriculumitem inner join `r_curriculum` on  CurriculumItem_CurriculumID = Curriculum_ID inner join r_semester on Curriculum_SemesterID = Semester_ID where Curriculum_CourseID = (SELECT Course_ID FROM `r_course` where Course_Description = '"+ec.encrypt(ec.key, ec.initVector,  course)+"')  and Curriculum_CurriculumYearID = ( select CurriculumYear_ID from r_curriculumyear where CurriculumYear_Description = '"+ ec.encrypt(ec.key, ec.initVector,  curyear)+"' ) and CurriculumItem_Display_Status = 'Active' group by Curriculum_YearLevel ";
			//out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			
			String peryearlvl ="";
			String persem = "";
			String semid = "";

			JSONArray wholecurriculum = new JSONArray();
			
			while(rs.next()){
				courid = rs.getString("Curriculum_CourseID");
				curyear = rs.getString("Curriculum_CurriculumYearID");
				peryearlvl = rs.getString("Curriculum_YearLevel");
				String sql2 = "SELECT * FROM r_curriculumitem inner join `r_curriculum` on  CurriculumItem_CurriculumID = Curriculum_ID inner join r_semester on Curriculum_SemesterID = Semester_ID where Curriculum_CourseID = '"+courid+"' and Curriculum_CurriculumYearID = '"+curyear+"' and Curriculum_YearLevel = '"+peryearlvl+"' and CurriculumItem_Display_Status = 'Active' group by Semester_ID ";
				//out.print(sql2+"\n");
				ResultSet rs2 = stmnt2.executeQuery(sql2);
				while(rs2.next()){
					persem =  ec.decrypt(ec.key, ec.initVector,  rs2.getString("Semester_Description"));
					semid = rs2.getString("Semester_ID");
					String sql3 = "SELECT Subject_Lecture_Hours,Subject_Laboratory_Hours,Subject_ID,Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject as t1 ON CurriculumItem_SubjectID = Subject_ID  WHERE Curriculum_CourseID = '"+courid+"' and Curriculum_SemesterID = '"+semid+"' and Curriculum_YearLevel = '"+peryearlvl+"' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' order by (select count(*) from r_subject as er where er.Subject_Group = t1.Subject_ID) asc ";
					//out.print(sql3+"\n");
					JSONArray subjectcurholder = new JSONArray();
					ResultSet rs3 = stmnt3.executeQuery(sql3);
					while(rs3.next()){
						JSONObject subjectcur = new JSONObject();
						JSONArray grouplist = new JSONArray();
						JSONArray prereq = new JSONArray();
						subjectcur.put("code", ec.decrypt(ec.key, ec.initVector, rs3.getString("Subject_Code")));
						subjectcur.put("desc", ec.decrypt(ec.key, ec.initVector, rs3.getString("Subject_Description")));
						subjectcur.put("tuition", rs3.getString("Subject_Tuition_Hours"));
						subjectcur.put("units", rs3.getString("Subject_Credited_Units"));
						subjectcur.put("labhours", rs3.getString("Subject_Laboratory_Hours"));
						subjectcur.put("lechours", rs3.getString("Subject_Lecture_Hours"));
						
						
						String subid = rs3.getString("Subject_ID");
						
						
						String latcodeNew = ec.decrypt(ec.key, ec.initVector, rs3.getString("Subject_Code"));

						
						
						String subcode = "";
						String sql50 = "SELECT ifnull((select tbl3.Subject_Code from r_subject as tbl3 where Subject_ID = ifnull(CurriculumItem_prereq,'') ),'default') as res from r_curriculumitem  inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID where CurriculumItem_SubjectID = (SELECT T2.Subject_ID FROM r_subject AS T2 where T2.Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcodeNew)+"') and Curriculum_CourseID = " + courid + " and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` WHERE `CurriculumYear_Ative_Flag` = 'Active ') ";
//						out.print(sql50);
						ResultSet rs6 = stmnt4.executeQuery(sql50);
						while(rs6.next()){
							subcode = rs6.getString("res");
							if(subcode != "default")
								subcode = ec.decrypt(ec.key, ec.initVector, subcode);			
						}
						
						subjectcur.put("prerequisite",subcode);
//						out.print(subcode);
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
			out.print(wholecurriculum);
				
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
