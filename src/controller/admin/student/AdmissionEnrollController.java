package controller.admin.student;

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
 * Servlet implementation class AdmissionEnrollController
 */
@WebServlet("/Admin/Controller/Admin/Student/AdmissionEnrollController2")
public class AdmissionEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmissionEnrollController() {
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

		String studentid = request.getParameter("studentid");
		String CourseDrp = request.getParameter("CourseDrp");
		String YearDrp = request.getParameter("YearDrp");
		String SectionDrp = request.getParameter("SectionDrp");

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
		sql = "SELECT CONCAT(YEAR(CURRENT_DATE),'-',RIGHT(COUNT(*)+100001,5),'-CM-0') AS STUDNUM FROM `t_student_account` where LEFT(Student_Account_Student_Number,4) = YEAR(CURRENT_DATE) ";
		String studnum="";
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				studnum = rs.getString("STUDNUM");
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql = "insert into `t_student_account` (Student_Account_Student_Profile_ID,Student_Account_Student_Number,Student_Account_Scholastic_Status,Student_Account_Year,Student_Account_CourseID,Student_Account_SectionID) values ('"+studentid+"','"+studnum+"','Regular','"+YearDrp+"',(SELECT Course_ID FROM r_course WHERE Course_Code = '"+ec.encrypt(ec.key, ec.initVector, CourseDrp)+"'),(SELECT Section_ID FROM r_section WHERE Section_Section = '"+ec.encrypt(ec.key, ec.initVector, SectionDrp)+"' AND Section_CourseID = (SELECT Course_ID FROM r_course WHERE Course_Code = '"+ec.encrypt(ec.key, ec.initVector, CourseDrp)+"') AND Section_Year = '"+YearDrp+"'))";
		PrintWriter out = response.getWriter();	
		out.print(sql);
		try {
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
