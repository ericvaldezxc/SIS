package controller.admin.curriculum;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;
/**
 * Servlet implementation class Curriculum
 */
@WebServlet("/Admin/Controller/Admin/Curriculum/CurriculumController")
public class CurriculumController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumController() {
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
		EncryptandDecrypt ec = new EncryptandDecrypt();
		response.setContentType("text/plain");
		String code = request.getParameter("codeTxt");
		String semTxt = request.getParameter("semTxt");
		String course = request.getParameter("course");
		String curyear = request.getParameter("curyear");
		
		String yearlvl = request.getParameter("yearlvl");
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
		LocalDateTime now = LocalDateTime.now();
		String year =  (dtf.format(now));
		

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

		PrintWriter out = response.getWriter();	

		try {
			String sql = "";
//			sql = "Insert into r_curriculum (Curriculum_Code,Curriculum_SemesterID,Curriculum_CourseID,Curriculum_YearLevel) values ('"+ec.encrypt(ec.key, ec.initVector, year + '-'+code) +"',(SELECT Semester_ID from r_semester WHERE Semester_Code = '"+ec.encrypt(ec.key, ec.initVector, semTxt)+"'),(SELECT Course_ID from r_course WHERE Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"'),'"+yearlvl+"')";
			if(type.equals("Insert")) {
//				sql = "Update r_curriculum set Curriculum_Active_Flag = 'Inactive' where Curriculum_SemesterID = (SELECT Semester_ID from r_semester WHERE Semester_Code = '"+ec.encrypt(ec.key, ec.initVector, semTxt)+"') and Curriculum_CourseID = (SELECT Course_ID from r_course WHERE Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"') and Curriculum_YearLevel = '"+yearlvl+"'";
				
//				stmnt.execute(sql);
				sql = "Insert into r_curriculum (Curriculum_Code,Curriculum_SemesterID,Curriculum_CourseID,Curriculum_YearLevel,Curriculum_CurriculumYearID) values ('"+ec.encrypt(ec.key, ec.initVector, year+"-"+code) +"',(SELECT Semester_ID from r_semester WHERE Semester_Code = '"+ec.encrypt(ec.key, ec.initVector, semTxt)+"'),(SELECT Course_ID from r_course WHERE Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"'),'"+yearlvl+"',(SELECT CurriculumYear_ID from r_curriculumyear WHERE CurriculumYear_Code = '"+ec.encrypt(ec.key, ec.initVector, curyear)+"'))";
				out.print(sql);
				stmnt.execute(sql);

			}
			else if(type.equals("Update")) {
				sql = "Update r_curriculum set Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"',Curriculum_SemesterID = (SELECT Semester_ID from r_semester WHERE Semester_Code = '"+ec.encrypt(ec.key, ec.initVector, semTxt)+"') where Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"';";
				stmnt.execute(sql);
				sql = " Update r_curriculumitem SET CurriculumItem_Display_Status = 'Inactive' where CurriculumItem_CurriculumID = (SELECT Curriculum_ID FROM r_curriculum WHERE Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"' );";
				stmnt.execute(sql);
			}
			else if(type.equals("Delete")) {
				sql = "Update r_curriculum set Curriculum_Display_Status = 'Inactive'  where Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
				stmnt.execute(sql);

			}
			else if(type.equals("Retrieve")) {
				sql = "Update r_curriculum set Curriculum_Display_Status = 'Active'  where Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
				stmnt.execute(sql);

			}
			out.print(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
