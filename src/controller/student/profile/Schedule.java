package controller.student.profile;

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
@WebServlet("/Registrar/Controller/Registrar/Student/Schedule")
public class Schedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Schedule() {
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
		String subjectcode = request.getParameter("subject");
		Fullname fn = new Fullname();
		
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
		try {
			
			PrintWriter out = response.getWriter();	
			
			sql = "SELECT Section_Code,Schedule_ID from r_curriculumitem inner join t_schedule on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID  inner join r_section on Schedule_SectionID = Section_ID where Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` where CurriculumYear_Ative_Flag = 'Active' ) and Curriculum_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present') and Schedule_Display_Status = 'Active' and CurriculumItem_SubjectID = (SELECT if(ifnull(Subject_Group,0) =0,Subject_ID,Subject_Group) FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subjectcode)+"' ) and CurriculumItem_Display_Status = 'Active'  and if(ifnull(Schedule_ChildrenID,0)=0,0,Schedule_ChildrenID) = if(ifnull(Schedule_ChildrenID,0)=0,0,(SELECT Subject_ID FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subjectcode)+"' )) ";
			ResultSet rs = stmnt.executeQuery(sql);
			String schedid = "";
			String sec= "";
			JSONArray schedlist = new JSONArray();
			while(rs.next()){
				JSONObject section = new JSONObject();
				section.put("section", rs.getString("Section_Code"));
				sec = rs.getString("Section_Code");
				schedid = rs.getString("Schedule_ID");
				String sql2 = "SELECT Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%h:%i %p') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%h:%i %p') AS tend,IFNULL(Room_Code,'TBA') AS ROOM  FROM `t_schedule_items` left join r_room on Room_ID = Schedule_Items_RoomID   WHERE Schedule_Items_Display_Status = 'Active' and Schedule_Items_ScheduleID = '"+schedid+"'";
				//out.print(sql3+"\n");
				ResultSet rs2 = stmnt2.executeQuery(sql2);
				JSONArray schedlist2 = new JSONArray();

				while(rs2.next()){
					JSONObject schedule = new JSONObject();
					String day =  rs2.getString("Schedule_Items_Date");
					String tstart = rs2.getString("tstart");
					String tend =  rs2.getString("tend");
					String room = "";
					if(!rs2.getString("ROOM").equals("TBA"))
						room = ec.decrypt(ec.key, ec.initVector, rs2.getString("ROOM")) ;
					else
						room = "TBA" ;
					String sc = day + " "  + tstart + " " + tend +" "+ room ;
//					schedule.put("schedule", );
					schedlist2.add(sc);

				 }
				 section.put("sched", schedlist2);
				 
				 schedlist.add(section);
				 
			 }
			out.print(schedlist);
				
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
