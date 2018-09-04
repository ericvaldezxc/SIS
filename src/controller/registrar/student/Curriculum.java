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
@WebServlet("/Registrar/Controller/Registrar/Student/Curriculum")
public class Curriculum extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Curriculum() {
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
		String curyear = "";
		String studaccid = "";
		try {
			sql = "SELECT * from t_student_account inner join r_student_profile on Student_Account_Student_Profile_ID  =  Student_Profile_ID  where Student_Account_Student_Number= '"+studentnumber+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				yearlvl = rs.getString("Student_Account_Year");
				courid = rs.getString("Student_Account_CourseID");
				curyear = rs.getString("Student_Account_CurriculumYearID");
				studaccid = rs.getString("Student_Account_ID");
				
			}
		
			sql = "SELECT * FROM r_curriculumitem inner join `r_curriculum` on  CurriculumItem_CurriculumID = Curriculum_ID inner join r_semester on Curriculum_SemesterID = Semester_ID where Curriculum_CourseID = '"+courid+"' and Curriculum_CurriculumYearID = '"+curyear+"' and CurriculumItem_Display_Status = 'Active' group by Curriculum_YearLevel ";
			rs = stmnt.executeQuery(sql);
			String peryearlvl ="";
			String persem = "";
			String semid = "";

			PrintWriter out = response.getWriter();	
			JSONArray wholecurriculum = new JSONArray();
			
			while(rs.next()){
				peryearlvl = rs.getString("Curriculum_YearLevel");
				String sql2 = "SELECT * FROM r_curriculumitem inner join `r_curriculum` on  CurriculumItem_CurriculumID = Curriculum_ID inner join r_semester on Curriculum_SemesterID = Semester_ID where Curriculum_CourseID = '"+courid+"' and Curriculum_CurriculumYearID = '"+curyear+"' and Curriculum_YearLevel = '"+peryearlvl+"' and CurriculumItem_Display_Status = 'Active' group by Semester_ID ";
//				out.print(sql2+"\n");
				ResultSet rs2 = stmnt2.executeQuery(sql2);
				while(rs2.next()){
					persem =  ec.decrypt(ec.key, ec.initVector,  rs2.getString("Semester_Description"));
					semid = rs2.getString("Semester_ID");
					String sql3 = "SELECT Subject_ID,Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject as t1 ON CurriculumItem_SubjectID = Subject_ID  WHERE Curriculum_CourseID = '"+courid+"' and Curriculum_SemesterID = '"+semid+"' and Curriculum_YearLevel = '"+peryearlvl+"' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' order by (select count(*) from r_subject as er where er.Subject_Group = t1.Subject_ID) asc ";
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
						
						String subid = rs3.getString("Subject_ID");
						String sql4 = "SELECT * FROM r_prerequisite inner join r_subject on Prerequisite_Prequisite_SubjectID = Subject_ID where Prerequisite_Main_SubjectID = '"+subid+"' and Prerequisite_Display_Status = 'Active' ";
						ResultSet rs4 = stmnt4.executeQuery(sql4);
						while(rs4.next()){
							prereq.add(ec.decrypt(ec.key, ec.initVector, rs4.getString("Subject_Code")));
							 
							
						}
						subjectcur.put("prerequisite",prereq);
						
						sql4 = "SELECT case when if(Students_Grade_Grade is null,0,Students_Grade_Grade) not in (if(Students_Grade_Grade is null,'0','D''INC''not S')) then 'Cleared' else 'Not Cleared' end as stat FROM `t_student_taken_curriculum_subject` left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID WHERE `Student_Taken_Curriculum_Subject_StudentAccountID` = '"+studaccid+"' and Student_Taken_Curriculum_Subject_SubjectID = '"+subid+"' ";
						rs4 = stmnt4.executeQuery(sql4);
						String status = "Not Cleared";
						while(rs4.next()){
							status = rs4.getString("stat");
							
						}
						subjectcur.put("status", status);							 

						
						sql4 = "SELECT * FROM `r_subject` AS T1 WHERE T1.Subject_Group = (SELECT T2.Subject_ID FROM r_subject AS T2 where T2.Subject_Code = '"+rs3.getString("Subject_Code")+"' )";
						rs4 = stmnt4.executeQuery(sql4);
						while(rs4.next()){
							JSONObject group = new JSONObject();
							group.put("code", ec.decrypt(ec.key, ec.initVector, rs4.getString("Subject_Code")));
							group.put("desc", ec.decrypt(ec.key, ec.initVector, rs4.getString("Subject_Description")));
							group.put("units", rs4.getString("Subject_Credited_Units"));
							group.put("tuition", rs4.getString("Subject_Tuition_Hours"));
							subid = rs4.getString("Subject_ID");
							
							String sql5 = "SELECT * FROM r_prerequisite inner join r_subject on Prerequisite_Prequisite_SubjectID = Subject_ID where Prerequisite_Main_SubjectID = '"+subid+"' and Prerequisite_Display_Status = 'Active' ";
							ResultSet rs5 = stmnt5.executeQuery(sql5);
							JSONArray grpprereq = new JSONArray();
							while(rs5.next()){
								grpprereq.add(ec.decrypt(ec.key, ec.initVector, rs5.getString("Subject_Code")));
								 
								
							}
							group.put("prerequisite", grpprereq);
							
							sql5 = "SELECT case when if(Students_Grade_Grade is null,0,Students_Grade_Grade) not in (if(Students_Grade_Grade is null,'0','D''INC''not S')) then 'Cleared' else 'Not Cleared' end as stat FROM `t_student_taken_curriculum_subject` left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID WHERE `Student_Taken_Curriculum_Subject_StudentAccountID` = '"+studaccid+"' and Student_Taken_Curriculum_Subject_SubjectID = '"+subid+"' ";
							rs5 = stmnt5.executeQuery(sql5);
							status = "Not Cleared";
							while(rs5.next()){
								status = rs5.getString("stat");
								
							}
							group.put("status", status);

							
							grouplist.add(group);
							 
							
						}
						subjectcur.put("group", grouplist);
						
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
