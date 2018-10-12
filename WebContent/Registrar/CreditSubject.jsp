<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Registrar" %>
<%@page import="configuration.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	EncryptandDecrypt ec = new EncryptandDecrypt();
	DBConfiguration db = new DBConfiguration();
	Dropdowns drp = new Dropdowns();
	
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	String tablebody = "";
	String prereqcount = "";
	String subjectDrp = drp.fillsubjectDrp();
	String prereq = "";
	String curid="";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	Statement stmnt3 = conn.createStatement();
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	
	
	
	ResultSet rs = stmnt.executeQuery("Select * from t_students_grade inner join t_student_taken_curriculum_subject on Student_Taken_Curriculum_Subject_ID = Students_Grade_StudentTakenCurriculumSubjectID inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID where Students_Grade_FacultyID is null ");
		while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
			String sub = ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")); 
			Fullname fn = new Fullname();
			fullname = fn.fullname(fname, mname, lname);
			
			tablebody += "<tr><td>"+rs.getString("Student_Account_Student_Number")+"</td><td>" + fullname + "</td><td>"+ sub +"</td><td>"+rs.getString("Students_Grade_Grade")+"</td><td class='hidden'>"; 
			if(rs.getString("Subject_Display_Stat").equals("Active"))
				tablebody += "<center><a class='btn btn-success edit' data-toggle='modal' href='#SubjectEdit'><i class='fa fa-edit'></i></a> <center></td></tr>";
			
		}
	String studDrp = "";
	rs = stmnt.executeQuery("SELECT * FROM `t_student_account` inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID where Student_Account_Display_Status = 'Active' and Student_Account_ID not in (select Graduate_StudentAccountID FROM `t_graduate` where Graduate_Display_Status = 'Active') ");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		
		studDrp += "<option value='"+rs.getString("Student_Account_Student_Number")+"' >"+fullname+"</option>";
	}
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("subjectDrp", subjectDrp);
	pageContext.setAttribute("subject", drp.fillsubjectDrp2());
	pageContext.setAttribute("studDrp", studDrp);


%>    

<t:Registrar title="Credit Subject" from="Cross Enrollee" to="Credit Subject">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();

                $("#updsubjectDrp").select2();
                $("#updprereq").select2();
            	var sbody = $('#subjectRow').html()
            	$('#subjectBody').append(sbody)
				$("select.grade").select2({width: '100%'});
				$("select.subject2").select2({width: '100%'});
            	$('.addItemEdit').on('click',function(){
					$('#subjectBody').append(sbody)
					$("select.subject2").select2({width: '100%'});
					$("select.grade").select2({width: '100%'});
				})
				
				$('#subjectBody').on('change','.subject2',function(){
					$(this).closest('tr').find('.desc').html($(this).closest('tr').find('.subject2 option:selected').data('desc'))
					$(this).closest('tr').find('.cred').html($(this).closest('tr').find('.subject2 option:selected').data('cred-unit'))
					
				})
				
				$('#SaveCreditBtn').click(function(){
					var studentnum = $('#studentDrp option:selected').val();
					var sub = []
					$('#subjectBody tr').each(function(){
						var subcode = $(this).find('.subject2 option:selected').val()
						var grade = $(this).find('.grade option:selected').val()
						sub.push({subjcode:subcode,grade:grade})
					})
					
					$.ajax({
						type:'POST',
						data:{student: studentnum ,subjectDrp : JSON.stringify(sub)},
						url: 'Controller/Registrar/CrossEnrollee/CreditSubject',
						success: function(result){
							swal({
                                title: "Record Updated!"
                                , text: "The data is successfully Updated!"
                                , type: "success"
                                , confirmButtonColor: '#88A755'
                                , confirmButtonText: 'Okay'
                                , closeOnConfirm: false
                            }, function (isConfirm) {
                                if (isConfirm) {
                                    window.location.reload();
                                }
                            });
							
						},
	                    error: function (response) {
	                        swal("Error encountered while accessing the data", "Please try again", "error");
	                    }
					});
					
				})
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>

    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Curriculum/Subject.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                            
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#SubjectAdd">
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
	                                            <th style="width: 350px">Student Number</th>
	                                            <th style="width: 200px">Student Name</th>
	                                            <th style="width: 350px">Subject</th>
	                                            <th style="width: 200px">Grade</th>  
	                                            <th style="width: 200px" class="hidden">Action</th>  
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
         <div class="hidden">
	         <table>
	         	<tbody id="subjectRow">
		         	<tr>
			         	<td>
				            <select class="populate subject2">
				         		<option selected disabled value="default">Select a subject</option>
				         		${subject}
				         	</select>
			         	</td>
			         	<td class="desc"></td>
		       		 	<td class="cred" style="text-align:center;"></td>
		       		 	<td>
				            <select class="populate grade">
				         		<option selected disabled value="default">Select a Grade</option>
				         		<option value="1.00" >1.00</option>
				         		<option value="1.25" >1.25</option>
				         		<option value="1.50" >1.50</option>
				         		<option value="1.75" >1.75</option>
				         		<option value="2.00" >2.00</option>
				         		<option value="2.25" >2.25</option>
				         		<option value="2.50" >2.50</option>
				         		<option value="2.75" >2.75</option>
				         		<option value="3.00" >3.00</option>
				         	</select>
		       		 	</td>
			         </tr>
	         	</tbody>
	         </table>
         </div>
         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="SubjectAdd" class="modal fade">
	        <div class="modal-dialog" style="width:55%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Credit Subject</h4>
	                </div>
	                <div class="modal-body">
                       <div class="row">
	                        <div class="col-lg-6">
	                        	Student
		                        <select class="populate grade" id="studentDrp">
					         		<option selected disabled value="default">Select a Student</option>
					         		${studDrp}
					         	</select>
	                        </div>
                       </div>
                       <br/>
                       <div class="row">
                       		<div class="col-lg-12">
				            	<table class="table table-striped table-hover table-bordered" >
	                            	<thead>
                                        <tr>
                                            <th style="width: 25%">Code</th>
                                            <th style="width: 35%">Description</th>
                                            <th style="width: 20%">Cred. Units</th>
                                            <th style="width: 20%">Grade</th>
                                        </tr>
                                    </thead>
                                    <tbody id="subjectBody">   
                                   		 
                                    </tbody>
	                            </table>
								<a class="btn btn-success addItemEdit" href="javascript:;"><i class="fa fa fa-plus"></i></a>
	                        </div>
                       </div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="SaveCreditBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    </jsp:body>


</t:Registrar>
