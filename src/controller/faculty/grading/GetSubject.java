package controller.faculty.grading;

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
@WebServlet("/Faculty/Controller/Faculty/Grading/GetSubject")
public class GetSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSubject() {
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

		String sem = request.getParameter("sem");
		String year = request.getParameter("year");
		

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		FinalGrade fg = new FinalGrade();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		try {
			HttpSession session = request.getSession();
			String username = session.getAttribute("username").toString();

			sql = "SELECT distinct  IF(IFNULL(Schedule_ChildrenID,0)=0,(SELECT Subject_Code FROM r_subject WHERE CurriculumItem_SubjectID  = Subject_ID),(SELECT Subject_Code FROM r_subject WHERE Schedule_ChildrenID = Subject_ID)) CODE,IF(IFNULL(Schedule_ChildrenID,0)=0,(SELECT Subject_Description FROM r_subject WHERE CurriculumItem_SubjectID  = Subject_ID),(SELECT Subject_Description FROM r_subject WHERE Schedule_ChildrenID = Subject_ID)) DESCR  FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID  left join r_room on Room_ID = Schedule_Items_RoomID inner join r_section on Schedule_SectionID =  Section_ID left join r_professor on Schedule_ProfessorID =  Professor_ID where Schedule_Items_Display_Status = 'Active'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present')  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Code = '"+ec.encrypt(ec.key, ec.initVector, year)+"')  and Curriculum_SemesterID = (select Semester_ID from r_semester where Semester_Code = '"+ec.encrypt(ec.key, ec.initVector, sem)+"')   and Professor_Code = '"+username+"'";
//			out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("CODE")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("DESCR")));
				 
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
