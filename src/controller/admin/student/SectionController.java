package controller.admin.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class SectionController
 */
@WebServlet("/Admin/Controller/Admin/Student/SectionController")
public class SectionController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SectionController() {
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

		String code = request.getParameter("code");
		String year = request.getParameter("year");
		String section = request.getParameter("section");
		String course = request.getParameter("course");
		String campus = request.getParameter("campus");

		
		String latcode = request.getParameter("latcode");
		String type = request.getParameter("type");
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
		if(type.equals("Insert"))			
			sql = "insert into r_section (Section_Code,Section_Section,Section_Year,Section_CourseID,Section_CampusID) values ('"+code+"','"+section+"','"+year+"',(SELECT Course_ID FROM r_course WHERE Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"' ),(SELECT Campus_ID FROM r_campus WHERE Campus_Code = '"+ec.encrypt(ec.key, ec.initVector, campus)+"' ))";
//		else if(type.equals("Update"))
//			sql = "UPDATE r_section set Section_CurriculumID = (SELECT Curriculum_ID FROM r_curriculum WHERE Curriculum_CODE = '"+ec.encrypt(ec.key, ec.initVector, curriculum)+"' ),Section_Code = '"+ec.encrypt(ec.key, ec.initVector, cas)+"',Section_Description = '"+ec.encrypt(ec.key, ec.initVector, desc)+"',Section_Section = '"+ec.encrypt(ec.key, ec.initVector, section)+"',Section_Year = '"+year+"',Section_CourseID = (SELECT Course_ID FROM r_course WHERE Course_CODE = '"+ec.encrypt(ec.key, ec.initVector, course)+"' ) where Section_Code =  '"+ec.encrypt(ec.key, ec.initVector, latcode)+"' ";
//		else if(type.equals("Delete"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Inactive'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
//		else if(type.equals("Retrieve"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Active'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
		
		try {
			PrintWriter out = response.getWriter();	
			out.print(sql);
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
