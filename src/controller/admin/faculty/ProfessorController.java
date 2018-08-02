package controller.admin.faculty;

import java.io.IOException;
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
 * Servlet implementation class ProfessorController
 */
@WebServlet("/Admin/Controller/Admin/Faculty/ProfessorController")
public class ProfessorController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfessorController() {
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

		String fname = request.getParameter("fnameTxt");
		String mname = request.getParameter("mnameTxt");
		String lname = request.getParameter("lnameTxt");
		String desc = request.getParameter("descTxt");

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
			sql = "INSERT INTO `r_professor` (Professor_Code,Professor_FirstName,Professor_MiddleName,Professor_LastName,Professor_Description) VALUES ((SELECT concat(YEAR(NOW()),'-',right(count(*)+100001,5),'-CM') FROM (SELECT * FROM `r_professor`) AS T1 WHERE LEFT(T1.Professor_Code,4) = YEAR(NOW())),'"+ec.encrypt(ec.key, ec.initVector, fname)+"','"+ec.encrypt(ec.key, ec.initVector, mname)+"','"+ec.encrypt(ec.key, ec.initVector, lname)+"','"+ec.encrypt(ec.key, ec.initVector, desc)+"')";
		try {
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
