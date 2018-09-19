package controller.registrar.student;

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
import configuration.YearLevelUp;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/ShiftCurriculumItems")
public class ShiftCurriculumItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShiftCurriculumItem() {
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
		course =  ec.encrypt(ec.key, ec.initVector,course);
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		YearLevelUp ylu = new YearLevelUp();
		Statement stmnt = null;
		Statement stmnt2 = null;
		Statement stmnt3 = null;
		Statement stmnt4 = null;
		
		try {
			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
			stmnt3 = conn.createStatement();
			stmnt4 = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		String sql2 = "";
		
		JSONArray arr = new JSONArray();
		JSONArray grouplist = new JSONArray();
		JSONArray sched = new JSONArray();
		JSONArray schedlist = new JSONArray();
		JSONArray schedlist2 = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		try {
		
		
			
			String sem = "";
			ResultSet rs = stmnt.executeQuery("SELECT Semester_Description FROM `r_semester` where Semester_Active_Flag = 'Active' ");
			while(rs.next())
				sem = rs.getString("Semester_Description");
			sem = ec.decrypt(ec.key, ec.initVector, sem);
			
			
			sql = "SELECT *,(if((SELECT count(*) FROM `r_prerequisite` where Prerequisite_Main_SubjectID = Subject_ID)=0,'Yes',(if((SELECT Prerequisite_Prequisite_SubjectID FROM `r_prerequisite` where Prerequisite_Main_SubjectID = Subject_ID and Prerequisite_Display_Status = 'Active') in ((SELECT Student_Taken_Curriculum_Subject_SubjectID FROM t_student_account left join t_student_taken_curriculum_subject on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID  = Student_Taken_Curriculum_Subject_ID WHERE Curriculum_CourseID = (SELECT Course_ID FROM `r_course` WHERE Course_Code = '"+course+"') and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and CASE WHEN ifnull(Students_Grade_Grade,0) = '5.00' OR ifnull(Students_Grade_Grade,0) = 'I'  OR ifnull(Students_Grade_Grade,0) = 'Not S'  OR ifnull(Students_Grade_Grade,0) = 'D' OR ifnull(Students_Grade_Grade,0) = '0' THEN 'F' ELSE 'P' END = 'P' )) ,'Yes','No' ) ))) as tstat,(if(Subject_ID in ((SELECT Student_Taken_Curriculum_Subject_SubjectID FROM t_student_account left join t_student_taken_curriculum_subject on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID  = Student_Taken_Curriculum_Subject_ID WHERE Curriculum_CourseID = (SELECT Course_ID FROM `r_course` WHERE Course_Code = '"+course+"') and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and CASE WHEN ifnull(Students_Grade_Grade,0) = '5.00' OR ifnull(Students_Grade_Grade,0) = 'I'  OR ifnull(Students_Grade_Grade,0) = 'Not S'  OR ifnull(Students_Grade_Grade,0) = 'D' OR ifnull(Students_Grade_Grade,0) = '0' THEN 'F' ELSE 'P' END = 'P' )) ,'Yes','No' ) ) as fstat FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject as t1 ON CurriculumItem_SubjectID = Subject_ID WHERE Curriculum_CourseID = '"+course+"' and Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Active_Flag = 'Active') and Curriculum_YearLevel = 'First Year' and CurriculumItem_Display_Status = 'Active' and CurriculumYear_ID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` WHERE CurriculumYear_Ative_Flag = 'Active') order by (select count(*) from r_subject as er where er.Subject_Group = t1.Subject_ID) asc ";
			out.print(sql+"\n");
			rs = stmnt.executeQuery(sql);
			ResultSet rs2,rs3,rs4;
			

			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 JSONObject group = new JSONObject();
				 JSONObject section = new JSONObject();
				 JSONObject schedule = new JSONObject();
				 JSONObject section2 = new JSONObject();
				 JSONObject schedule2 = new JSONObject();
				 sched = new JSONArray();
				 grouplist = new JSONArray();

				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));
				 //out.print(sql2+"\n");
				 obj.put("tuition", rs.getString("Subject_Tuition_Hours"));
				 obj.put("lec", rs.getString("Subject_Lecture_Hours"));
				 obj.put("lab", rs.getString("Subject_Laboratory_Hours"));
				 obj.put("units", rs.getString("Subject_Credited_Units"));
				 if(rs.getString("tstat").equals("Yes")) {
					 if(rs.getString("fstat").equals("No")) {
						 obj.put("stat", rs.getString("tstat"));
					 }
					 else {					 
						 obj.put("stat", "Taken");
					 }
					
					 
				 }else {	
					 obj.put("stat", rs.getString("tstat"));
				 }
				 String subid = rs.getString("Subject_ID");
				 
				 String acadyear = "";
				
				rs2 = stmnt2.executeQuery("SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present' ");
				while(rs2.next())
					acadyear = rs2.getString("Academic_Year_ID");
			 
				 
				 
				 sql2 = "SELECT Section_Code,Schedule_ID from r_curriculumitem inner join t_schedule on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  inner join r_section on Schedule_SectionID = Section_ID where Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` where CurriculumYear_Ative_Flag = 'Active' ) and Curriculum_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Schedule_AcademicYearID = '"+acadyear+"' and Schedule_Display_Status = 'Active' and CurriculumItem_SubjectID = '"+subid+"' and CurriculumItem_Display_Status = 'Active'  ";
				 rs2 = stmnt2.executeQuery(sql2);
				 //out.print(sql2+"\n");
				 String schedid = "";
				 String sec= "";
				 while(rs2.next()){
					 schedlist = new JSONArray();
					 section = new JSONObject();
					 section.put("section", rs2.getString("Section_Code"));
					 sec = rs2.getString("Section_Code");
					 schedid = rs2.getString("Schedule_ID");
// eto bago baguhn					 String sql3 = "SELECT Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%H:%i') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%H:%i') AS tend,IFNULL(Room_Code,'TBA') AS ROOM  FROM `t_schedule_items` left join r_room on Room_ID = Schedule_Items_RoomID   WHERE Schedule_Items_Display_Status = 'Active' and Schedule_Items_ScheduleID = '"+schedid+"'";
					 String sql3 = "SELECT Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p') AS tend,IFNULL(Room_Code,'TBA') AS ROOM  FROM `t_schedule_items` left join r_room on Room_ID = Schedule_Items_RoomID   WHERE Schedule_Items_Display_Status = 'Active' and Schedule_Items_ScheduleID = '"+schedid+"'";
					 //out.print(sql3+"\n");
					 rs3 = stmnt3.executeQuery(sql3);
					 while(rs3.next()){
						 schedule = new JSONObject();
//						 schedule.put("section", rs2.getString("Section_Code"));
						 String day =  rs3.getString("Schedule_Items_Date");
						 String tstart = rs3.getString("tstart");
						 String tend =  rs3.getString("tend");
						 String room = "";
						 if(!rs3.getString("ROOM").equals("TBA"))
							 room = ec.decrypt(ec.key, ec.initVector, rs3.getString("ROOM")) ;
						 else
							 room = "TBA" ;
						 
						 schedule.put("schedule", day + " "  + tstart + " " + tend +" "+ room );
						 schedlist.add(schedule);

					 }
					 section.put("sched", schedlist);
					 
					 sched.add(section);
					 
				 }
				 obj.put("section", sched);
				 
				 sql2 = "SELECT *,(if((SELECT count(*) FROM `r_prerequisite` where Prerequisite_Main_SubjectID = Subject_ID)=0,'Yes',(if((SELECT Prerequisite_Prequisite_SubjectID FROM `r_prerequisite` where Prerequisite_Main_SubjectID = Subject_ID and Prerequisite_Display_Status = 'Active') in ((SELECT Student_Taken_Curriculum_Subject_SubjectID FROM t_student_account left join t_student_taken_curriculum_subject on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID  = Student_Taken_Curriculum_Subject_ID WHERE Curriculum_CourseID = (SELECT Course_ID FROM `r_course` WHERE Course_Code = '"+course+"') and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and CASE WHEN ifnull(Students_Grade_Grade,0) = '5.00' OR ifnull(Students_Grade_Grade,0) = 'I'  OR ifnull(Students_Grade_Grade,0) = 'Not S'  OR ifnull(Students_Grade_Grade,0) = 'D' OR ifnull(Students_Grade_Grade,0) = '0' THEN 'F' ELSE 'P' END = 'P' )) ,'Yes','No' ) ))) as tstat,(if(Subject_ID in ((SELECT Student_Taken_Curriculum_Subject_SubjectID FROM t_student_account left join t_student_taken_curriculum_subject on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID  = Student_Taken_Curriculum_Subject_ID WHERE Curriculum_CourseID = (SELECT Course_ID FROM `r_course` WHERE Course_Code = '"+course+"') and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and CASE WHEN ifnull(Students_Grade_Grade,0) = '5.00' OR ifnull(Students_Grade_Grade,0) = 'I'  OR ifnull(Students_Grade_Grade,0) = 'Not S'  OR ifnull(Students_Grade_Grade,0) = 'D' OR ifnull(Students_Grade_Grade,0) = '0' THEN 'F' ELSE 'P' END = 'P' )) ,'Yes','No' ) ) as fstat FROM `r_subject` AS T1 WHERE T1.Subject_Group = (SELECT T2.Subject_ID FROM r_subject AS T2 where T2.Subject_Code = '"+rs.getString("Subject_Code")+"' )";
				 //out.print(sql2+"\n");
				 rs2 = stmnt2.executeQuery(sql2);
				 
				 while(rs2.next()){
					 group = new JSONObject();
					 group.put("code", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code")));
					 group.put("desc", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Description")));
					 group.put("units", rs2.getString("Subject_Credited_Units"));
					 group.put("lec", rs2.getString("Subject_Lecture_Hours"));
					 group.put("lab", rs2.getString("Subject_Laboratory_Hours"));
					 group.put("tuition", rs2.getString("Subject_Tuition_Hours"));
//					 group.put("stat", rs2.getString("tstat"));
					 if(rs2.getString("tstat").equals("Yes")) {
						 if(rs2.getString("fstat").equals("No")) {
							 group.put("stat", rs2.getString("tstat"));
						 }
						 else {					 
							 group.put("stat", "Taken");
						 }
						
						 
					 }else {	
						 group.put("stat", rs2.getString("tstat"));
					 }
					 
					 
					 
					 String subid2 = rs2.getString("Subject_ID");
				
					 String sql3 = "SELECT Section_Code,Schedule_ID from r_curriculumitem inner join t_schedule on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  inner join r_section on Schedule_SectionID = Section_ID inner join r_subject on Subject_Group =  CurriculumItem_SubjectID  where Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` where CurriculumYear_Ative_Flag = 'Active' ) and Curriculum_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Schedule_AcademicYearID = '"+acadyear+"' and Schedule_Display_Status = 'Active' and CurriculumItem_SubjectID = '"+subid+"' and CurriculumItem_Display_Status = 'Active' and Schedule_ChildrenID = '"+subid2+"'  group by Section_Code ";
					 //out.print(sql3+"\n");
					 schedlist2 = new JSONArray();
					 section2 = new JSONObject();
					 rs3 = stmnt3.executeQuery(sql3);
					 sec = "";
					 schedule2 = new JSONObject();
					 JSONArray finalsched = new JSONArray();
					 while(rs3.next()){
						 JSONObject schedholder = new JSONObject();
						 schedule2 = new JSONObject();
						 schedid = rs3.getString("Schedule_ID");
						 String sql4 = "SELECT Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%H:%i') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%H:%i') AS tend,IFNULL(Room_Code,'TBA') AS ROOM  FROM `t_schedule_items` inner join t_schedule on Schedule_ID = Schedule_Items_ScheduleID left join r_room on Room_ID = Schedule_Items_RoomID inner join r_section on Schedule_SectionID = Section_ID  WHERE Schedule_Items_Display_Status = 'Active' and Schedule_Items_ScheduleID = '"+schedid+"' and Schedule_ChildrenID = '"+subid2+"' ";
						 rs4 = stmnt4.executeQuery(sql4);
						 JSONArray grpsched = new JSONArray();
						 while(rs4.next()){
							 String day =  rs4.getString("Schedule_Items_Date");
							 String tstart = rs4.getString("tstart");
							 String tend =  rs4.getString("tend");
							 String room = "";
							 if(!rs4.getString("ROOM").equals("TBA"))
								 room = ec.decrypt(ec.key, ec.initVector, rs4.getString("ROOM")) ;
							 else
								 room = "TBA" ;							 
							 grpsched.add( day + " "  + tstart + " " + tend +" "+ room );

						 }
						 schedule2.put("datetime", grpsched);
						 schedholder.put("section", rs3.getString("Section_Code"));
						 schedholder.put("schedule", schedule2);
						 finalsched.add(schedholder);
						 //out.print(finalsched);

					 }
					 group.put("schedule", finalsched);
					 
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
