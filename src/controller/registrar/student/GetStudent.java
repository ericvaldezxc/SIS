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

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/GetStudent")
public class GetStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudent() {
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
		String status = request.getParameter("status");
		String course = request.getParameter("course");
		Fullname fn = new Fullname();
		
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
		
		String fullname = "";	
		String fname = "";	
		String mname = "";	
		String lname = "";	
		String stat = "";	
		String couid = "";
		
		try {
			if(status.equals("Both") && course.equals("All")) {
				sql = "SELECT Student_Account_ID,Student_Account_Year,CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active' and Returnee_StudentAccountID =  Student_Account_ID ),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  group by Student_Taken_Curriculum_Subject_StudentAccountID";
				
			}
			else if(!status.equals("Both") && course.equals("All")){
				sql = "SELECT Student_Account_ID,Student_Account_Year,CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active' and Returnee_StudentAccountID =  Student_Account_ID ),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  and IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') = '"+status+"' group by Student_Taken_Curriculum_Subject_StudentAccountID ";
			}
			else if(!status.equals("Both") && !course.equals("All")){
				course = ec.encrypt(ec.key, ec.initVector, course);
				sql = "SELECT Student_Account_ID,Student_Account_Year,CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active' and Returnee_StudentAccountID =  Student_Account_ID ),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  and IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') = '"+status+"' and Course_Code = '"+course+"' group by Student_Taken_Curriculum_Subject_StudentAccountID ";
			}
			else if(status.equals("Both") && !course.equals("All")){
				course = ec.encrypt(ec.key, ec.initVector, course);
				sql = "SELECT Student_Account_ID,Student_Account_Year,CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active' and Returnee_StudentAccountID =  Student_Account_ID ),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID and Course_Code = '"+course+"' group by Student_Taken_Curriculum_Subject_StudentAccountID ";
			}

			
			PrintWriter out = response.getWriter();	
			//out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			JSONArray arr = new JSONArray();

			Statement stmnt2 = conn.createStatement();
			while(rs.next()){
				JSONObject obj = new JSONObject();

				String curyearid = rs.getString("Student_Account_CurriculumYearID");
				String studyearlvl = rs.getString("Student_Account_Year");
				String courid = rs.getString("Student_Account_CourseID");
				String fstudid = rs.getString("Student_Account_ID");
				
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				couid = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"));
				String curcode = ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Code"));
				String curdesc = ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Description"));
				String button = "";
				fullname = fn.fullname(fname, mname, lname);
				String retid = rs.getString("retid");
				String enrollstat = rs.getString("enrolledba");
				String printregi = "";
				
				
				String unitstotake = "";
				int i = 0;
				String maxunit = "0";
				ResultSet rs2 = stmnt2.executeQuery("SELECT * FROM `r_curriculum` where Curriculum_CurriculumYearID = '"+curyearid+"' and Curriculum_CourseID = '"+courid+"' and Curriculum_SemesterID = (SELECT Semester_ID FROM `r_semester` WHERE Semester_Active_Flag = 'Active' ) and Curriculum_YearLevel = '"+studyearlvl+"'");
				while(rs2.next()){
					maxunit = rs2.getString("Curriculum_Max_Credited_Unit");
				}		

				
				
				rs2 = stmnt2.executeQuery("select "+maxunit+"-IFNULL(SUM(Subject_Credited_Units),0) as unitotake from t_student_taken_curriculum_subject inner join r_subject ON Student_Taken_Curriculum_Subject_SubjectID = Subject_ID where Student_Taken_Curriculum_Subject_StudentAccountID = '"+fstudid+"' and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Taken_Curriculum_Subject_AcademicIYearID = (select Academic_Year_ID from r_academic_year where Academic_Year_Active_Flag ='Present') and Student_Taken_Curriculum_Subject_SemesterID = (select Semester_ID from r_semester where Semester_Active_Flag = 'Active') ");
				while(rs2.next()){
					unitstotake = rs2.getString("unitotake");
				}	
				
				
				
				/*
				if(enrollstat.equals("Enrolled")){
					printregi = "<a class='btn printregi' title='Print Registration Card' style='background-color:#0080ff;color:white'><i class='fa fa-print'></i></a>";
				}
				
				if(retid.equals("Not Returnee")){
					button = "<center><a class='btn btn-success schedule' data-toggle='modal' href='#Schedule'><i class='fa fa-calendar'></i></a> <a class='btn btn-cancel tar profile' style='color:white' data-toggle='modal' href='#Profile'><i class='fa fa-eye'></i></a> <a class='btn pedit' style='background-color:#33cc33;color:white' style='color:white' data-toggle='modal' href='#EditProfile'><i class='fa fa-edit'></i></a>  <a class='btn btn-warning shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'><i class='fa fa-exchange'></i></a> <a class='btn btn-info curriculum' title='Curriculum' data-toggle='modal' href='#curriculum'><i class='fa fa-flag'></i></a> "+printregi+" <a class='btn btn-danger addreturnee' title='Returnee'><i class='fa fa-rotate-right'></i></a></center>"; 
					
				}
				else{
					button = "<center><a class='btn btn-success schedule' data-toggle='modal' href='#Schedule'><i class='fa fa-calendar'></i></a> <a class='btn btn-cancel tar profile' style='color:white' data-toggle='modal' href='#Profile'><i class='fa fa-eye'></i></a> <a class='btn pedit' style='background-color:#33cc33;color:white' style='color:white' data-toggle='modal' href='#EditProfile'><i class='fa fa-edit'></i></a> <a class='btn btn-warning shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'><i class='fa fa-exchange'></i></a> <a class='btn btn-info curriculum' title='Curriculum' data-toggle='modal' href='#curriculum'><i class='fa fa-flag'></i></a> "+printregi+" <a class='btn btn-info tar returnee' title='Returnee' data-course='"+couid+"' data-toggle='modal' data-curriculum-code='"+curcode+"' href='#Returnee'><i class='fa fa-rotate-left'></i></a></center>"; 
					
				}
				
				
				*/
				
				String tdunit = "<td>Not Available</td>";
				if(enrollstat.equals("Enrolled")){
					printregi = "<li><a class='printregi' title='Print Registration Card'>Print Registration Card <i class='fa fa-print'></i></a></li>";
					tdunit = "<td>"+ unitstotake+" Units</td>";
				}
				String buttons = "<div class='btn-group' style='margin-left:0px'>"+
			    "<button data-toggle='dropdown' class='btn btn-primary dropdown-toggle ' type='button'><span><i class='fa fa-ellipsis-v'></i></span></button>"+
			    "<ul role='menu' class='dropdown-menu'>";
			       
				if(retid.equals("Not Returnee")){
					buttons = buttons + "<li><a class='schedule' data-toggle='modal' title='Student Schedule' href='#Schedule'>View Schedule <i class='fa fa-calendar'></i></a> </li><li><a class='profile' data-toggle='modal' title='View Student Profile'  href='#Profile'>View Profile <i class='fa fa-eye'></i></a> </li><li><a class='pedit'data-toggle='modal' title='Edit Student Profile'  href='#EditProfile'>Edit Profile <i class='fa fa-edit'></i></a>  </li><li><a class='shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'>Shift <i class='fa fa-exchange'></i></a> </li><li><a class='curriculum' title='Curriculum' data-toggle='modal' data-available-units-to-take='"+unitstotake+"' href='#curriculum'>Curriculum Status <i class='fa fa-flag'></i></a></li><li> "+printregi+" </li><li><a class='addreturnee' title='Returnee'>Make Returnee <i class='fa fa-rotate-right'></i></a> </li><li><a title='Print Transcript of records' class='tor' data-studnum='"+rs.getString("Student_Account_Student_Number")+"' >Print TOR <i class='fa fa-print'></i></a></li></ul></div>";
					
				}
				else{
					buttons = buttons + "<li><a class='schedule' data-toggle='modal' title='Student Schedule' href='#Schedule'>View Schedule <i class='fa fa-calendar'></i></a> </li><li><a class='profile' data-toggle='modal' title='View Student Profile'  href='#Profile'>View Profile <i class='fa fa-eye'></i></a> </li><li><a class='pedit'data-toggle='modal' title='Edit Student Profile'  href='#EditProfile'>Edit Profile <i class='fa fa-edit'></i></a>  </li><li><a class='shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'>Shift <i class='fa fa-exchange'></i></a> </li><li><a class='curriculum' title='Curriculum' data-toggle='modal' data-available-units-to-take='"+unitstotake+"' href='#curriculum'>Curriculum Status <i class='fa fa-flag'></i></a></li><li> "+printregi+" </li><li><a class='returnee' title='Returnee' data-course='"+couid+"' data-toggle='modal' data-curriculum-code='"+curcode+"' href='#Returnee'>Mark as Returnee<i class='fa fa-rotate-left'></i></a></li><li><a title='Print Transcript of records' class='tor' data-studnum='"+rs.getString("Student_Account_Student_Number")+"' >Print TOR <i class='fa fa-print'></i></a></li></ul></div>";
					
				}
				
				
				obj.put("Number", rs.getString("Student_Account_Student_Number"));
				obj.put("Name", fullname);
				obj.put("CAS", rs.getString("Section_Code"));
				obj.put("cur", curdesc);
				obj.put("status", enrollstat);
				obj.put("button", buttons);
				obj.put("units", unitstotake);
				arr.add(obj);
				
			}
			
			
			out.print(arr);
				
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
