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
@WebServlet("/Registrar/Controller/Registrar/Student/StudentSchedule")
public class StudentSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentSchedule() {
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
		String studentnumber = request.getParameter("stnum");
		String curcode = "";
		String section = "";
		String yearlvl = "";
		String semester = "";
		String scholastic = "";
		String curi = "";
		Fullname fn = new Fullname();
		
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		Statement stmnt2 = null;
		Statement stmnt3 = null;
		Statement stmnt4 = null;
		Statement stmnt5 = null;
		Statement stmnt6 = null;
		Statement stmnt7 = null;
		
		try {
			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
			stmnt3 = conn.createStatement();
			stmnt4 = conn.createStatement();
			stmnt5 = conn.createStatement();
			stmnt6 = conn.createStatement();
			stmnt7 = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		String sql2 = "";
		String sql3 = "";
		String sql4 = "";
		String sql5 = "";
		String sql6 = "";
		String sql7 = "";

		try {
			sql = "SELECT Student_Account_CurriculumYearID,Student_Account_Scholastic_Status,Student_Account_Year,Student_Account_CourseID,Student_Account_SectionID,Student_Account_CampusID,(select Semester_ID from r_semester where Semester_Active_Flag = 'Active' and Semester_Display_Status = 'Active' )  as sem from t_student_account inner join r_student_profile on Student_Account_Student_Profile_ID  =  Student_Profile_ID where Student_Account_Student_Number= '"+studentnumber+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				scholastic = rs.getString("Student_Account_Scholastic_Status");
				curcode = rs.getString("Student_Account_CourseID");
				section = rs.getString("Student_Account_SectionID");
				yearlvl = rs.getString("Student_Account_Year");
				semester = rs.getString("sem");
				curi = rs.getString("Student_Account_CurriculumYearID");
							
				
				
			}
			
			if(scholastic.equals("Regular")) {
				sql = "SELECT CurriculumItem_ID,Subject_ID,Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours,(SELECT COUNT(*) FROM r_subject AS T2 WHERE T2.Subject_Group = t1.Subject_ID) as grp FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject as t1 ON CurriculumItem_SubjectID = Subject_ID WHERE Curriculum_CourseID = '"+curcode+"' and Curriculum_SemesterID = '"+  semester+"' and Curriculum_YearLevel = '"+yearlvl+"' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' and Curriculum_CurriculumYearID = '"+ curi+"' group by CurriculumItem_ID order by Subject_Type  asc";
				JSONArray arr = new JSONArray();
				JSONArray grouplist = new JSONArray();
				JSONArray schedlist = new JSONArray();
				JSONArray schedlist2 = new JSONArray();
				PrintWriter out = response.getWriter();	
				//out.print(sql+"\n");
				
				rs = stmnt.executeQuery(sql);
				ResultSet rs2,rs3,rs4,rs5,rs6,rs7;

				while(rs.next()){
					 JSONObject obj = new JSONObject();
					 JSONObject group = new JSONObject();
					 JSONArray groupprof = new JSONArray();
					 JSONObject sched2 = new JSONObject();
					 grouplist = new JSONArray();
					 schedlist = new JSONArray();
					 schedlist2 = new JSONArray();
					 
					 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
					 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));
					 obj.put("tuition", rs.getString("Subject_Tuition_Hours"));
					 obj.put("id", rs.getString("CurriculumItem_ID"));	
					 obj.put("units", rs.getString("Subject_Credited_Units"));
					 
					 String id = rs.getString("CurriculumItem_ID");
					 String mcou = "";
					 String subjectid = rs.getString("Subject_ID");
					 String grp =  rs.getString("grp");
					 sql2 = "SELECT count(*) as cou FROM `t_schedule` left join r_professor on Schedule_ProfessorID = Professor_ID  WHERE Schedule_SectionID =  '"+section+"' and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present') ";
					 rs2 = stmnt2.executeQuery(sql2);
	  				 //out.print(grp+"\n");
					 
					 while(rs2.next()){
						 mcou = rs2.getString("cou");
						 
					 }

					 if(mcou.equals("0")) {
						 obj.put("prof", "Not Set");
						 obj.put("profcode", "Not Set");
						 
					 }else {
						 sql3 = "SELECT ifnull(Professor_Code,0) as pcode,Professor_FirstName,Professor_MiddleName,Professor_LastName FROM `t_schedule` left join r_professor on Schedule_ProfessorID = Professor_ID left join r_curriculumitem on Schedule_CurriculumItemID =  CurriculumItem_ID  WHERE Schedule_SectionID = '"+section+"' and CurriculumItem_SubjectID = '"+subjectid+"' and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present') ";
						 rs3 = stmnt3.executeQuery(sql3);
						 String Fullname = "";
						 int countprof = 0;
						 while(rs3.next()){
							 if(rs3.getString("pcode").equals("0")) {
								 obj.put("prof", "Not Set");
								 obj.put("profcode", "Not Set");
								 
							 }else {
								 Fullname = fn.fullname(ec.decrypt(ec.key, ec.initVector, rs3.getString("Professor_FirstName")),ec.decrypt(ec.key, ec.initVector, rs3.getString("Professor_MiddleName")),ec.decrypt(ec.key, ec.initVector, rs3.getString("Professor_LastName")));
								 String profcode = rs3.getString("pcode");
								 obj.put("prof", Fullname);
								 obj.put("profcode", profcode);
								 
							 }
							 countprof++;
						 }
						 if(countprof == 0) {
							 obj.put("prof", "Not Set");
							 obj.put("profcode", "Not Set");
						 }
					 }
					 
					 

					 
					 if(grp.equals("0")) {
						 JSONArray schedulelist = new JSONArray();
						 JSONObject schedule = new JSONObject();
						 sql3 = "SELECT IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA') AS SCHED,IFNULL(Room_Description,'TBA') AS ROOM FROM `t_schedule_items` INNER JOIN t_schedule ON Schedule_ID = Schedule_Items_ScheduleID  left join r_room on Schedule_Items_RoomID = Room_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID    WHERE Schedule_SectionID =  '"+section+"' and Schedule_Items_Display_Status = 'Active'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present')  and CurriculumItem_SubjectID = "+subjectid;
						 //out.print(sql3+"\n");
						 rs3 = stmnt3.executeQuery(sql3);
						 int schedcount = 0;
						 while(rs3.next()){
							 schedule = new JSONObject();
							 schedule.put("timesched", rs3.getString("SCHED"));
							 if(!rs3.getString("ROOM").equals("TBA"))
								 schedule.put("room",ec.decrypt(ec.key, ec.initVector, rs3.getString("ROOM")) );
							 else
								 schedule.put("room","TBA" );
							 schedulelist.add(schedule);
							 
							 schedcount++;
						 }
						 if(schedcount == 0) {
							 schedule = new JSONObject();
							 schedule.put("timesched", "TBA");
							 schedule.put("room", "TBA");
							 schedulelist.add(schedule);
							 
						 }
						 
						 
						 
						 obj.put("schedule", schedulelist);
						 
					 }else {
						 sql3 = "SELECT Subject_ID FROM r_subject WHERE Subject_Group = '"+subjectid+"'";
						 rs3 = stmnt3.executeQuery(sql3);
						 while(rs3.next()){
							 String groupid = rs3.getString("Subject_ID");
							 
							 sql4 = "SELECT * FROM r_subject WHERE Subject_ID = '"+groupid+"'";
							 //out.print(sql4+"\n");
							 rs4 = stmnt4.executeQuery(sql4);
							 String Fullname = "";
							 while(rs4.next()){
								 group = new JSONObject();
								 group.put("id", ec.decrypt(ec.key, ec.initVector, rs4.getString("Subject_ID")));
								 group.put("code", ec.decrypt(ec.key, ec.initVector, rs4.getString("Subject_Code")));
								 group.put("desc", ec.decrypt(ec.key, ec.initVector, rs4.getString("Subject_Description")));
								 group.put("tuition", rs4.getString("Subject_Tuition_Hours"));
								 group.put("units", rs4.getString("Subject_Credited_Units"));
								 
								 sql5 = "SELECT ifnull(Professor_Code,0) as pcode,Professor_FirstName,Professor_MiddleName,Professor_LastName FROM `t_schedule` left join r_professor on Schedule_ProfessorID = Professor_ID left join r_curriculumitem on Schedule_CurriculumItemID =  CurriculumItem_ID right join r_subject on CurriculumItem_SubjectID = Subject_Group WHERE Schedule_SectionID =  '"+section+"'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present')   and Schedule_ChildrenID = '"+groupid+"'";
//								 out.print(sql5+"\n");
								 rs5 = stmnt5.executeQuery(sql5);
								 Fullname = "";
								 int countprof = 0;
								 while(rs5.next()){
									 if(rs5.getString("pcode").equals("0")) {
										 group.put("prof", "Not Set");
										 group.put("profcode", "Not Set");
										 
									 }else {
										 Fullname = fn.fullname(ec.decrypt(ec.key, ec.initVector, rs5.getString("Professor_FirstName")),ec.decrypt(ec.key, ec.initVector, rs5.getString("Professor_MiddleName")),ec.decrypt(ec.key, ec.initVector, rs5.getString("Professor_LastName")));
										 String profcode = rs5.getString("pcode");
										 group.put("prof", Fullname);
										 group.put("profcode", profcode);
										 
									 }
									 countprof++;
								 }
								 if(countprof == 0) {
									 group.put("prof", "Not Set");
									 group.put("profcode", "Not Set");
								 }
								 
								 
								 JSONArray schedulelist = new JSONArray();
								 JSONObject schedule = new JSONObject();
								 sql6 = "SELECT IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA') AS SCHED,IFNULL(Room_Description,'TBA') AS ROOM FROM `t_schedule_items` INNER JOIN t_schedule ON Schedule_ID = Schedule_Items_ScheduleID  left join r_room on Schedule_Items_RoomID = Room_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID    WHERE Schedule_SectionID = '"+section+"' and Schedule_Items_Display_Status = 'Active'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present')  and Schedule_ChildrenID = "+groupid;
								 //out.print(sql3+"\n");
								 rs6 = stmnt6.executeQuery(sql6);
								 int schedcount = 0;
								 while(rs6.next()){
									 schedule = new JSONObject();
									 schedule.put("timesched", rs6.getString("SCHED"));
									 if(!rs6.getString("ROOM").equals("TBA"))
										 schedule.put("room",ec.decrypt(ec.key, ec.initVector, rs6.getString("ROOM")) );
									 else
										 schedule.put("room","TBA" );
									 schedulelist.add(schedule);
									 
									 schedcount++;
								 }
								 if(schedcount == 0) {
									 schedule = new JSONObject();
									 schedule.put("timesched", "TBA");
									 schedule.put("room", "TBA");
									 schedulelist.add(schedule);
									 
								 }
								 group.put("schedule",schedulelist);
								 
								 groupprof.add(group);
								 
								 
							 }
							
							 
						 }
						 
						 obj.put("group", groupprof);
						 
					 }
					 arr.add(obj);
					 
				}
							 
				
				out.print(arr);	
				
			}
			
			
			
				 

			conn.close();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
