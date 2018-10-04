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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetSection
 */
@WebServlet("/Registrar/Controller/Registrar/Preenrollment/CheckSchedule")
public class CheckSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckSchedule() {
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

		String day = request.getParameter("day");
		String room = request.getParameter("room");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		room = ec.encrypt(ec.key, ec.initVector,room);

		PrintWriter out = response.getWriter();	
		String timestart1 = start.substring(3,5);
		String timestart2 = end.substring(3,5);
		String timeend1 = start.substring(3,5);
		String timeend2 = end.substring(3,5);
		int dtimestart1 = 0 ;
		int dtimestart2 = 0 ;
		int dtimeend1 = 0 ;
		int dtimeend2 = 0 ;
		
		if(timestart1.equals("00")) 
			 dtimestart1 = 59;
		else
			 dtimestart1 = Integer.parseInt(timestart1) - 1 ;
		
		if(timestart2.equals("00")) 
			dtimestart2 = 59;
		else
			dtimestart2 = Integer.parseInt(timestart2) - 1 ;
		
		dtimeend1 = Integer.parseInt(timeend1) + 1 ;
		dtimeend2 = Integer.parseInt(timeend2) + 1 ;
		
		timestart1 = start.substring(0,3) + dtimestart1;
		timestart2 = end.substring(0,3) + dtimestart2;
		timeend1 = start.substring(0,3) + dtimeend1;
		timeend2 = end.substring(0,3) + dtimeend2;
		
		
			

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
		
		//sql = "SELECT Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%H:%i') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%H:%i') AS tend,IFNULL(Room_Code,'TBA') AS ROOM FROM `t_schedule_items` inner join t_schedule on Schedule_ID = Schedule_Items_ScheduleID inner join r_curriculumitem on Schedule_CurriculumItemID = CurriculumItem_ID left join r_room on Room_ID = Schedule_Items_RoomID  inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID WHERE Schedule_Items_Display_Status = 'Active' and Schedule_Items_RoomID = (select Room_ID from r_room where Room_Code = '"+room+"' ) and Schedule_Items_ID in (SELECT Schedule_Items_ID  FROM `t_schedule_items` inner join t_schedule on Schedule_ID = Schedule_Items_ScheduleID inner join r_curriculumitem on Schedule_CurriculumItemID = CurriculumItem_ID  inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID WHERE Schedule_Items_Date = '"+day+"' and Schedule_Items_Display_Status = 'Active' and Schedule_Items_Time_End BETWEEN '"+timeend1+"' AND '"+timeend2+"') or Schedule_Items_Display_Status = 'Active' and Schedule_Items_RoomID = (select Room_ID from r_room where Room_Code = '"+room+"' ) and Schedule_Items_ID in (SELECT Schedule_Items_ID FROM `t_schedule_items` inner join t_schedule on Schedule_ID = Schedule_Items_ScheduleID inner join r_curriculumitem on Schedule_CurriculumItemID = CurriculumItem_ID inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID WHERE Schedule_Items_Date = '"+day+"' and Schedule_Items_Display_Status = 'Active' and Schedule_Items_Time_Start BETWEEN '"+timestart1+"' AND '"+timestart2+"')  ";
		sql = "SELECT Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%H:%i') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%H:%i') AS tend,IFNULL(Room_Code,'TBA') AS ROOM FROM `t_schedule_items` inner join t_schedule on Schedule_ID = Schedule_Items_ScheduleID inner join r_curriculumitem on Schedule_CurriculumItemID = CurriculumItem_ID left join r_room on Room_ID = Schedule_Items_RoomID  inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID  WHERE Schedule_Items_Display_Status = 'Active' and Schedule_Items_RoomID = (select Room_ID from r_room where Room_Code = '"+room+"' ) and Schedule_Items_ID in (SELECT Schedule_Items_ID  FROM `t_schedule_items` inner join t_schedule on Schedule_ID = Schedule_Items_ScheduleID inner join r_curriculumitem on Schedule_CurriculumItemID = CurriculumItem_ID  inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID INNER JOIN r_semester ON Curriculum_SemesterID = Semester_ID WHERE Schedule_Items_Date = '"+day+"' and Schedule_Items_Display_Status = 'Active' and Schedule_Items_Time_End BETWEEN '"+timeend1+"' AND '"+timeend2+"' AND Semester_Active_Flag = 'Active' and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present')) or Schedule_Items_Display_Status = 'Active' and Schedule_Items_RoomID = (select Room_ID from r_room where Room_Code = '"+room+"' ) and Schedule_Items_ID in (SELECT Schedule_Items_ID FROM `t_schedule_items` inner join t_schedule on Schedule_ID = Schedule_Items_ScheduleID inner join r_curriculumitem on Schedule_CurriculumItemID = CurriculumItem_ID inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID INNER JOIN r_semester ON Curriculum_SemesterID = Semester_ID  WHERE Schedule_Items_Date = '"+day+"' and Schedule_Items_Display_Status = 'Active' and Schedule_Items_Time_Start BETWEEN '"+timestart1+"' AND '"+timestart2+"' AND Semester_Active_Flag = 'Active' and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))  ";
		
		
		//out.print(sql+"\n");
		
		
		try {
			
			ResultSet rs = stmnt.executeQuery(sql);
			JSONArray schedulelist = new JSONArray();
			JSONObject mes = new JSONObject();
			String message = "Valid";
			while(rs.next()){
				message = "Invalid";
				JSONObject obj = new JSONObject();
				obj.put("day", rs.getString("Schedule_Items_Date"));
				obj.put("tstart", rs.getString("tstart"));
				obj.put("tend", rs.getString("tend"));
				if(!rs.getString("ROOM").equals("TBA"))
					obj.put("room",ec.decrypt(ec.key, ec.initVector, rs.getString("ROOM")) );
				else
					obj.put("room","TBA" );
				schedulelist.add(obj);
			      
			}
			mes.put("message", message);
			mes.put("sched", schedulelist);
			out.print(mes);	

			conn.close();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
