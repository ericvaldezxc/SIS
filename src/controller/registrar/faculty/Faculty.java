package controller.registrar.faculty;

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
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/Registrar/Controller/Registrar/Faculty/Faculty")
public class Faculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Faculty() {
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
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();

		JSONArray degree = new JSONArray();
		JSONArray subject = new JSONArray();
		
		Object object = null;
		Object object2 = null;
		JSONParser jsonParser=new JSONParser();
		String fname = request.getParameter("fname");
		String mname = request.getParameter("mname");
		String lname = request.getParameter("lname");
		String latcode = request.getParameter("latcode");
		String type = request.getParameter("type");
		
		try {
			object=jsonParser.parse(request.getParameter("degree"));
			object2=jsonParser.parse(request.getParameter("subject"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		degree=(JSONArray) object;
		subject=(JSONArray) object2;
		
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
		
		PrintWriter out = response.getWriter();			
		try {
			if(type.equals("Insert")){
				sql = "INSERT INTO `r_professor` (Professor_Code,Professor_FirstName,Professor_MiddleName,Professor_LastName) VALUES ((SELECT concat(YEAR(NOW()),'-',right(count(*)+100001,5)) FROM (SELECT * FROM `r_professor`) AS T1 WHERE LEFT(T1.Professor_Code,4) = YEAR(NOW())),'"+ec.encrypt(ec.key, ec.initVector, fname)+"','"+ec.encrypt(ec.key, ec.initVector, mname)+"','"+ec.encrypt(ec.key, ec.initVector, lname)+"')";
				stmnt.execute(sql);
				String prof = "";
				sql = "select Professor_Code from r_professor where Professor_ID =  (select max(Professor_ID) from r_professor )";
				ResultSet rs = stmnt.executeQuery(sql);
				while(rs.next()){
					prof = ec.encrypt(ec.key, ec.initVector,  rs.getString("Professor_Code")) ;
				      
				}
				
				sql = "INSERT INTO `r_user_account` (User_Account_Reference,User_Account_Type,User_Account_Username,User_Account_Password) VALUES ((select max(Professor_ID) from r_professor),'Faculty','"+prof+"','"+prof+"')";
				stmnt.execute(sql);

				
				for (Object o : degree) {
					sql = "INSERT INTO `r_faculty_degree` (Faculty_Degree_DegreeID,Faculty_Degree_ProfessorID) VALUES ((select Degree_ID from r_degree where Degree_Code = '"+o+"' ),(select max(Professor_ID) from r_professor))";
					stmnt.execute(sql);
				}
				for (Object o : subject) {
					sql = "INSERT INTO `r_faculty_subject` (Faculty_Subject_SubjectID,Faculty_Subject_ProfessorID) VALUES ((select Subject_ID from r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, o.toString())+"' ),(select max(Professor_ID) from r_professor))";
					stmnt.execute(sql);
				}
			}
			else if(type.equals("Update")) {
				sql = "update `r_professor` set Professor_FirstName = '"+ec.encrypt(ec.key, ec.initVector, fname)+"' ,Professor_MiddleName = '"+ec.encrypt(ec.key, ec.initVector, mname)+"' ,Professor_LastName = '"+ec.encrypt(ec.key, ec.initVector, lname)+"' where Professor_Code = '"+latcode+"'";
				stmnt.execute(sql);
				
				sql = "update `r_faculty_degree` set Faculty_Degree_Display_Status = 'Inactive' where Faculty_Degree_ProfessorID = (select Professor_ID from r_professor where Professor_Code = '"+latcode+"') ";
				stmnt.execute(sql);
				
				sql = "update `r_faculty_subject` set Faculty_Subject_Display_Status = 'Inactive' where Faculty_Subject_ProfessorID = (select Professor_ID from r_professor where Professor_Code = '"+latcode+"') ";
				stmnt.execute(sql);
				
				ResultSet rs = null;
				for (Object o : subject) {
					sql = "select count(*) as cou from r_faculty_subject where Faculty_Subject_SubjectID =  (select Subject_ID from r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, o.toString())+"' ) and Faculty_Subject_ProfessorID = (select Professor_ID from r_professor where Professor_Code = '"+latcode+"')";
					out.print(sql+"\n");
					rs = stmnt.executeQuery(sql);
					while(rs.next()){
						if(rs.getString("cou").equals("0")) {
							sql = "INSERT INTO `r_faculty_subject` (Faculty_Subject_SubjectID,Faculty_Subject_ProfessorID) VALUES ((select Subject_ID from r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, o.toString())+"' ),(select Professor_ID from r_professor where Professor_Code = '"+latcode+"'))";
							out.print(sql+"\n");
							stmnt2.execute(sql);
							
						}else {
							sql = "update `r_faculty_subject` set Faculty_Subject_Display_Status = 'Active' where Faculty_Subject_ProfessorID = (select Professor_ID from r_professor where Professor_Code = '"+latcode+"') and Faculty_Subject_SubjectID = (select Subject_ID from r_subject where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, o.toString())+"' ) ";
							out.print(sql+"\n");
							stmnt2.execute(sql);
							
						}
//					      
					}
					

				}
				for (Object o : degree) {
					sql = "select count(*) as cou from r_faculty_degree where Faculty_Degree_DegreeID =  (select Degree_ID from r_degree where Degree_Code = '"+o+"' ) and Faculty_Degree_ProfessorID = (select Professor_ID from r_professor where Professor_Code = '"+latcode+"')";
					out.print(sql+"\n");
					rs = stmnt.executeQuery(sql);
					while(rs.next()){
						if(rs.getString("cou").equals("0")) {
							sql = "INSERT INTO `r_faculty_degree` (Faculty_Degree_DegreeID,Faculty_Degree_ProfessorID) VALUES ((select Degree_ID from r_degree where Degree_Code = '"+o+"' ),(select Professor_ID from r_professor where Professor_Code = '"+latcode+"'))";
							stmnt2.execute(sql);
							out.print(sql+"\n");
							
						}else {
							sql = "update `r_faculty_degree` set Faculty_Degree_Display_Status = 'Active' where Faculty_Degree_ProfessorID = (select Professor_ID from r_professor where Professor_Code = '"+latcode+"') and Faculty_Degree_DegreeID = (select Degree_ID from r_degree where Degree_Code = '"+o+"' ) ";
							stmnt2.execute(sql);
							out.print(sql+"\n");
							
						}
					      
					}
				}
				
			
				
				
				
				
			}
			
			

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
