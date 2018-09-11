package configuration;

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
import configuration.FinalGrade;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetSection
 */
@WebServlet("/StudentSchedule")
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
		response.setContentType("text/plain");
		EncryptandDecrypt ec = new EncryptandDecrypt();

		String studentnumber = request.getParameter("StudentNumber");

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		//String studentnumber = "2018-00001-CM-0";
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
		
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		try {

			sql = "SELECT Student_Taken_Curriculum_Subject_SectionID,Subject_ID,CurriculumItem_ID,Subject_Code,Subject_Description,Subject_Lecture_Units,Subject_Laboratory_Units,Subject_Lecture_Hours,Subject_Laboratory_Hours,Subject_Tuition_Hours,Subject_Credited_Units FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID inner join r_section on Student_Taken_Curriculum_Subject_SectionID = Section_ID inner join r_curriculumitem on if(ifnull(Subject_Group,0)=0,Subject_ID,Subject_Group) = CurriculumItem_SubjectID inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID where Student_Account_Student_Number = '"+studentnumber+"' and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present') and Student_Account_CurriculumYearID = Curriculum_CurriculumYearID and Curriculum_CourseID = Section_CourseID and Student_Taken_Curriculum_Subject_Display_Status ='Active'";
			ResultSet rs = stmnt.executeQuery(sql);
			JSONArray finalschedule = new JSONArray();
			//out.print(sql);
			while(rs.next()){

				 JSONObject obj = new JSONObject();
				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
				 obj.put("desc",  ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));	
				 obj.put("lec",  rs.getString("Subject_Lecture_Units"));					 
				 obj.put("lab",  rs.getString("Subject_Laboratory_Units"));					 
				 obj.put("cred",  rs.getString("Subject_Credited_Units"));	
				 String sectionid = rs.getString("Student_Taken_Curriculum_Subject_SectionID");
				 String curid = rs.getString("CurriculumItem_ID");
				 String subjid = rs.getString("Subject_ID");
				 String sql2 = "SELECT IFNULL(CONCAT(Schedule_Items_Date,' ',TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p'),' '),'TBA') AS SCHED,IFNULL(Room_Description,'TBA') AS ROOM   FROM t_schedule_items inner join `t_schedule` on Schedule_Items_ScheduleID = Schedule_ID left join r_room on Schedule_Items_RoomID = Room_ID  WHERE if(Schedule_ChildrenID is null , 0 , Schedule_ChildrenID) = if(Schedule_ChildrenID is null , 0 , '"+subjid+"') and Schedule_CurriculumItemID = '"+curid+"' and Schedule_SectionID = '"+sectionid+"' and Schedule_Items_Display_Status = 'Active' ";
				 //out.print(sql2);
				 ResultSet rs2 = stmnt2.executeQuery(sql2);
				 JSONArray schedulelist = new JSONArray();
				 
				 while(rs2.next()){
					 JSONObject schedholder = new JSONObject();
					 if(!rs2.getString("ROOM").equals("TBA"))
						 schedholder.put("room",ec.decrypt(ec.key, ec.initVector, rs2.getString("ROOM")) );
					 else
						 schedholder.put("room","TBA" );
					 schedholder.put("time", rs2.getString("SCHED"));
					 schedulelist.add(schedholder);
					 
				 }
				 obj.put("schedule", schedulelist);
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
