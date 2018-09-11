<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Registrar" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	
	EncryptandDecrypt ec = new EncryptandDecrypt();
	Dropdowns drp = new Dropdowns();
	
	String tablebody = "";
	
	String firstCol = "";
	String firstCol2 = "";
	
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	String status = "";	
	String subjectDrp = "";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	Statement stmnt3 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID where Student_Account_ID not in (SELECT Graduate_StudentAccountID FROM `t_graduate` WHERE Graduate_Display_Status = 'Active') and Student_Account_Display_Status = 'Active'  group by Student_Taken_Curriculum_Subject_StudentAccountID");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		
		String student = rs.getString("Student_Account_Student_Number");
		String sql = "SELECT CurriculumItem_SubjectID FROM `r_curriculumitem` inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID where Curriculum_CourseID = (select Student_Account_CourseID FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"') and Curriculum_CurriculumYearID = (select Student_Account_CurriculumYearID FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"')  and Curriculum_Display_Status = 'Active' and CurriculumItem_Display_Status = 'Active' ";
		ResultSet rs2 = stmnt2.executeQuery(sql);
		int flag = 0;
		while(rs2.next()){
			String sub = rs2.getString("CurriculumItem_SubjectID"); 
			String sql2 = "SELECT if('"+sub+"' in (SELECT if(ifnull(Subject_Group,0) = 0 ,Subject_ID,Subject_Group) as subid FROM `t_student_taken_curriculum_subject` inner join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID  WHERE Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and Students_Grade_Display_Status = 'Active' and Students_Grade_Grade not in ('5.00','I','D','Not S')),'Complete','NA') as stat FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"'";
			ResultSet rs3 = stmnt3.executeQuery(sql2);
			while(rs3.next()){
				if(rs3.getString("stat").equals("NA")) {
					flag = 1;
				}
				
			}
			
		}
		
		
		if(flag == 0)
			tablebody += "<tr><td>"+ student +"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td style='text-align:center'> <a class='btn btn-success schedule' data-toggle='modal' href='#Schedule'><i class='fa fa-calendar'></i></a> <a class='btn btn-info curriculum' data-toggle='modal' href='#curriculum'><i class='fa fa-flag'></i></a>  </td></tr>"; 
		
		
		
		
	}

	pageContext.setAttribute("tablebody", tablebody);
	
	
%>    

<t:Registrar title="Graduating Student" from="Graduating Student" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="../Assets/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="../Assets/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
		<script type="text/javascript" src="../Assets/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.multi-select.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Student/Student.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#CurriculumAdd">
                                        Add New <i class="fa fa-plus"></i>
                                    </button>
                                        </div>
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 30%">Student Number</th>
	                                            <th style="width: 30%">Name</th>
	                                            <th style="width: 30%">Course and Section</th>
	                                            <th style="width: 10%">Action</th>  
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="CurriculumAdd" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Summer Class</h4>
	                </div>
	                <div class="modal-body">
	               		<div class="row">
					    	<div class="col-lg-6">
						    	Subject
			               		<select class="populate" style="width: 300px" id="subDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Subject</option>
						   			${subjectDrp}											   				
                                </select>
							</div>
						</div>
						<div class="row" style="margin-top:10px">
							<div class="col-lg-6">
						    	Faculty
			               		<select class="populate" style="width: 300px" id="facDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Faculty</option>
						   			${facultyDrp}											   				
                                </select>
							</div>
					    	<div class="col-lg-6">
		                		Campus
			               		<select class="populate" style="width: 300px" id="camDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Campus</option>
						   			${camDrp}											   				
                                </select>
					        </div>
					    </div>
                        <div class="row" style="margin-top:10px">
					    	<div class="col-lg-12">
		                		Student 
					        	<select class="multi-select" multiple="" id="studDrp">
					            	${studentDrp}
					            </select>
					        </div>
	                	</div>
	                	<div class="row" style="margin-top:10px">
                        	<div class="col-lg-12">
	                        		<table class="table table-hover" id="curTbl">
				                		<thead>
				                    		<tr>
				                        		<th style="width: 20%"">Day</th>
				                            	<th style="width: 20%"">Time Start</th>
				                         	    <th style="width: 20%">Time End</th>
				                            	<th style="width: 25%">Room</th>
				                            	<th style="width: 5%">Action</th>
				                       	</tr>
				                    </thead>
				                    <tbody id="schedmainBody">   
				                    	<tr>
				                    		<td colspan="5" style="text-align:center;font-weight:bold;font-style:italic;">No Data Available</td>
				                    	</tr>
				                    </tbody>
				               </table>	                        	
				               <a class="btn btn-success " id="addItem" href="javascript:;"><i class="fa fa fa-plus"></i></a>
                        	</div>
                        </div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="addBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Edit" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Edit Summer Class</h4>
	                </div>
	                <div class="modal-body">
	               		<div class="row">
					    	<div class="col-lg-6">
						    	Subject
			               		<select class="populate" style="width: 300px" id="updsubDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Subject</option>
						   			${subjectDrp}											   				
                                </select>
							</div>
						</div>
						<div class="row" style="margin-top:10px">
							<div class="col-lg-6">
						    	Faculty
			               		<select class="populate" style="width: 300px" id="updfacDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Faculty</option>
						   			${facultyDrp}											   				
                                </select>
							</div>
					    	<div class="col-lg-6">
		                		Campus
			               		<select class="populate" style="width: 300px" id="updcamDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Campus</option>
						   			${camDrp}											   				
                                </select>
					        </div>
					    </div>
                        <div class="row" style="margin-top:10px">
					    	<div class="col-lg-12">
		                		Student 
					        	<select class="multi-select" multiple="" id="updstudDrp">
					            	${studentDrp}
					            </select>
					        </div>
	                	</div>
	                	<div class="row" style="margin-top:10px">
                        	<div class="col-lg-12">
	                        		<table class="table table-hover" id="">
				                		<thead>
				                    		<tr>
				                        		<th style="width: 20%"">Day</th>
				                            	<th style="width: 20%"">Time Start</th>
				                         	    <th style="width: 20%">Time End</th>
				                            	<th style="width: 25%">Room</th>
				                            	<th style="width: 5%">Action</th>
				                       	</tr>
				                    </thead>
				                    <tbody id="updschedmainBody">   
				                    	<tr>
				                    		<td colspan="5" style="text-align:center;font-weight:bold;font-style:italic;">No Data Available</td>
				                    	</tr>
				                    </tbody>
				               </table>	                        	
				               <a class="btn btn-success " id="updItem" href="javascript:;"><i class="fa fa fa-plus"></i></a>
                        	</div>
                        </div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="updBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	        
	    </jsp:body>


</t:Registrar>
