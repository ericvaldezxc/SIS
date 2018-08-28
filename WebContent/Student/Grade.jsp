<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Student" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	String username = "";
	EncryptandDecrypt ec = new EncryptandDecrypt();
	Fullname fn = new Fullname();
	FinalGrade fg = new FinalGrade();
	Dropdowns drp = new Dropdowns();
	String campusDrp = drp.fillcampusDrp();
	String tablebody = "";
	String uname = "";
	if( session.getAttribute("username").toString() != null)
		 uname = session.getAttribute("username").toString(); 
	String body = "";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT distinct Semester_ID,Academic_Year_ID,Semester_Description,Academic_Year_Description,Course_Code,Course_ID,Course_Description FROM `t_student_taken_curriculum_subject` inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_course on Course_ID = Student_Taken_Curriculum_Subject_CourseID inner join t_student_account on Student_Account_ID = Student_Taken_Curriculum_Subject_StudentAccountID where Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Account_Student_Number = '"+uname+"' order by Student_Taken_Curriculum_Subject_Date_Added desc");
	while(rs.next()){
		String acadyear = rs.getString("Academic_Year_ID");
		String semester = rs.getString("Semester_ID");
		String course = rs.getString("Course_ID");
		
		body += "<section class='panel'>"+
					"<header class='panel-heading' style='background-color:#68a0b0;margin-top:10px;color:white'>"+
							"<label>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"))+ " - "+ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description")) +"</label><br/>"+
							"<label>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"))+"</label>"+
							" - <label>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</label>"+
							"<span class='tools pull-right'>"+
			        "<a href='javascript:;' class='fa fa-chevron-down' style='color:white'></a>"+
			        "</span>"+
			        "</header>"+
			        "<div class='panel-body' style='background-color:;'>";

		body += "<table class='table table-hover' id='curTbl'>"+
				"<thead>"+
				"<tr>"+
			    	"<th style='width: 15%'>Code</th>"+
			        "<th style='width: 25%'>Description</th>"+
			        "<th style='width: 15%'>Faculty Name</th>"+
			        "<th style='width: 10%'>Units</th>"+
			        "<th style='width: 15%'>Sect Code</th>"+
			        "<th style='width: 10%'>Final Grade</th>"+
			        "<th style='width: 10%'>Grade Status</th>"+
			   	"</tr>"+
			"</thead>"+
			"<tbody id='mainBody'>   ";
				ResultSet rs2 = stmnt2.executeQuery("SELECT ifnull(Students_Grade_Grade,'0') grade,Professor_FirstName,Professor_MiddleName,Professor_LastName,Professor_Code,Subject_Code,Subject_Description,Subject_Credited_Units,Section_Code FROM `t_student_taken_curriculum_subject` inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_course on Course_ID = Student_Taken_Curriculum_Subject_CourseID inner join t_student_account on Student_Account_ID = Student_Taken_Curriculum_Subject_StudentAccountID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID INNER JOIN r_section on Student_Taken_Curriculum_Subject_SectionID = Section_ID inner join r_curriculum on Curriculum_CourseID = Student_Taken_Curriculum_Subject_CourseID inner join r_curriculumitem on CurriculumItem_SubjectID = if(ifnull(Subject_Group,0)=0,Subject_ID,Subject_Group) inner join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID left join r_professor on Schedule_ProfessorID = Professor_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID where Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Curriculum_YearLevel = Student_Taken_Curriculum_Subject_YearLevel and CurriculumItem_CurriculumID = Curriculum_ID and if(Schedule_ChildrenID is null,'0',Schedule_ChildrenID) = if(Schedule_ChildrenID is null,'0',Subject_ID) and Schedule_SectionID = Student_Taken_Curriculum_Subject_SectionID and Schedule_AcademicYearID = Student_Taken_Curriculum_Subject_AcademicIYearID  and Student_Account_Student_Number = '"+uname+"' and Course_ID = '"+course+"' and Student_Taken_Curriculum_Subject_SemesterID = '"+semester+"' and Student_Taken_Curriculum_Subject_AcademicIYearID = '"+acadyear+"' ");
				while(rs2.next()){
					String fname = ec.decrypt(ec.key, ec.initVector, rs2.getString("Professor_FirstName"));
					String mname = ec.decrypt(ec.key, ec.initVector, rs2.getString("Professor_MiddleName"));
					String lname = ec.decrypt(ec.key, ec.initVector, rs2.getString("Professor_LastName"));
					String grade = rs2.getString("grade");
					if(rs2.getString("grade").equals("0")){
						grade = "";
					}
					String fullname = fn.fullname(fname, mname, lname);
					body += "<tr>"+
							"<td>"+ ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code"))+"</td>"+
							"<td>"+ ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Description"))+"</td>"+
							"<td>"+ fullname+"</td>"+
							"<td>"+ rs2.getString("Subject_Credited_Units")+"</td>"+
							"<td>"+ rs2.getString("Section_Code")+"</td>"+
							"<td>"+ grade+
							"<td>"+ fg.finalGrade(rs2.getString("grade"))+"</td>"+
							"</tr>";
							
					
				}
				
		        body += "</tbody>"+
			"</table>";
			
        body +=  "</div>"+
    		"</section>";

	}

	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("campusDrp", campusDrp);
	pageContext.setAttribute("body", body);
	

%>    

<t:Student title="Grade" from="Grade" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Student/Schedule/Schedule.js"></script>
    
        <div class="row">
            <div class="col-sm-12">
            	<section class="panel">
                	<div class="panel-body">
                      	${body}
                	</div>
               	</section>
            </div>
         </div>

         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="Add" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Room</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                        		<div class="col-lg-4">
		                                 Code <input type="text" class="form-control" placeholder="ex. Acad 202" id="codeTxt" >
		                            </div>
	                        		<div class="col-lg-8">
		                        		Campus
			                            <select class="populate " id="campusDrp">
					                  	    <option value="default" selected="selected" disabled="disabled" >Select a Campus</option>                            	       	
				                  			${campusDrp}      	
				                		</select>
		                            </div>
		                        	<div class="col-lg-12" style="padding-top:10px">
		                                Description<textarea class="form-control" placeholder="ex.  Academic Building 202" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="descTxt"></textarea>
		                            </div>		                        	
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button">Close</button>
	                    <button class="btn btn-success " id="addBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>	

	    </jsp:body>


</t:Student>
