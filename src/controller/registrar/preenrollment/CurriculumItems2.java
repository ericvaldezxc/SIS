package controller.registrar.preenrollment;

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
@WebServlet("/Registrar/Controller/Registrar/Preenrollment/CurriculumItems2")
public class CurriculumItems2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumItems2() {
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
		String section = request.getParameter("section");
		String yearlvl = request.getParameter("yearlvl");
		String semester = request.getParameter("semester");
		String curi = request.getParameter("curi");
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
		
//bago		sql = "SELECT CurriculumItem_ID,Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours,IFNULL(Professor_FirstName,'Not Set') as PROFNAME ,Professor_MiddleName,Professor_LastName,Professor_Code,IFNULL(Schedule_ID,'0')  as schedid FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject ON CurriculumItem_SubjectID = Subject_ID LEFT JOIN t_schedule ON  CurriculumItem_ID = Schedule_CurriculumItemID LEFT JOIN r_professor ON Schedule_ProfessorID = Professor_ID WHERE Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"') and Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Code = '"+ ec.encrypt(ec.key, ec.initVector, semester)+"') and Curriculum_YearLevel = '"+yearlvl+"' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"') and Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') group by CurriculumItem_ID";
//BAGO PALITAN		sql = "SELECT CurriculumItem_ID,Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours,IFNULL(Professor_FirstName,'Not Set') as PROFNAME ,Professor_MiddleName,Professor_LastName,Professor_Code,IFNULL(Schedule_ID,'0')  as schedid FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject ON CurriculumItem_SubjectID = Subject_ID LEFT JOIN t_schedule ON  CurriculumItem_ID = Schedule_CurriculumItemID LEFT JOIN r_professor ON Schedule_ProfessorID = Professor_ID WHERE Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"') and Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Code = '"+ ec.encrypt(ec.key, ec.initVector, semester)+"') and Curriculum_YearLevel = '"+yearlvl+"' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"') group by CurriculumItem_ID";
		sql = "SELECT CurriculumItem_ID,Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours,IFNULL(IF(IFNULL(Schedule_SectionID,0)=0,'Not Set',IF(Schedule_SectionID=(SELECT Section_ID from r_section where Section_Code = '"+section+"'),Professor_FirstName,'Not Set')),'Not Set') AS PROFNAME,IFNULL(IF(IFNULL(Schedule_SectionID,0)=0,'Not Set',IF(Schedule_SectionID=(SELECT Section_ID from r_section where Section_Code = '"+section+"'),Professor_MiddleName,'Not Set')),'Not Set') AS PROMNAME,IFNULL(IF(IFNULL(Schedule_SectionID,0)=0,'Not Set',IF(Schedule_SectionID=(SELECT Section_ID from r_section where Section_Code = '"+section+"'),Professor_LastName,'Not Set')),'Not Set') AS PROLNAME,IFNULL(IF(IFNULL(Schedule_SectionID,0)=0,'Not Set',IF(Schedule_SectionID=(SELECT Section_ID from r_section where Section_Code = '"+section+"'),Professor_Code,'Not Set')),'Not Set') AS PROFCODE,Schedule_SectionID,IFNULL(Schedule_ID,'0')  as schedid FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject ON CurriculumItem_SubjectID = Subject_ID LEFT JOIN t_schedule ON  CurriculumItem_ID = Schedule_CurriculumItemID LEFT JOIN r_professor ON Schedule_ProfessorID = Professor_ID WHERE Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"') and Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Code = '"+ ec.encrypt(ec.key, ec.initVector, semester)+"') and Curriculum_YearLevel = 'First Year' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"') group by CurriculumItem_ID";
//		sql = "SELECT CurriculumItem_ID,Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours,IFNULL((SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_FirstName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ),'Not Set') AS PROFNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_MiddleName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROMNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_LastName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROLNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_Code FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROFCODE FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject ON CurriculumItem_SubjectID = Subject_ID  WHERE Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"') and Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Code = '"+ ec.encrypt(ec.key, ec.initVector, semester)+"') and Curriculum_YearLevel = '"+yearlvl+"' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"') ";
		JSONArray arr = new JSONArray();
		JSONArray grouplist = new JSONArray();
		JSONArray schedlist = new JSONArray();
		JSONArray schedlist2 = new JSONArray();
		PrintWriter out = response.getWriter();	
		//out.print(sql+"\n");
		
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			ResultSet rs2,rs3,rs4,rs5,rs6,rs7;

			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 JSONObject group = new JSONObject();
				 JSONObject sched = new JSONObject();
				 JSONObject sched2 = new JSONObject();
				 grouplist = new JSONArray();
				 schedlist = new JSONArray();
				 schedlist2 = new JSONArray();

				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));
//				 out.print(rs.getString("PROFNAME"));
				 obj.put("tuition", rs.getString("Subject_Tuition_Hours"));
				 String Fullname = "";
				 if(rs.getString("PROFNAME").equals("Not Set")){
					 obj.put("prof", "Not Set");
					 obj.put("profcode", "Not Set");
				 }
				 else {
					 Fullname = fn.fullname(ec.decrypt(ec.key, ec.initVector, rs.getString("PROFNAME")),ec.decrypt(ec.key, ec.initVector, rs.getString("PROMNAME")),ec.decrypt(ec.key, ec.initVector, rs.getString("PROLNAME")));
					 obj.put("prof", Fullname);
					 obj.put("profcode", rs.getString("PROFCODE"));
				 }
				 
				 obj.put("id", rs.getString("CurriculumItem_ID"));	
				 obj.put("units", rs.getString("Subject_Credited_Units"));
				 String id = rs.getString("CurriculumItem_ID");
				 String schedid = rs.getString("schedid");
				 
				 if(schedid.equals("0")) {
					 sched = new JSONObject();
					 schedlist.add("TBA");

					 
				 }else {
//					 sql3 = "SELECT count(*),IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA') AS SCHEDDATE,IFNULL(Room_Description,'TBA') AS ROOM FROM `t_schedule_items` left join r_room on Schedule_Items_RoomID = Room_ID  WHERE Schedule_Items_ScheduleID = "+schedid;
					 sql3 = "SELECT count(*) as cou FROM `t_schedule_items` left join r_room on Schedule_Items_RoomID = Room_ID  WHERE Schedule_Items_ScheduleID = "+schedid;
					 //out.print(sql3+"\n");

					 rs3 = stmnt3.executeQuery(sql3);
					 while(rs3.next()){
						 sched = new JSONObject();
						 String mcou = rs3.getString("cou");
						 if(mcou.equals("0")) {
							 schedlist.add("TBA");
						 }else {
//BAGO PALITAN							 sql5 = "SELECT IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA') AS SCHEDDATE,IFNULL(Room_Description,'TBA') AS ROOM FROM `t_schedule_items` left join r_room on Schedule_Items_RoomID = Room_ID  WHERE Schedule_Items_ScheduleID = "+schedid;
							 sql5 = "SELECT IFNULL(IF(IFNULL(Schedule_SectionID,0)=0,'TBA',IF(Schedule_SectionID=(SELECT Section_ID from r_section where Section_Code = '"+section+"'),IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA'),'TBA')),'TBA') AS SCHEDDATE,IFNULL(IF(IFNULL(Schedule_SectionID,0)=0,'TBA',IF(Schedule_SectionID=(SELECT Section_ID from r_section where Section_Code = '"+section+"'),Room_Description,'TBA')),'TBA') AS ROOM FROM `t_schedule_items` left join r_room on Schedule_Items_RoomID = Room_ID left join t_schedule  ON Schedule_Items_ScheduleID = Schedule_ID  WHERE Schedule_Items_ScheduleID = "+schedid;
//							 out.print(sql5+"\n");
							 rs5 = stmnt5.executeQuery(sql5);
							 while(rs5.next()){
								 String sch = rs5.getString("SCHEDDATE");
								 String room = rs5.getString("ROOM");
								 String fullsched = "";
								 if(room.equals("TBA") && !sch.equals("TBA") ) {
									 fullsched = sch + "TBA";
								 }
								 else if(room.equals("TBA") && sch.equals("TBA") ) {
									 schedlist = new JSONArray();// para isang loop lang ewan hahaha
									 fullsched =  "TBA";
								 }
								 else {
									 fullsched = sch + ec.decrypt(ec.key, ec.initVector, room);
								 }
								 schedlist.add(fullsched);
//								 out.print(schedlist+"\n");
							 }
						 }
						 
					 }					 
				 } 
				 
				 obj.put("schedule", schedlist);

				 		
				 	
				 
//				 sql2 = "SELECT CurriculumItem_ID,Subject_Code,Subject_Description,Subject_Credited_Units,Subject_Tuition_Hours,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_FirstName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROFNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_MiddleName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROMNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_LastName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROLNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_Code FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Schedule_CurriculumItemID = CurriculumItem_ID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROFCODE FROM `r_curriculumitem` inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  INNER JOIN r_curriculumyear ON CurriculumYear_ID = Curriculum_CurriculumYearID  INNER JOIN r_subject ON CurriculumItem_SubjectID = Subject_ID  WHERE Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"') and Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Code = '"+ ec.encrypt(ec.key, ec.initVector, semester)+"') and Curriculum_YearLevel = '"+yearlvl+"' and CurriculumItem_Display_Status = 'Active'and CurriculumYear_Ative_Flag = 'Active' and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"') ";
				 sql2 = "SELECT *,IFNULL((SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_FirstName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ),'Not Set') AS PROFNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_MiddleName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROMNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_LastName FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROLNAME,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,(SELECT Professor_Code FROM `r_professor` where Professor_ID = (SELECT Schedule_ProfessorID FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS PROFCODE,(SELECT IF((SELECT COUNT(*) FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"')) != 0,((SELECT Schedule_ID FROM t_schedule WHERE Subject_ID = Schedule_ChildrenID  AND Schedule_SectionID = (SELECT Section_ID from r_section where Section_Code = '"+section+"') )),'Not Set' ) ) AS scid FROM `r_subject` AS T1 WHERE T1.Subject_Group = (SELECT T2.Subject_ID FROM r_subject AS T2 where T2.Subject_Code = '"+rs.getString("Subject_Code")+"' ) ";
				 //out.print("\n"+sql2);
				 rs2 = stmnt2.executeQuery(sql2);
				 while(rs2.next()){
					 group = new JSONObject();
					 String id2 = rs2.getString("Subject_ID");
					 String scid = rs2.getString("scid");
//					 out.print(scid+"\n");
					 
					 //out.print("\n"+id2+"\n");
					 group.put("code", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code")));
					 group.put("desc", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Description")));
					 group.put("units", rs2.getString("Subject_Credited_Units"));
					 group.put("id", rs2.getString("Subject_ID"));
					 
					 if(rs2.getString("PROFNAME").equals("Not Set")){
						 group.put("prof", "Not Set");
						 group.put("profcode","Not Set");
					 }
					 else {
						 Fullname = fn.fullname(ec.decrypt(ec.key, ec.initVector, rs2.getString("PROFNAME")),ec.decrypt(ec.key, ec.initVector, rs2.getString("PROMNAME")),ec.decrypt(ec.key, ec.initVector, rs2.getString("PROLNAME")));
						 group.put("prof", Fullname);
						 group.put("profcode", rs2.getString("PROFCODE"));
					 }
					 
					 group.put("tuition", rs2.getString("Subject_Tuition_Hours"));
					 
					 
					 
					 
					 
								 
//					 sql4 = "SELECT count(*) as cou FROM `t_schedule_items` left join r_room on Schedule_Items_RoomID = Room_ID  WHERE Schedule_Items_ScheduleID = "+schedid;
					 sql4 = " SELECT count(*) as cou FROM `t_schedule` where Schedule_CurriculumItemID = '"+id+"'";
//					 out.print(sql4+"\n");
					
					 

					 rs4 = stmnt4.executeQuery(sql4);
					 while(rs4.next()){
						 sched = new JSONObject();
						 String mcou = rs4.getString("cou");
						 if(mcou.equals("0")) {
							 schedlist2.add("TBA");
							 group.put("schedule", schedlist2);
						 }else {
							 
								 schedlist2 = new JSONArray();
								 if(scid.equals("Not Set")) {
									 schedlist2.add("TBA");
									 group.put("schedule", schedlist2);
								 }
								 else {
									 
									 //BAGOPALITAN sql7 = "SELECT IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA') AS SCHEDDATE,IFNULL(Room_Description,'TBA') AS ROOM FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID left join r_room on Schedule_Items_RoomID = Room_ID    where Schedule_Items_ScheduleID = '"+scid +"' and Schedule_CurriculumItemID ='"+id+"' and Schedule_ChildrenID ='"+id2+"'";
									 sql7 = "SELECT IFNULL(IF(IFNULL(Schedule_SectionID,0)=0,'TBA', IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA')  ),'TBA') AS SCHEDDATE,IFNULL(Room_Description,'TBA') AS ROOM  FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID left join r_room on Schedule_Items_RoomID = Room_ID    where Schedule_Items_ScheduleID = '"+scid +"' and Schedule_CurriculumItemID ='"+id+"' and Schedule_ChildrenID ='"+id2+"'";
//									 sql5 = "SELECT IFNULL(IF(IFNULL(Schedule_SectionID,0)=0,'TBA', IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA')  ),'TBA') AS SCHEDDATE,IFNULL(Room_Description,'TBA') AS ROOM  FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID left join r_room on Schedule_Items_RoomID = Room_ID    where Schedule_Items_ScheduleID  = "+schedid;
										
									 //out.print(sql7+"\n");
								 	 rs7 = stmnt7.executeQuery(sql7);
									 while(rs7.next()){
										 String sch = rs7.getString("SCHEDDATE");
										 String room = rs7.getString("ROOM");
										 String fullsched = "";
										 if(room.equals("TBA")) {
											 fullsched = sch + "TBA";
										 }
										 else {
											 fullsched = sch + ec.decrypt(ec.key, ec.initVector, room);
										 }
										 schedlist2.add(fullsched);
									 }
									 //out.print(schedlist2+"\n");
									 group.put("schedule", schedlist2);
									 
								 }
								 
							
								 
							
						 }
						 //out.print(schedlist2+"\n");
						 
						 
					 }								 
	

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
