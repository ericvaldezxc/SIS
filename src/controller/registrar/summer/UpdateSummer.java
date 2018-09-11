package controller.registrar.summer;

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
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import configuration.GetActive;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/Registrar/Controller/Registrar/Summer/UpdateSummer")
public class UpdateSummer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSummer() {
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

		JSONArray studentlist = new JSONArray();
		JSONArray schedlist = new JSONArray();
		Object sched=null;
		Object student=null;
		JSONParser jsonParser=new JSONParser();
		
		String latcode = request.getParameter("latcode");
		String subject = request.getParameter("subject");
		String faculty = request.getParameter("faculty");
		String campus = request.getParameter("campus");
		try {
			sched=jsonParser.parse(request.getParameter("schedule"));
			student=jsonParser.parse(request.getParameter("student"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		studentlist = (JSONArray) student;
		schedlist = (JSONArray) sched;

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
		
		
		PrintWriter out = response.getWriter();	
		
		try {
			
			String acadyear = "";
			
			ResultSet rs = null;
			sql = "UPDATE t_summer_class SET  Summer_Class_Subject_ID = (SELECT Subject_ID  FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"'),Summer_Class_ProfessorID = (SELECT Professor_ID  FROM `r_professor` where Professor_Code = '"+faculty+"'),Summer_Class_CampusID = (SELECT Campus_ID  FROM `r_campus` where Campus_Code = '"+ec.encrypt(ec.key, ec.initVector, campus)+"') WHERE Summer_Class_Code = '"+latcode+"' "; 
			out.print(sql+"\n");
			stmnt.execute(sql);
			
			sql = "update t_summer_class_student set Summer_Class_Student_Display_Status='Inactive' where Summer_Class_Student_SummerClassID = (SELECT Summer_Class_ID  FROM `t_summer_class` where Summer_Class_Code = '"+latcode+"')"; 
			stmnt.execute(sql);
			
			sql = "update t_summer_class_schedule set Summer_Class_Schedule_Display_Status='Inactive' where Summer_Class_Schedule_SummerClassID = (SELECT Summer_Class_ID  FROM `t_summer_class` where Summer_Class_Code = '"+latcode+"')"; 
			stmnt.execute(sql);
			
			sql = "SELECT * FROM `t_summer_class` where Summer_Class_Code = '"+latcode+"' ";
			rs = stmnt.executeQuery(sql);
			while(rs.next()){
				acadyear = rs.getString("Summer_Class_Academic_Year");
				
			}

			sql = "update t_student_taken_curriculum_subject set Student_Taken_Curriculum_Subject_Display_Status='Inactive' where Student_Taken_Curriculum_Subject_SubjectID = (SELECT Subject_ID  FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"') AND Student_Taken_Curriculum_Subject_AcademicIYearID = '"+acadyear+"' and Student_Taken_Curriculum_Subject_SemesterID = ( SELECT Semester_ID FROM `r_semester` where Semester_Description = '"+ec.encrypt(ec.key, ec.initVector, "Summer")+"' ) and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Taken_Curriculum_Subject_StudentAccountID in (SELECT Summer_Class_Student_StudentAccountID FROM `t_summer_class_student` WHERE Summer_Class_Student_SummerClassID = (SELECT Summer_Class_ID FROM `t_summer_class` where Summer_Class_Code = '"+latcode+"'))"; 
			stmnt.execute(sql);

			
			for (Object o : studentlist) {
				sql = "SELECT count(*) as cou,Summer_Class_Student_ID FROM `t_summer_class_student` where Summer_Class_Student_StudentAccountID =  (SELECT Student_Account_ID  FROM `t_student_account` where Student_Account_Student_Number = '"+o+"') and Summer_Class_Student_SummerClassID = (SELECT Summer_Class_ID  FROM `t_summer_class` where Summer_Class_Code = '"+latcode+"')";
				out.print(sql+"\n");
				rs = stmnt.executeQuery(sql);
				String cou = "";
				String schedid = "";
				while(rs.next()){
					cou = rs.getString("cou");
					schedid = rs.getString("Summer_Class_Student_ID");
					
				}
				if(cou.equals("0")){
					sql = "INSERT INTO t_summer_class_student (Summer_Class_Student_SummerClassID,Summer_Class_Student_StudentAccountID) VALUES ((SELECT max(Summer_Class_ID)  FROM `t_summer_class` ),(SELECT Student_Account_ID  FROM `t_student_account` where Student_Account_Student_Number = '"+o+"')) "; 
					out.print(sql+"\n");
					stmnt.execute(sql);

				}
				else {
					sql = "update t_summer_class_student set Summer_Class_Student_Display_Status='Active' where Summer_Class_Student_ID = '"+schedid+"' "; 
					out.print(sql+"\n");
					stmnt.execute(sql);
					
				}
				
				
				
				rs = stmnt.executeQuery(" SELECT * FROM `t_student_account` where Student_Account_Student_Number =  '"+o+"'");
				String accid = "";
				String yearlvl = "";
				String section = "";
				String course = "";
				
				
				while(rs.next()){
					accid = rs.getString("Student_Account_ID");
					yearlvl = rs.getString("Student_Account_Year");
					section = rs.getString("Student_Account_SectionID");
					course = rs.getString("Student_Account_CourseID");
					 
					
				}
				
				sql = "update t_student_taken_curriculum_subject set Student_Taken_Curriculum_Subject_Display_Status='Inactive' where Student_Taken_Curriculum_Subject_StudentAccountID =  (SELECT Student_Account_ID  FROM `t_student_account` where Student_Account_Student_Number = '"+o+"') and Student_Taken_Curriculum_Subject_SubjectID = (SELECT Subject_ID  FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"') and Student_Taken_Curriculum_Subject_SemesterID = ( SELECT Semester_ID FROM `r_semester` where Semester_Description = '"+ec.encrypt(ec.key, ec.initVector, "Summer")+ "')"; 
				out.print(sql+"\n");
				stmnt.execute(sql);
				
				sql = "SELECT count(*) as cou,Student_Taken_Curriculum_Subject_ID FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID =  (SELECT Student_Account_ID  FROM `t_student_account` where Student_Account_Student_Number = '"+o+"') and Student_Taken_Curriculum_Subject_SubjectID = (SELECT Subject_ID  FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"') and Student_Taken_Curriculum_Subject_SemesterID = ( SELECT Semester_ID FROM `r_semester` where Semester_Description = '"+ec.encrypt(ec.key, ec.initVector, "Summer")+"')";
				out.print(sql+"\n");
				rs = stmnt.executeQuery(sql);
				cou = "";
				String takenid = "";
				while(rs.next()){
					cou = rs.getString("cou");
					takenid = rs.getString("Student_Taken_Curriculum_Subject_ID");
					
				}
				if(cou.equals("0")){
					sql = "INSERT INTO t_student_taken_curriculum_subject (Student_Taken_Curriculum_Subject_SubjectID,Student_Taken_Curriculum_Subject_StudentAccountID,Student_Taken_Curriculum_Subject_Taken_Status,Student_Taken_Curriculum_Subject_YearLevel,Student_Taken_Curriculum_Subject_SemesterID,Student_Taken_Curriculum_Subject_AcademicIYearID,Student_Taken_Curriculum_Subject_SectionID,Student_Taken_Curriculum_Subject_CourseID) VALUES ((SELECT Subject_ID  FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"'),'"+accid+"','true','"+yearlvl+"',( SELECT Semester_ID FROM `r_semester` where Semester_Description = '"+ec.encrypt(ec.key, ec.initVector, "Summer")+"' ),(SELECT Academic_Year_ID  FROM `r_academic_year` where Academic_Year_Active_Flag =  'Present'),'"+section+"','"+course+"') "; 
					out.print(sql+"\n");
					stmnt.execute(sql);

				}
				else {
					sql = "update t_student_taken_curriculum_subject set Student_Taken_Curriculum_Subject_Display_Status='Active' where Student_Taken_Curriculum_Subject_ID = '"+takenid+"' "; 
					stmnt.execute(sql);
					
				}
				
				
				
				
			}
			

			//sql = "update t_summer_class_student set Summer_Class_Student_Display_Status='Inactive' where Summer_Class_Student_SummerClassID = (SELECT Summer_Class_ID  FROM `t_summer_class` where Summer_Class_Code = '"+latcode+"')"; 
			//stmnt.execute(sql);
			
			for (Object o : schedlist) {
				JSONObject jsonLineItem = (JSONObject) o;
		        String room = (String) jsonLineItem.get("room");
		        String tend = (String) jsonLineItem.get("tend");
		        String tstart = (String) jsonLineItem.get("tstart");
		        String day = (String) jsonLineItem.get("day");

				sql = "INSERT INTO t_summer_class_schedule (Summer_Class_Schedule_SummerClassID,Summer_Class_Schedule_RoomID,Summer_Class_Schedule_Time_Start,Summer_Class_Schedule_Time_End,Summer_Class_Schedule_Day) VALUES ((SELECT max(Summer_Class_ID)  FROM `t_summer_class` ),(SELECT Room_ID  FROM `r_room` where Room_Code = '"+ec.encrypt(ec.key, ec.initVector, room)+"'),'"+tstart+"','"+tend+"','"+day+"') "; 
				out.print(sql+"\n");
				stmnt.execute(sql);
				
			}
			
			
//		
			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
