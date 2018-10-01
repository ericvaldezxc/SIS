package controller.registrar.student;

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
 * Servlet implementation class Application
 */
@WebServlet("/Registrar/Controller/Registrar/Student/EducationalAttainment")
public class EducationalAttainment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EducationalAttainment() {
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
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		try {
			object=jsonParser.parse(request.getParameter("educattainment"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		JSONArray educattainment = new JSONArray();
		educattainment=(JSONArray) object;
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		PrintWriter out = response.getWriter();	
		try {
			for (Object o : educattainment) {
				JSONObject jsonLineItem = (JSONObject) o;
		        String studnum = (String) jsonLineItem.get("studnum");
		        String type = (String) jsonLineItem.get("type");
		        String school = (String) jsonLineItem.get("school");
		        String schoollevel = (String) jsonLineItem.get("schoollevel");
		        String course = (String) jsonLineItem.get("course");
		        String address = (String) jsonLineItem.get("address");
		        String incyear = (String) jsonLineItem.get("incyear");
//educattainmentlist.push({studnum:getlateststudnum,type:rowval,school:school,schoollevel:schoollevel,course:course,address:address,incyear:incyear});

		        if(type.equals("None")) {
			        sql = "Insert into r_educational_attainment (Educational_Attainment_School_Course,Educational_Attainment_School,Educational_Attainment_School_Level,Educational_Attainment_Address,Educational_Attainment_Inclusive_Year,Educational_Attainment_StudentAccountID) values ('"+course+"','"+school+"','"+schoollevel+"','"+address+"','"+incyear+"',(SELECT Student_Account_ID FROM `t_student_account` where Student_Account_Student_Number = '"+studnum+"'))";
					out.print(sql);
					stmnt.execute(sql);
		        	
		        }
		        else {
		        	sql = "update r_educational_attainment set Educational_Attainment_School_Course='"+course+"',Educational_Attainment_School = '"+school+"',Educational_Attainment_School_Level = '"+schoollevel+"' ,Educational_Attainment_Address = '"+address+"',Educational_Attainment_Inclusive_Year = '"+incyear+"',Educational_Attainment_StudentAccountID = (SELECT Student_Account_ID FROM `t_student_account` where Student_Account_Student_Number = '"+studnum+"') where Educational_Attainment_ID = '"+type+"'";
					out.print(sql);
					stmnt.execute(sql);
		        	
		        }
    
			}

			
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
