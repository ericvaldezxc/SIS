package controller.admin.curriculum;
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
 * Servlet implementation class SubjectController
 */
@WebServlet("/Admin/Controller/Admin/Curriculum/SubjectController")
public class SubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectController() {
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

		String code = request.getParameter("codeTxt");
		String desc = request.getParameter("descTxt");
		
		String subject = request.getParameter("subject");
		String lecunit = request.getParameter("lecunit");
		String labunit = request.getParameter("labunit");
		String credunit = request.getParameter("credunit");
		String lechrs = request.getParameter("lechrs");
		String labhrs = request.getParameter("labhrs");
		String tuihrs = request.getParameter("tuihrs");

		 

		String latcode = request.getParameter("latcode");
		String acadtype = request.getParameter("acadtype");
		String type = request.getParameter("type");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		PrintWriter out = response.getWriter();
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		 
		String sql = "";
		if(type.equals("Insert"))
			sql = "Insert into r_subject (Subject_Code,Subject_Description,Subject_Lecture_Units,Subject_Laboratory_Units,Subject_Lecture_Hours,Subject_Laboratory_Hours,Subject_Tuition_Hours,Subject_Type,Subject_Group,Subject_Credited_Units) values ('"+ec.encrypt(ec.key, ec.initVector, code)+"','"+ec.encrypt(ec.key, ec.initVector, desc)+"',"+lecunit +","+labunit +","+ lechrs+","+labhrs +","+tuihrs +",'"+ acadtype+"',(select case when '"+subject+"' = '0' then '0' else (SELECT t2.Subject_ID FROM (select * from r_subject) as t2 WHERE t2.Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject) +"') end as grp),"+credunit +")";
	//	else if(type.equals("Update"))
	//		sql = "Update r_subject set Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"',Subject_Description = '"+ec.encrypt(ec.key, ec.initVector, desc)+"',Subject_Units = '"+unit+"' where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
///		else if(type.equals("Delete"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Inactive'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
//		else if(type.equals("Retrieve"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Active'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
		out.print(sql);
		
		try {
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
