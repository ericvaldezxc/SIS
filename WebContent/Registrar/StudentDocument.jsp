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
	String curDrp = "";
	String campusDrp = drp.fillcampusDrp();
	String courseDrp = drp.fillcourseDrp();
	
	String firstCol = "";
	String firstCol2 = "";
	
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	String status = "";	
	Statement stmnt = conn.createStatement();
//	ResultSet rs = stmnt.executeQuery("SELECT Student_Account_Year,Student_Account_CourseID,Student_Account_CurriculumYearID,Curriculum_ID,Student_Account_ID,Curriculum_Max_Credited_Unit,CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,if((SELECT count(*) FROM r_documents where Documents_Display_Status = 'Active') = (SELECT count(*) FROM `r_student_document` where Student_Document_Display_Status = 'Active' and Student_Document_StudentApplicationID   ) ) FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  group by Student_Taken_Curriculum_Subject_StudentAccountID");
	ResultSet rs = stmnt.executeQuery("SELECT *,if((SELECT count(*) FROM r_documents where Documents_Display_Status = 'Active') = (SELECT count(*) FROM `r_student_document` where Student_Document_Display_Status = 'Active' and Student_Document_StudentApplicationID = Student_Application_ID ),'Completed','Incomplete' ) as stat FROM `r_student_application` inner join r_student_profile on Student_Profile_ID = Student_Application_StudentProfileID inner join t_student_account on Student_Profile_ID = Student_Account_Student_Profile_ID inner join r_section on  Student_Account_SectionID = Section_ID");
	
	while(rs.next()){
		String fstudid = rs.getString("Student_Account_ID");
		String curyearid = rs.getString("Student_Account_CurriculumYearID");
		String studyearlvl = rs.getString("Student_Account_Year");
		String courid = rs.getString("Student_Account_CourseID");
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		
		tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+ rs.getString("stat")+"</td><td><center><a class='btn btn-info document' data-app='" + rs.getString("Student_Application_Application_Number") +"' href='javascript:;'><i class='fa fa-file-text'></i></a><center></td></tr>"; 
			
		
	}


	

	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("campusDrp", campusDrp);
	pageContext.setAttribute("documentDrp", drp.filldocumentDrp());	


%>    

<t:Registrar title="Document" from="Document" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
//				alert(window.location.hostname+":"+window.location.port+"/")
//				$('#yearhidden').hide()
				EditableTable.init();
				$("select.fee").select2();
				$('#campusDrp').on('change',function(){
					var camp = $(this).val()
					$.ajax({
    					type:'POST',
    					data:{Campus: camp},
    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'FillCourse',
    					success: function(result){
    						var item = $.parseJSON(result)
			        		$("#courseDrp").select2("val","default");

    						$('#courseDrp').val('')

    						$('#courseDrp').html('<option value="default" selected="selected" disabled="disabled" >Select a Course</option>');
    						$.each(item, function (key, val) {
    							$('#courseDrp').append('<option value="'+val.code+'" >'+val.code + ' - ' +val.desc+'</option>');
                    			
                    			
                    		})
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
				})
				
				$('#editable-sample').on('click','a.document', function (e) {
	                e.preventDefault();
	                var app = $(this).data('app')
	                latcode =  app
	                $.ajax({
						type:'POST',
						data:{
							app:app
							},
						url:'Controller/Registrar/Application/GetDocument',
						success: function(result){
							var item = $.parseJSON(result)
							var list = []
							$('#e9').select2("val",item);
							$(item).each(function(key,val){
								list.push(val.id)
							})
							$('#e9').select2("val", list);
							
	                     
						},
	                    error: function (response) {
	                        swal("Error encountered while adding data", "Please try again", "error");
	                    }
					});
					$("#Document").modal('show');
	           
	                
	            
	            });
				
				 $('#documentSave').on('click',function(){
		            	var docu = [];
		            	$('#e9 option:selected').each(function(){
		            		docu.push($(this).val())
		            		
		            	})
		            	$.ajax({
		 					type:'POST',
		 					data:{latcode:latcode,docu: JSON.stringify(docu)},
		 					url:'Controller/Registrar/Application/Document',
		 					success: function(result){
//		 						swal("Document/s Added", "The document is successfully added", "success");
		 						swal({
		                            title: "Document/s Added"
		                            , text: "The document is successfully added"
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
		                    	swal("Error encountered while adding data", "Please try again", "error");
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
    	<script src="../Assets/Registrar/Admission/Admission.js"></script>
    
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
	                                            <th style="width: 20%">Student Number</th>
	                                            <th style="width: 30%">Name</th>
	                                            <th style="width: 20%">Section</th>
	                                            <th style="width: 20%">Status</th>
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
	        <div class="modal-dialog" style="width:55%">
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="SectionEdit" class="modal fade">
	        <div class="modal-dialog" style="width:55%">
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Admission" class="modal fade">
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
	                            <div class="col-lg-6" style="padding-top:10px">
                        			Campus
                        			<select id="campusDrp" class="populate fee" style="width: 290px">
                        				<option value="default" selected="selected" disabled="disabled" >Select a Campus</option>
                                     	  ${campusDrp} 
                                   	</select>          
	                            </div>	                              	                            
	                        	<div class="col-lg-6" style="padding-top:10px">
                        			Course
                        			<select id="courseDrp" class="populate " style="width: 290px">
                        				<option value="default" selected="selected" disabled="disabled" >Select a Course</option>
                                     	  ${courseDrp} 
                                   	</select>          
	                            </div>	
                        	</div> 
                        	<div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Section
                        			<select id="sectionDrp" class="populate fee" style="width: 290px">
                                     	 <option value="default" selected="selected" disabled="disabled" >Select a Section</option>			
                                   	</select> 
	                            </div>
	                            <div class="col-lg-6" style="padding-top:10px">
	                                Type
                        			<select id="typeDrp" class="populate fee" style="width: 290px">
                                     	 <option value="default" selected="selected" disabled="disabled" >Select a Type</option>			
                                     	 <option value="New Enrollee"  >New Enrollee</option>			
                                     	 <option value="Transferee"  >Transferee</option>			
                                   	</select> 
	                            </div>
                        	</div>                       	
                        	<div class="row">
                            	<section class="panel">
				            	<header class="panel-heading" style="background-color:#F1F2F7;margin-top:10px">
				               	 Curriculum Subjects <span class="tools pull-right">
						            <a href="javascript:;" class="fa fa-chevron-down"></a>
						            </span>
						            </header>
						            <div class="panel-body" >
	 								<table class="table table-striped table-hover table-bordered" id="itemsTbl">
			                            	<thead>
		                                        <tr>
		                                            <th style="width: 200px">Code</th>
		                                            <th style="width: 200px">Description</th>
		                                            <th style="width: 100px">Cred. Units</th>
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
						        </section>
                        	</div>       
	                    </form>
	                    <div class="row" id="feeDiv">
                           	<section class="panel">
			            		<header class="panel-heading" style="background-color:#F1F2F7;margin-top:10px">
			               	 		Breakdown of Tuition and Miscellaneous Fees <span class="tools pull-right">
					            <a href="javascript:;" class="fa fa-chevron-down"></a>
					            </span>
					            </header>
					            <div class="panel-body" >
					            	<table class="table table-striped table-hover table-bordered" id="itemsTbl">
		                            	<thead>
	                                        <tr>
	                                            <th style="width: 200px">Fee</th>
	                                            <th style="width: 100px">Amount</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody id="feemainBody">   
	                                   		 <tr>
	                                   		 	<td></td>
	                                   		 	<td></td>
                                   		 	 </tr> 
	                                    </tbody>
		                            </table>
					            </div>
					        </section>
                       	</div>
	                </div>
	                <div class="modal-footer">
	                	 <button data-dismiss="modal" class="btn btn-default" id="updatecloseBtn" type="button"><u>C</u>lose</button>
	                     <button class="btn btn-success " id="EnrollBtn" type="button"><u>E</u>nroll</button>	                
	                </div>
	            </div>
	       </div>
	    </div>
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Document" class="modal fade">
	        <div class="modal-dialog" style="width:55%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Code" >Document</h4>
	                </div>
	                <div class="modal-body">
	                   <div class="row">
                            <div class="col-lg-6" style="padding-top:10px">
                            	Document
                            	</br>
                            	<select multiple name="e9" id="e9" style="width:300px" class="populate ">
                                       ${documentDrp} 
                                </select>
                            </div>	
                       	</div> 
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="documentClose" type="button">Close</button>
	                    <button class="btn btn-success " id="documentSave" type="button">Save</button>
	                </div>
	            </div>
	       </div>
	    </div>
	        
	    </jsp:body>


</t:Registrar>
