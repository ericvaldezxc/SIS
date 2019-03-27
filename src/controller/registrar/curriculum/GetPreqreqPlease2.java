package controller.registrar.curriculum;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
 * Servlet implementation class CurriculumViewItemController
 */
@WebServlet("/Registrar/Controller/Registrar/Curriculum/GetPreqreqPlease2")
public class GetPreqreqPlease2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPreqreqPlease2() {
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
		response.setContentType("plain/text");
		EncryptandDecrypt ec = new EncryptandDecrypt();
		String latcode = request.getParameter("latcode");
		String course = request.getParameter("course");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		Statement stmnt2 = null;
		try {
			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		sql = "SELECT ifnull((select tbl3.Subject_Code from r_subject as tbl3 where Subject_ID = ifnull(CurriculumItem_prereq,'') ),'default') as res from r_curriculumitem  inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID where CurriculumItem_SubjectID = (SELECT T2.Subject_ID FROM r_subject AS T2 where T2.Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"') and Curriculum_CourseID = (SELECT Course_ID FROM r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"')  and Curriculum_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` WHERE `CurriculumYear_Ative_Flag` = 'Active ') ";
		//sql = "select * from r_curriculumitem inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID where CurriculumItem_SubjectID = (SELECT T2.Subject_ID FROM r_subject AS T2 where T2.Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"') ";
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		String subcode = "default";
//		out.print(sql);
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				subcode = rs.getString("res");
				if(subcode != "default")
					subcode = ec.decrypt(ec.key, ec.initVector, subcode);			
			}
			conn.close();
			
			out.print(subcode);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		
//		 List<String> list = new ArrayList<String>();
//		    list.add("item1");
//		    list.add("item2");
//		    list.add("item3");	
//		    
//		    
	
	}

}
