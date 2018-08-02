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
 * Servlet implementation class CourseController
 */
@WebServlet("/Admin/Controller/Admin/Student/CourseController")
public class CourseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseController() {
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
		String yeartxt = request.getParameter("yeartxt");
		
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
			sql = "Insert into r_course (Course_Code,Course_Description,Course_Years) values ('"+ec.encrypt(ec.key, ec.initVector, code)+"','"+ec.encrypt(ec.key, ec.initVector, desc)+"','"+yeartxt+"')";
		else if(type.equals("Update"))
			sql = "Update r_subject set Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"',Subject_Description = '"+ec.encrypt(ec.key, ec.initVector, desc)+"' where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
		else if(type.equals("Delete"))
			sql = "Update r_subject set Subject_Display_Stat = 'Inactive'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
		else if(type.equals("Retrieve"))
			sql = "Update r_subject set Subject_Display_Stat = 'Active'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
		
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
