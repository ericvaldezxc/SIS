<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Admin" %>
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
	String curDrp = "";
	String courseDrp = drp.fillcourseDrp();

	String firstCol = "";
	String firstCol2 = "";
	
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	String status = "";	
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT *,if(Student_Profile_ID not in (SELECT Student_Account_Student_Profile_ID from t_student_account WHERE Student_Account_Display_Status = 'Active'),'Ready for Admission','Freshman') as status FROM `r_student_profile`  ");
		while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
			status = rs.getString("status");
			if(mname.equals(""))
				fullname = lname + ", " + fname;
			else	
				fullname = lname + ", " + fname + " " +  mname;
			
			tablebody += "<tr><td>" + fullname +"</td><td>"+status+"</td><td>"; 
			if(rs.getString("Student_Profile_Display_Status").equals("Active") && rs.getString("status").equals("Freshman"))
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#AdmissionEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-warning admission' data-toggle='modal' data-studentid='"+rs.getString("Student_Profile_ID")+"' href='#Admission'><i class='fa  fa-folder-open-o'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else if(rs.getString("Student_Profile_Display_Status").equals("Active") && rs.getString("status").equals("Ready for Admission"))
					tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#AdmissionEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-info admission' data-toggle='modal' data-studentid='"+rs.getString("Student_Profile_ID")+"' href='#Admission'><i class='fa fa-briefcase'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
		rs = stmnt.executeQuery("Select Course_Code,Course_Description from r_course WHERE Course_Display_Status = 'Active'");
		while(rs.next()){
			courseDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</option>";
		}
		rs = stmnt.executeQuery("Select Curriculum_Code from r_curriculum WHERE Curriculum_Display_Status = 'Active'");
		while(rs.next()){
			curDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Curriculum_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Curriculum_Code"))+"</option>";
		}

	

	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courseDrp", courseDrp);	

%>    

<t:Admin title="Admission" from="Student Setup" to="Admission">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
//				alert(window.location.hostname+":"+window.location.port+"/")
//				$('#yearhidden').hide()
				EditableTable.init();
				$("select.fee").select2();
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Admin/StudentSetup/Admission.js"></script>
    
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
	                                            <th style="width: 20%">Name</th>
	                                            <th style="width: 30%">Admission Status</th>
	                                            <th style="width: 20%">Action</th>  
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="CurriculumAdd" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Student Profile</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row">
                        		<div class="col-lg-4">
	                                Firstname <input type="text" class="form-control" placeholder="ex. Juan" id="firstNameTxt" >
	                            </div>
                        		<div class="col-lg-4">
	                                Middlename <input type="text" class="form-control" placeholder="ex. Protacio" id="middleNameTxt" >
	                            </div>
                        		<div class="col-lg-4">
	                                Lastname <input type="text" class="form-control" placeholder="ex. Dela Cruz" id="lastNameTxt" >
	                            </div>
                       		</div>
                   		    <div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Contact Number<input type="text" maxlength="11" class="form-control" placeholder="ex. 09xxxxxxxxx"  id="conTxt" >
	                            </div>
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Email Address  <input type="text" class="form-control" placeholder="ex. juandelacruz@domain.com" id="emailTxt" >
	                            </div>
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Date of Birth <input type="date" class="form-control"  id="dobTxt" >
	                            </div>
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Place of Birth <input type="text" class="form-control" placeholder="ex. Quezon City" id="pobTxt" >
	                            </div>
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                        		Gender
	                                <select class="form-control" style="width: 300px" id="genderDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Gender</option>
						   				<option value="Male">Male</option>
						   				<option value="Female">Female</option>
                                    </select>
	                            </div>
	                        	<div class="col-lg-6" style="padding-top:10px">
	                        		Civil Status
	                                <select class="form-control" style="width: 300px" id="civilDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Civil Status</option>
						   				<option value="Single">Single</option>
						   				<option value="Married">Married</option>
						   				<option value="Widowed">Widowed</option>
						   				<option value="Divorced">Divorced</option>
                                    </select>	                            
                                </div>
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-12" style="padding-top:10px">
	                                Address <textarea class="form-control" placeholder="ex. Don fabian st. Commonwealth Quezon City" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="addressTxt"></textarea>
	                            </div>	  
                        	</div>                              	
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="addBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="SectionEdit" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Code" >Edit Student Profile</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row">
                        		<div class="col-lg-4">
	                                Firstname <input type="text" class="form-control" placeholder="ex. Juan" id="updfirstNameTxt" >
	                            </div>
                        		<div class="col-lg-4">
	                                Middlename <input type="text" class="form-control" placeholder="ex. Protacio" id="updmiddleNameTxt" >
	                            </div>
                        		<div class="col-lg-4">
	                                Lastname <input type="text" class="form-control" placeholder="ex. Dela Cruz" id="updlastNameTxt" >
	                            </div>
                       		</div>
                        	<div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Course
                             		<select class="form-control" style="width: 300px" id="UpdCourseDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Course</option>
						   				${courseDrp}											   				
                                    </select>
	                            </div>
	                            <div class="col-lg-6" style="padding-top:10px">
	                                Curriculum
                             			<select class="form-control" style="width: 300px" id="UpdCurriculumDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Curriculum</option>
						   				${curDrp}											   				
                                    </select>
	                            </div>
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-12" style="padding-top:10px">
	                                Section Description<textarea class="form-control" placeholder="ex. For BSIT First Year" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="UpddescTxt"></textarea>
	                            </div>	    
                        	</div>           
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="updatecloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="updateBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	       </div>
	    </div>
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="Admission" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" >Admission</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row">
                        		<div class="col-lg-6">
	                                <h5>Name</h5>  
	                                <h4 id="studentName">Eric valdez</h4>  
	                                
	                            </div>
	                            <div class="col-lg-6">
	                                <h5 style="text-align:right">Status</h5>  
	                                <h4 style="text-align:right" id="studentStatus">Not Enrolled</h4>  
	                                
	                            </div>
                        		
                       		</div>
                        	<div class="row">
	                        	<div class="col-lg-8" style="padding-top:10px">
	                                Course
                             		<select class="form-control" style="width: 300px" id="CourseDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Course</option>
						   				${courseDrp}											   				
                                    </select>
	                            </div>
	                        	<div class="col-lg-6" style="padding-top:10px" id="yearhidden">
	                                Year
                             		<select class="form-control" style="width: 300px" id="YearDrp">
						   				<option value="1" selected="selected" >First Year</option>
						   				<option value="2">Second Year</option>
						   				<option value="3">Third Year</option>
						   				<option value="4">Fourth Year</option>
                                    </select>
	                            </div>
	                            <div class="col-lg-6" style="padding-top:10px">
	                                Section
                             		<select class="form-control" style="width: 300px" id="SectionDrp">
						   				<option value="default" selected="selected" disabled="disabled">Select a Section</option>						   				
                                    </select>
	                            </div>
	                            
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-12" style="padding-top:10px">
	                            	Curriculum Subjects:
	                                <table class="table table-striped table-hover table-bordered" id="itemsTbl">
		                            	<thead>
	                                        <tr>
	                                            <th style="width: 200px">Subject Code</th>
	                                            <th style="width: 200px">Description</th>
	                                            <th style="width: 100px">Units</th>
	                                            <th style="width: 70px">Action</th>  
	                                        </tr>
	                                    </thead>
	                                    <tbody id="mainBody">    
										   <tr>
										   		<td style="font-size:15px" ><center class="codeText"></center></td>
										   		<td style="font-size:15px" ><center class="descText"></center></td>
										   		<td style="font-size:15px" ><center class="unitText"></center></td>
										   		<td>
										   			<center>
										   				
										   			</center>
	                                            </td>
										   </tr>
	                                    </tbody>
	                            	</table>
			                     </div> 
                        	</div>       
	                    </form>
	                    <div class="hidden" id="feeDiv">
	                    	<h5>Miscellaneous Fee</h5>
                			<h4 id="feeTxt">25.00</h4>
	                    </div>
	                </div>
	                <div class="modal-footer">
	                	 <button data-dismiss="modal" class="btn btn-default" id="updatecloseBtn" type="button"><u>C</u>lose</button>
	                     <button class="btn btn-success " id="EnrollBtn" type="button"><u>E</u>nroll</button>	                
	                </div>
	            </div>
	       </div>
	    </div>
	        
	    </jsp:body>


</t:Admin>
