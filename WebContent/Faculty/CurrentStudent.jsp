<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Faculty" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	String username = "";
	username = session.getAttribute("username").toString();
	EncryptandDecrypt ec = new EncryptandDecrypt();
	Dropdowns drp = new Dropdowns();
	String campusDrp = drp.fillcampusDrp();
	String tablebody = "";
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT DISTINCT Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name, Schedule_AcademicYearID,Professor_ID,t1.Subject_Code,t1.Subject_Description,Student_Account_Student_Number FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_subject as t1  on Student_Taken_Curriculum_Subject_SubjectID =  t1.Subject_ID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID  left join r_professor on Schedule_ProfessorID = Professor_ID  left join r_subject as t2 on t1.Subject_Group = t2.Subject_ID inner join r_section on Student_Account_SectionID = Section_ID   where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and Schedule_AcademicYearID = Academic_Year_ID and Professor_Code = '"+username+"'  ");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		if(mname.equals(""))
			fullname = lname + ", " + fname;
		else	
			fullname = lname + ", " + fname + " " +  mname;
		tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</td></tr>"; 
		
	}
	rs = stmnt.executeQuery("SELECT distinct Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Professor_Code,Subject_Code,Subject_Description,Student_Account_Student_Number FROM `t_student_taken_curriculum_subject` inner join t_schedule on Student_Taken_Curriculum_Subject_SubjectID = Schedule_ChildrenID  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID left join r_professor on Schedule_ProfessorID = Professor_ID inner join  r_subject on Student_Taken_Curriculum_Subject_SubjectID =  Subject_ID inner join r_section on Student_Account_SectionID = Section_ID  where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and Schedule_AcademicYearID = Academic_Year_ID and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Professor_Code = '"+username+"' ");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		if(mname.equals(""))
			fullname = lname + ", " + fname;
		else	
			fullname = lname + ", " + fname + " " +  mname;
		tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</td></tr>"; 

	}
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("campusDrp", campusDrp);

%>    

<t:Faculty title="Current Student" from="Student" to="Current Student">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$("#campusDrp").select2( {width: '100%' });
				
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Faculty/Schedule/Schedule.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 20%">Student Number</th>
	                                            <th style="width: 20%">Student Name</th>
	                                            <th style="width: 20%">Section</th>
	                                            <th style="width: 20%">Subject Code</th>
	                                            <th style="width: 20%">Subject Description</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>    
										    	${tablebody}
	                                    </tbody>
                                    </table>
                                </div>
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


</t:Faculty>
