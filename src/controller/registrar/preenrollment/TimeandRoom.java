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

import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class FeeController
 */
@WebServlet("/Registrar/Controller/Registrar/PreEnrollment/TimeandRoom")
public class TimeandRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TimeandRoom() {
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

		String curi = request.getParameter("curriculumDrp");
		String section = request.getParameter("section");
		String yearlvl = request.getParameter("year");
		String curcode = request.getParameter("course");
		String semester = request.getParameter("semester");
		String campus = request.getParameter("campus");
		String lattype = request.getParameter("lattype");
		String professorDrp = request.getParameter("professorDrp");
		String subject = request.getParameter("subject");

		String day = request.getParameter("day");
		String timestart = request.getParameter("timestart");
		String timeend = request.getParameter("timeend");
		String room = request.getParameter("room");
		
		
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
			if(lattype.equals("solo"))
				sql = "SELECT CurriculumItem_ID FROM `r_curriculum` inner join r_curriculumitem on CurriculumItem_CurriculumID = Curriculum_ID where Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Code = '"+ ec.encrypt(ec.key, ec.initVector, semester)+"') and Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"')  and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"')  and Curriculum_YearLevel = '"+yearlvl+"' and CurriculumItem_SubjectID = (SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"') ";
			else
				sql = "SELECT CurriculumItem_ID FROM `r_curriculum` inner join r_curriculumitem on CurriculumItem_CurriculumID = Curriculum_ID where Curriculum_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Code = '"+ ec.encrypt(ec.key, ec.initVector, semester)+"') and Curriculum_CourseID = (SELECT Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"')  and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curi)+"')  and Curriculum_YearLevel = '"+yearlvl+"' and CurriculumItem_SubjectID = (SELECT Subject_Group FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"')  ";

			out.print(sql+"\n");
			stmnt = conn.createStatement();
			String id = "";
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				id = rs.getString("CurriculumItem_ID");
			}

			
			// and Schedule_ProfessorID = (SELECT Professor_ID FROM r_section WHERE Professor_Code = '"+professorDrp+"') 
			if(lattype.equals("solo")) {
//				sql = "SELECT COUNT(*) as cou,Schedule_ID FROM t_schedule where Schedule_CurriculumItemID = '"+id+"' and Schedule_SectionID  = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+section+"')";
				sql = "SELECT Schedule_ID FROM t_schedule where Schedule_CurriculumItemID = '"+id+"' and Schedule_SectionID  = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+section+"') and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present' and Academic_Year_Display_Status = 'Active')";
//				out.print(sql+"\n");
				stmnt = conn.createStatement();				
				rs = stmnt.executeQuery(sql);
				String schedid = "";
				while(rs.next()){
					schedid = rs.getString("Schedule_ID");
					
				}

				if(room.equals("default"))
					sql = "insert into `t_schedule_items` (Schedule_Items_ScheduleID,Schedule_Items_RoomID,Schedule_Items_Date,Schedule_Items_Time_Start,Schedule_Items_Time_End) values ("+schedid+",null,'"+day+"','"+timestart+"','"+timeend+"') ";
				else					
					sql = "insert into `t_schedule_items` (Schedule_Items_ScheduleID,Schedule_Items_RoomID,Schedule_Items_Date,Schedule_Items_Time_Start,Schedule_Items_Time_End) values ("+schedid+",(SELECT Room_ID FROM r_room WHERE Room_Code = '"+ec.encrypt(ec.key, ec.initVector, room)+"'),'"+day+"','"+timestart+"','"+timeend+"') ";
			}
			else {
				sql = "SELECT Schedule_ID FROM t_schedule where Schedule_CurriculumItemID = '"+id+"' and Schedule_SectionID  = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+section+"') and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present' and Academic_Year_Display_Status = 'Active') and Schedule_ChildrenID = (SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"') ";
				out.print(sql+"\n");
				stmnt = conn.createStatement();				
				rs = stmnt.executeQuery(sql);
				String schedid = "";
				while(rs.next()){
					schedid = rs.getString("Schedule_ID");
					
				}

				if(room.equals("default"))
					sql = "insert into `t_schedule_items` (Schedule_Items_ScheduleID,Schedule_Items_RoomID,Schedule_Items_Date,Schedule_Items_Time_Start,Schedule_Items_Time_End) values ("+schedid+",null,'"+day+"','"+timestart+"','"+timeend+"') ";
				else					
					sql = "insert into `t_schedule_items` (Schedule_Items_ScheduleID,Schedule_Items_RoomID,Schedule_Items_Date,Schedule_Items_Time_Start,Schedule_Items_Time_End) values ("+schedid+",(SELECT Room_ID FROM r_room WHERE Room_Code = '"+ec.encrypt(ec.key, ec.initVector, room)+"'),'"+day+"','"+timestart+"','"+timeend+"') ";
//
//				
//				
				out.print(sql+"\n");
//				sql = "SELECT COUNT(*) as cou,Schedule_ID FROM t_schedule where Schedule_CurriculumItemID = '"+id+"' and Schedule_SectionID  = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+section+"') and Schedule_ChildrenID = (SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"')";
//				out.print(sql+"\n");
//				stmnt = conn.createStatement();				
//				rs = stmnt.executeQuery(sql);
//				String cou = "";
//				while(rs.next()){
//					cou = rs.getString("cou");
//					schedid = rs.getString("Schedule_ID");
//					
//				}
//				if(cou.equals("0"))
//					sql = "Insert into t_schedule (Schedule_ProfessorID,Schedule_CurriculumItemID,Schedule_SectionID,Schedule_ChildrenID) values ((SELECT Professor_ID FROM r_professor WHERE Professor_Code = '"+ professorDrp+"'),'"+id+"',(SELECT Section_ID FROM r_section WHERE Section_Code = '"+section+"'),(SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"'))";
//				else 
//					sql = "UPDATE t_schedule set Schedule_ProfessorID = (SELECT Professor_ID FROM r_professor WHERE Professor_Code = '"+ professorDrp+"') where Schedule_ID = '"+schedid+"'";
//				

			}
			out.print(sql+"\n");

			
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
