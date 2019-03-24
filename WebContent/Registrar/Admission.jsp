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
	ResultSet rs = stmnt.executeQuery("SELECT * FROM `r_student_profile` inner join r_student_application on Student_Profile_ID = Student_Application_StudentProfileID where Student_Profile_ID not in (SELECT Student_Account_Student_Profile_ID from t_student_account WHERE Student_Account_Display_Status = 'Active') ");
		while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
			if(mname.equals(""))
				fullname = lname + ", " + fname;
			else	
				fullname = lname + ", " + fname + " " +  mname;
			
			tablebody += "<tr><td>" + rs.getString("Student_Application_Application_Number") +"</td><td>" + fullname +"</td><td>For Assessment</td><td>"; 
//			if(rs.getString("Student_Profile_Display_Status").equals("Active") )
//					tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#AdmissionEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-info admission' data-toggle='modal' data-studentid='"+rs.getString("Student_Profile_ID")+"' href='#Admission'><i class='fa fa-briefcase'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
//			else
//				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			if(rs.getString("Student_Profile_Display_Status").equals("Active") )
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#AdmissionEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}


	

	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("campusDrp", campusDrp);	

%>    

<t:Registrar title="Admission" from="Admission" to="">

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
				//New
				
				$("#importBtn").on('change', function() {
	             	$('#importModal').modal('toggle')
	        		handleFiles(this.files)
	        	});
				
				function s2ab(s) {
       
                     var buf = new ArrayBuffer(s.length);
                     var view = new Uint8Array(buf);
                     for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
                     return buf;
                     
             	}
				
				function handleFiles(files) {
		    		 if (window.FileReader) {
		    		   getAsText(files[0]);
		    		 } else {
		    			 alert('FileReader are not supported in this browser.');
		    		 }
	    		}

	    		function getAsText(fileToRead) {
	    		  var reader = new FileReader();
	    		  reader.readAsText(fileToRead);
	    		  reader.onload = loadHandler;
	    		  reader.onerror = errorHandler;
	    		}

	    		function loadHandler(event) {
	    		  var csv = event.target.result;
	    		  processData(csv);
	    		}

	    		function processData(csv) {
	    		    var allTextLines = csv.split(/\r\n|\n/);
	    		    student = []
	    		    for (var i=1; i<allTextLines.length; i++) {
	    		        var row = allTextLines[i].split(';');		
	    		        for (var j=0; j<row.length; j++) {
	    			        var col = row[j].split(',');
	    			        if(col[0] != "" && col[2] != undefined){
	    				        student.push({ firstName:col[0] , middleName:col[1] , lastName:col[2] , cn:col[3], emailAdd:col[4], guardianName:col[5], guardianContactNumber:col[6], dob:col[7] , pob:col[8] , gender:col[9] , civilStatus:col[10] , address:col[11]  });
	    			        	
	    			        }
	    		        }
	    		    }
	    		    filltable()
	    		    

	    		    
	    		}
	    		var student = [];
	        	var finstudent = [];
	        	var studentList = [];
	    		
	    		function filltable (){
	    		    console.log(student)
	    			var table = $('#importList').DataTable();
	                jQuery(table.fnGetNodes()).each(function () {
	                	table.fnDeleteRow(0);
	                });
	               
	                $(student).each(function(key , val){
		    			console.log(val)

	                    var aiNew = table.fnAddData([ val.firstName, val.middleName, val.lastName, val.cn, val.emailAdd, val.guardianName, val.guardianContactNumber, val.dob, val.pob, val.gender, val.civilStatus, val.address]);
	                    	
	                	var nRow = table.fnGetNodes(aiNew[0]);
	    				
	    			})
	    		}

	    		function errorHandler(evt) {
	    		  if(evt.target.error.name == "NotReadableError") {
	    		      alert("Cannot read file!");
	    		  }
	    		}
	    		
	    		$('#saveImportBtn').click(function(){
	    			$.ajax({
    					type:'POST',
    					data:{studentList:JSON.stringify(student)},
    					url:'Controller/Registrar/Admission/importApplicant',
    					success: function(result){
    						swal({
                                title: "Record Import!"
                                , text: "The data is successfully Added!"
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
		<script lang="javascript" src="../Assets/js/xlsx.full.min.js"></script>
		<script lang="javascript" src="../Assets/js/FileSaver.min.js"></script>
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
		                                    <label style="margin-left:5px;" class="btn btn-info" id="lblimport" for="importBtn" >
								            	<input id="importBtn" type="file" accept=".csv" style="display:none;">
								                <i class="fa fa-upload"></i> Import
								            </label>
                                        </div>
                                        <div class="btn-group pull-right">
                                            <!-- <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>  -->
								            <form method="get" action="http://localhost:8080/SIS/Assets/template/application_template.csv">
											   <button class="btn btn-secondary" >
			                                        Template <i class="fa fa-download"></i>
			                                    </button>
											</form>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 20%">Application ID</th>
	                                            <th style="width: 30%">Name</th>
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
	    
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="importModal" class="modal fade">
	        <div class="modal-dialog" style="width:60%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" >Import List</h4>
	                </div>
	                <div class="modal-body">
                        <div class="row">
	                        <div class="col-lg-12">
		                        <table class="table table-striped table-hover table-bordered" id="importList">
		                        	<thead>
		                                   <tr>
		                                       <th>First Name</th>
		                                       <th>Middle Name</th>
		                                       <th>Last Name</th>
		                                       <th>Contact Number</th>
		                                       <th>Email Address</th>
		                                       <th>Guardian Name</th>
		                                       <th>Guardian Contact Number</th>
		                                       <th>Date of Birth</th>
		                                       <th>Place of Birth</th>
		                                       <th>Gender</th>
		                                       <th>Civil Status</th>
		                                       <th>Address</th>
		                                   </tr>
		                               </thead>
		                               <tbody id="importListTbl">   
		                              		
		                              		<!-- <tr>
		                              		 	<td colspan="12" style="text-align:center"> No data available</td>
		                            		</tr>  -->
		                               </tbody>
		                        </table>
	                        </div>
                        </div>
	                </div>
	                <div class="modal-footer">
	                	 <button data-dismiss="modal" class="btn btn-default" id="" type="button">Close</button>
	                     <button class="btn btn-success" id="saveImportBtn" type="button">Save</button>	                
	                </div>
	            </div>
	       </div>
	    </div>
	        
	    </jsp:body>


</t:Registrar>
