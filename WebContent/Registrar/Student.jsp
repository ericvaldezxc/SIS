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
	ResultSet rs = stmnt.executeQuery("SELECT Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID  group by Student_Taken_Curriculum_Subject_StudentAccountID");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+rs.getString("enrolledba")+"</td><td style='text-align:center'> <a class='btn btn-success schedule' data-toggle='modal' href='#Schedule'><i class='fa fa-calendar'></i></a> <a class='btn btn-info curriculum' data-toggle='modal' href='#curriculum'><i class='fa fa-flag'></i></a>  </td></tr>"; 
		
	}


	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("campusDrp", campusDrp);	

%>    

<t:Registrar title="Student" from="Student" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
//				alert(window.location.hostname+":"+window.location.port+"/")
//				$('#yearhidden').hide()
				EditableTable.init();
				$("select.schedule").select2();
				var globsub = ''
				var globstudnum = ''
				var latcode = ''
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
				
				$('#curBody').on('click','a.enroll',function(){
					$('#curriculum').modal('toggle')
					var coucode = $(this).closest('tr').children('td:eq(0)').text()
					globsub = coucode
					var coudesc = $(this).closest('tr').children('td:eq(1)').text()
					$('#Subject-Title').html(coucode + ' - ' + coudesc)
					$.ajax({
    					type:'POST',
    					data:{subject: coucode},
    					url: "Controller/Registrar/Student/Schedule",
    					success: function(result){
    						var item = $.parseJSON(result)
    						var opt = '<option value="default" selected disabled>Select a schedule</option>'
    						var optbody = ''
    						$.each(item,function(key,val){
//    							optbody += 
   								$.each(val.sched,function(key2,val2){
   	    							optbody += val2 + ' '
   	    							
   	    						})
    							opt += '<option value="'+val.section+'">'+optbody+'</option>'
    							//alert(opt)
    						})
    						if(opt == '')
    							opt = '<option value="default">No Schedule Available</option> '
    						$('#schedDrp').html(opt)
    						$('select#schedDrp').select2('val', 'default')
    						console.log(item)
    						
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
				})
				$('#enrollClose').click(function(){
					$('#curriculum').modal('toggle')
				})
				
				$('#editable-sample').on('click','a.curriculum',function(){
					var studentnumber = $(this).closest('tr').children('td:eq(0)').text()
					globstudnum = studentnumber
					$.ajax({
    					type:'POST',
    					data:{studentnumber: studentnumber},
    					url: "Controller/Registrar/Student/Curriculum",
    					success: function(result){
    						var item = $.parseJSON(result)
       						var body = ''
       						$.each(item,function(key,val){
       							body += "<section class='panel'>"+
       							"<header class='panel-heading' style='background-color:#68a0b0;margin-top:10px;color:white'>"+
       									"<label>"+val.yearlvl + " - " + val.semester +"</label><br/>"+
       									"<span class='tools pull-right'>"+
       					        "<a href='javascript:;' class='fa fa-chevron-down' style='color:white'></a>"+
       					        "</span>"+
       					        "</header>"+
       					        "<div class='panel-body' style='background-color:;'>";
       					        
       					        var tbody = '';
       					 		$.each(val.subject,function(key2,val2){
       					 			if(val2.group  == ''){
       					 				var prereq = ''
       					 				var i = 0
       					 				$.each(val2.prerequisite,function(key3,val3){
       					 					if(i != 0)
       					 						prereq  += ', '
       					 					prereq += val3
       					 				
       					 					i++
       					 				})
       					 				var st = ''
       					 				if(val2.status == 'Not Cleared')
       					 					st = "<a class='btn btn-info enroll' title='Enroll this Subject'  data-toggle='modal' href='#enroll'><i class='fa fa-bolt'></i></a>"
    					 				else
       					 					st = 'Cleared'
       					 					
       						   			tbody +="<tr>"+
    						   						"<td>"+val2.code+"</td>"+
    						   						"<td>"+val2.desc+"</td>"+
    						   						"<td style='font-weight:bold;'>"+prereq+"</td>"+
    						   						"<td>"+val2.units+"</td>"+
    						   						"<td>"+val2.status+"</td>"+
    						   						"<td>"+st+"</td>"+
    						   					"</tr>"	
       					 				
       					 			}
       					 			else{
       					 				
    	   					 			tbody +="<tr>"+
    						   						"<td colspan='6' style='font-weight:bold;text-align:lelft;color:#68a0b0'>"+val2.code+"</td>"+
    						   					"</tr>"	
    						   			$.each(val2.group,function(key3,val3){
    	   					 				var prereq = ''
       	   					 				var i = 0
       	   					 				$.each(val3.prerequisite,function(key4,val4){
       	   					 					if(i != 0)
       	   					 						prereq  += ', '
       	   					 					prereq += val4
       	   					 				
       	   					 					i++
       	   					 				})
											var st = ''
	       					 				if(val3.status == 'Not Cleared')
	       					 					st = "<a class='btn btn-info enroll' title='Enroll this Subject'  data-toggle='modal' href='#enroll'><i class='fa fa-bolt'></i></a>"
	    					 				else
	       					 					st = 'Cleared'
    						   			
    		   					 			tbody +="<tr style='font-style:italic'>"+
    							   						"<td>"+val3.code+"</td>"+
    							   						"<td>"+val3.desc+"</td>"+
    							   						"<td style='font-weight:bold;'>"+prereq+"</td>"+
    							   						"<td>"+val3.units+"</td>"+
    							   						"<td>"+val3.status+"</td>"+
        						   						"<td>"+st+"</td>"+
    							   					"</tr>"	
    						   				
    						   				
    						   			})
    						   						
       					 			}
       					 			
       					 		})
       					 		if(tbody != ''){
    	   					 		body += "<table class='table table-hover'>"+
    	   							"<thead>"+
    		   							"<tr>"+
    		   						    	"<th style='width: 20%'>Code</th>"+
    		   						        "<th style='width: 25%'>Description</th>"+
    		   						        "<th style='width: 20%'>Prerequisite</th>"+
    		   						        "<th style='width: 10%'>Cred. Unit</th>"+
    		   						        "<th style='width: 15%'>Status</th>"+
    		   						        "<th style='width: 10%'>Action</th>"+
    		   						   	"</tr>"+
    		   						"</thead>"+
    		   						"<tbody>   ";
    		   						body += tbody


    	   					        body += 	"</tbody>"+
       										"</table>";
       					 			
       					 		}
       					        
       					        
       							body +=  "</div>"+
       							"</section>";
       						})
       						$('#curBody').html(body)
    						console.log(item)

                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
				})
			
				$('#enrollBtn').click(function(){
					var sec = $('#schedDrp').val()
					swal({
	                    title: "Are you sure?",
	                    text: "The record will be save and will be use for further transaction",
	                    type: "warning",
	                    showCancelButton: true,
	                    confirmButtonColor: '#DD6B55',
	                    confirmButtonText: 'Yes, do it!',
	                    cancelButtonText: "No!",
	                    closeOnConfirm: false,
	                    closeOnCancel: false
	                },
		                function (isConfirm) {
		                    if (isConfirm) {
		                    	$.ajax({
		        					type:'POST',
		        					data:{subject: globsub,studnum: globstudnum,section: sec},
		        					url: "Controller/Registrar/Student/Enroll",
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
		
		                    } else {
		
		                        swal("Cancelled", "The transaction is cancelled", "error");
		                        $("#editable-sample_new").click();
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
    	<script src="../Assets/Registrar/Student/Student.js"></script>
    
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
          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Schedule" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="schedule-title">Schedule</h4>
	                </div>
	                <div class="modal-body">
	                   <table class="table table-hover" >
                			<thead>
		                    	<tr>
		                        	<th style="width: 15%">Code</th>
		                            <th style="width: 30%">Description</th>
		                            <th style="width: 5%">Lec. Units</th>
		                            <th style="width: 5%">Lab. Unit</th>
		                            <th style="width: 5%">Cred. Unit</th>		                            
		                            <th style="width: 40%">Schedule</th>
		                       	</tr>
                    		</thead>
                    		<tbody id="schedBody">   
		                    	<tr>
		                        	<td colspan="6" style="text-align:center;font-weight:bold;font-style:italic">No Avaliable Data to show</td>
		                        </tr> 
                    		</tbody>
               			</table>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="closeBtn" type="button"><u>C</u>lose</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="curriculum" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="schedule-title">Curriculum</h4>
	                </div>
	                <div class="modal-body" id="curBody"> 
	                   
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="closeBtn" type="button">Close</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="enroll" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Subject-Title">Curriculum</h4>
	                </div>
	                <div class="modal-body" id="enrollBody"> 
	                    Available Schedule<br/>
             			<select id="schedDrp" class="populate schedule" style="width:100%">
                          	  
                        </select>  
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="enrollClose" type="button">Close</button>
            	        <button class="btn btn-success " id="enrollBtn" type="button">Enroll</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    
	        
	    </jsp:body>


</t:Registrar>
