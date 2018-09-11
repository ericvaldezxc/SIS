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

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetSection
 */
@WebServlet("/Registrar/Controller/Registrar/Summer/GetSummerSchedule")
public class GetSummerSchedule extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSummerSchedule() {
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

		String summercoode = request.getParameter("summercoode");

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
		
		sql = "";
		JSONObject holder = new JSONObject();
		PrintWriter out = response.getWriter();	
		//out.print(sql);
		

		try {
			sql = "SELECT * FROM `t_summer_class` inner join r_subject on Summer_Class_Subject_ID = Subject_ID inner join r_campus on Campus_ID = Summer_Class_CampusID inner join r_professor on Summer_Class_ProfessorID = Professor_ID where Summer_Class_Code = '"+summercoode+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
//				 lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_LastName"));
				 holder.put("campus",  ec.decrypt(ec.key, ec.initVector, rs.getString("Campus_Code")));
				 holder.put("subject",  ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
				 holder.put("professor", rs.getString("Professor_Code"));
			      
			}
			
			sql = "SELECT *,ifnull(Room_Code,'default') as room FROM `t_summer_class_schedule` left join r_room on Summer_Class_Schedule_RoomID = Room_ID where Summer_Class_Schedule_SummerClassID = (SELECT Summer_Class_ID FROM `t_summer_class` WHERE Summer_Class_Code = '"+summercoode+"') and Summer_Class_Schedule_Display_Status = 'Active'";
			rs = stmnt.executeQuery(sql);
			JSONArray schedulelist = new JSONArray();
			while(rs.next()){
				 JSONObject schedule = new JSONObject();
//				 lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_LastName"));
				 String room = rs.getString("room");
				 if(!room.equals("default")){
					 room = ec.decrypt(ec.key, ec.initVector, rs.getString("room"));
				 }
				 schedule.put("day",  rs.getString("Summer_Class_Schedule_Day"));
				 schedule.put("tstart",  rs.getString("Summer_Class_Schedule_Time_Start"));
				 schedule.put("tend",  rs.getString("Summer_Class_Schedule_Time_End"));
				 schedule.put("room", room);
				 schedulelist.add(schedule);
			      
			}
			
			sql = "SELECT * FROM `t_summer_class_student` inner join t_student_account on Summer_Class_Student_StudentAccountID = Student_Account_ID where Summer_Class_Student_SummerClassID = (SELECT Summer_Class_ID FROM `t_summer_class` WHERE Summer_Class_Code = '"+summercoode+"') and Summer_Class_Student_Display_Status = 'Active'";
			rs = stmnt.executeQuery(sql);
			JSONArray studentlist = new JSONArray();
			while(rs.next()){
				studentlist.add(rs.getString("Student_Account_Student_Number"));
			      
			}
			
			holder.put("schedule", schedulelist);
			holder.put("student", studentlist);
			out.print(holder);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
