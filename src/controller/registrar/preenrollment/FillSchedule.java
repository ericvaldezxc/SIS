package controller.registrar.preenrollment;

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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class FeeController
 */
@WebServlet("/Registrar/Controller/Registrar/PreEnrollment/FillSchedule")
public class FillSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FillSchedule() {
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
		
		JSONArray groupprof = new JSONArray();
		
		String curi = request.getParameter("curriculumDrp");
		String section = request.getParameter("section");
		String yearlvl = request.getParameter("year");
		String lattype = request.getParameter("lattype");
		String subject = request.getParameter("subject");
		
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
		JSONObject obj = new JSONObject();
		JSONArray schedulelist = new JSONArray();
		try {
			if(lattype.equals("solo"))
				sql = "SELECT Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%H:%i') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%H:%i') AS tend,IFNULL(Room_Code,'TBA') AS ROOM  FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID  left join r_room on Room_ID = Schedule_Items_RoomID   where Schedule_SectionID = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+  section+"') and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"')  and Curriculum_YearLevel = '"+yearlvl+"' and CurriculumItem_SubjectID = (SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"')  and Schedule_Items_Display_Status = 'Active'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present') ";
			else
				sql = "SELECT Schedule_Items_Date ,TIME_FORMAT(Schedule_Items_Time_Start, '%H:%i') tstart,TIME_FORMAT(Schedule_Items_Time_End, '%H:%i') AS tend,IFNULL(Room_Code,'TBA') AS ROOM  FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID  left join r_room on Room_ID = Schedule_Items_RoomID   where Schedule_SectionID = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+  section+"') and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"')  and Curriculum_YearLevel = '"+yearlvl+"' and Schedule_ChildrenID = (SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"') and Schedule_Items_Display_Status = 'Active'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present')  ";
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 obj = new JSONObject();
				 obj.put("day", rs.getString("Schedule_Items_Date"));
				 obj.put("tstart", rs.getString("tstart"));
				 obj.put("tend", rs.getString("tend"));
				 if(!rs.getString("ROOM").equals("TBA"))
					 obj.put("room",ec.decrypt(ec.key, ec.initVector, rs.getString("ROOM")) );
				 else
					 obj.put("room","TBA" );
				 schedulelist.add(obj);
			}
			out.print(schedulelist);
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
