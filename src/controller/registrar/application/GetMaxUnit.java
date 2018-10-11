package controller.registrar.application;

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
 * Servlet implementation class GetDocument
 */
@WebServlet("/Registrar/Controller/Registrar/Application/GetMaxUnit")
public class GetMaxUnit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMaxUnit() {
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

		String course = request.getParameter("course");

		

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
		
		sql = "Select * from r_curriculum where Curriculum_CourseID = (SELECT Course_ID FROM `r_course` WHERE Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"') and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` where CurriculumYear_Ative_Flag = 'Active') and Curriculum_YearLevel = 'First Year' and Curriculum_SemesterID = (SELECT Semester_ID FROM `r_semester` WHERE Semester_Active_Flag = 'Active') and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` where CurriculumYear_Ative_Flag = 'Active')  ";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		//out.print(sql);
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				out.print(rs.getString("Curriculum_Max_Credited_Unit"));	
			      
			}
			

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
