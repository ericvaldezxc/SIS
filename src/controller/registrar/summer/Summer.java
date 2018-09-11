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
@WebServlet("/Registrar/Controller/Registrar/Summer/Summer")
public class Summer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Summer() {
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
			
			
			GetActive ga = new GetActive();
			String acadyear = ga.getAcadYear();
			ResultSet rs = stmnt.executeQuery("SELECT YEAR(CURRENT_DATE) AS YEAR ,RIGHT(count(*) + 100001,5) AS NUM FROM `t_summer_class` where Summer_Class_Academic_Year =  (SELECT Academic_Year_ID  FROM `r_academic_year` where Academic_Year_Active_Flag =  'Present') and Summer_Class_Subject_ID = (SELECT Subject_ID  FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"') ");
			int  i = 0 ;
			String year = "";
			String num = "";
			String code = "";
			while(rs.next()){
				year = rs.getString("YEAR");
				num = rs.getString("NUM");
				 
				
			}
			code = year + "-"+subject+"-"+num+"-"+campus;
			sql = "INSERT INTO t_summer_class (Summer_Class_Code,Summer_Class_Academic_Year,Summer_Class_Subject_ID,Summer_Class_ProfessorID,Summer_Class_CampusID) VALUES ('"+code+"',(SELECT Academic_Year_ID  FROM `r_academic_year` where Academic_Year_Active_Flag =  'Present'),(SELECT Subject_ID  FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"'),(SELECT Professor_ID  FROM `r_professor` where Professor_Code = '"+faculty+"'),(SELECT Campus_ID  FROM `r_campus` where Campus_Code = '"+ec.encrypt(ec.key, ec.initVector, campus)+"')) "; 
			out.print(sql+"\n");
			
			
			stmnt.execute(sql);
			for (Object o : studentlist) {
				sql = "INSERT INTO t_summer_class_student (Summer_Class_Student_SummerClassID,Summer_Class_Student_StudentAccountID) VALUES ((SELECT max(Summer_Class_ID)  FROM `t_summer_class` ),(SELECT Student_Account_ID  FROM `t_student_account` where Student_Account_Student_Number = '"+o+"')) "; 
				stmnt.execute(sql);
				out.print(sql+"\n");
				
				
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
				
				sql = "INSERT INTO t_student_taken_curriculum_subject (Student_Taken_Curriculum_Subject_SubjectID,Student_Taken_Curriculum_Subject_StudentAccountID,Student_Taken_Curriculum_Subject_Taken_Status,Student_Taken_Curriculum_Subject_YearLevel,Student_Taken_Curriculum_Subject_SemesterID,Student_Taken_Curriculum_Subject_AcademicIYearID,Student_Taken_Curriculum_Subject_SectionID,Student_Taken_Curriculum_Subject_CourseID) VALUES ((SELECT Subject_ID  FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"'),'"+accid+"','true','"+yearlvl+"',( SELECT Semester_ID FROM `r_semester` where Semester_Description = '"+ec.encrypt(ec.key, ec.initVector, "Summer")+"' ),(SELECT Academic_Year_ID  FROM `r_academic_year` where Academic_Year_Active_Flag =  'Present'),'"+section+"','"+course+"') "; 
				out.print(sql+"\n");
				stmnt.execute(sql);
				
				
			}
			
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
