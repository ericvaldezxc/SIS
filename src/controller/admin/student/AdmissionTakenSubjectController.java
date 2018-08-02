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
 * Servlet implementation class AdmissionTakenSubjectController
 */
@WebServlet("/Admin/Controller/Admin/Student/AdmissionTakenSubjectController")
public class AdmissionTakenSubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmissionTakenSubjectController() {
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

		String sub = request.getParameter("sub");
		String taken = request.getParameter("taken");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "insert into t_student_taken_curriculum_subject (Student_Taken_Curriculum_Subject_SubjectID,Student_Taken_Curriculum_Subject_StudentAccountID,Student_Taken_Curriculum_Subject_Taken_Status,Student_Taken_Curriculum_Subject_SemesterID,Student_Taken_Curriculum_Subject_AcademicIYearID) values ((SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, sub)+"'),(SELECT Student_Account_ID FROM t_student_account ORDER BY Student_Account_Date_Added DESC LIMIT 1),'"+taken+"',(SELECT Active_Semester_SemesterID FROM r_active_semester WHERE Active_Semester_Flag = 'Active' and Active_Semester_Display_Status = 'Active'),(SELECT Active_Academic_Year_AcademicYearID FROM r_active_academic_year WHERE Active_Academic_Year_Flag = 'Active' and Active_Academic_Year_Display_Status = 'Active'))";

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
