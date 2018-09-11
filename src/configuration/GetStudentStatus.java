package configuration;

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

import connection.DBConfiguration;

/**
 * Servlet implementation class MoneyConvertion
 */
@WebServlet("/GetStudentStatus")
public class GetStudentStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudentStatus() {
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
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		String student = request.getParameter("student");

		Statement stmnt = null;
		Statement stmnt2 = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		try {
			String sql = "";

			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
			sql = "SELECT CurriculumItem_SubjectID FROM `r_curriculumitem` inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID where Curriculum_CourseID = (select Student_Account_CourseID FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"') and Curriculum_CurriculumYearID = (select Student_Account_CurriculumYearID FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"')  and Curriculum_Display_Status = 'Active' and CurriculumItem_Display_Status = 'Active' ";
			ResultSet rs = stmnt.executeQuery(sql);
			int flag = 0;
			while(rs.next()){
				String sub = rs.getString("CurriculumItem_SubjectID"); 
				String sql2 = "SELECT if('"+sub+"' in (SELECT if(ifnull(Subject_Group,0) = 0 ,Subject_ID,Subject_Group) as subid FROM `t_student_taken_curriculum_subject` inner join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID  WHERE Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and Students_Grade_Display_Status = 'Active' and Students_Grade_Grade not in ('5.00','I','D','Not S')),'Complete','NA') as stat FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"'";
				ResultSet rs2 = stmnt2.executeQuery(sql2);
				while(rs2.next()){
					if(rs2.getString("stat").equals("NA")) {
						flag = 1;
					}
					
				}
				
			}

			PrintWriter out = response.getWriter();	
//			stmnt.execute(sql);
			out.print(flag);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
