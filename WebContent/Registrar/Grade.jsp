<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Registrar" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	Dropdowns drp = new Dropdowns();
	if(conn == null)
		out.print("failasded");
	
	EncryptandDecrypt ec = new EncryptandDecrypt();
	
	String acadyear = "";
	String sem = "";

	String uname = "";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	String acadyearDrp = "";
/*	ResultSet rs = stmnt.executeQuery("SELECT distinct  IF(IFNULL(Schedule_ChildrenID,0)=0,(SELECT Subject_Code FROM r_subject WHERE CurriculumItem_SubjectID  = Subject_ID),(SELECT Subject_Code FROM r_subject WHERE Schedule_ChildrenID = Subject_ID)) CODE,IF(IFNULL(Schedule_ChildrenID,0)=0,(SELECT Subject_Description FROM r_subject WHERE CurriculumItem_SubjectID  = Subject_ID),(SELECT Subject_Description FROM r_subject WHERE Schedule_ChildrenID = Subject_ID)) DESCR  FROM `t_schedule_items` left join t_schedule on Schedule_Items_ScheduleID = Schedule_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID  left join r_room on Room_ID = Schedule_Items_RoomID inner join r_section on Schedule_SectionID =  Section_ID left join r_professor on Schedule_ProfessorID =  Professor_ID where Schedule_Items_Display_Status = 'Active'  and Schedule_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Active_Flag = 'Present') and Professor_Code = '"+uname+"' ");
	while(rs.next()){
		subDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("CODE"))+"'>"+ec.decrypt(ec.key, ec.initVector, rs.getString("DESCR"))+"</option>";
		
	}
*/
	String status = "";
	ResultSet rs =  stmnt.executeQuery("SELECT Grade_Opening_Open FROM `r_grade_opening` ");
	while(rs.next()){
		status = rs.getString("Grade_Opening_Open");
		
	}
	
	int  i = 0 ;

	String sectionDrp = "";
	rs = stmnt.executeQuery("SELECT * FROM `r_campus` ");
	while(rs.next()){
		i = 0 ;
		ResultSet rs2 =  stmnt2.executeQuery("SELECT * FROM `r_section` where Section_CampusID = '"+rs.getString("Campus_ID")+"'");
		while(rs2.next()){
			if(i == 0){
				sectionDrp += "<optgroup label='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Campus_Code"))+"'>";				
				
			}
			
			sectionDrp += "<option value='"+rs2.getString("Section_Code")+"'>"+rs2.getString("Section_Code")+"</option>";			
			i++;
			
		}

		if(i != 0){
			sectionDrp += "</optgroup>";				
			
		}

		
	}
		
		
	
	pageContext.setAttribute("status", status);
	pageContext.setAttribute("acadyearDrp", drp.fillacadyearDrp2());
	pageContext.setAttribute("semesterDrp", drp.fillsemesterDrp());
	pageContext.setAttribute("sectionDrp", sectionDrp);
	pageContext.setAttribute("facDrp", drp.fillprofessor());
	
	if(status.equals("Yes")){
	
%>    


<t:Registrar title="Grading" from="Grading" to="">

	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
		<script lang="javascript" src="../Assets/js/xlsx.full.min.js"></script>
		<script lang="javascript" src="../Assets/js/FileSaver.min.js"></script>
		
    </jsp:attribute>    
    
    <jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$("#subjectDrp").select2( {width: '100%' });
				$("#acadyearDrp").select2( {width: '100%' });
				$("#semesterDrp").select2( {width: '100%' });
				$("#sectionDrp").select2( {width: '100%' });
				$("#facDrp").select2( {width: '100%' });
				$('#excelBtn').hide()
				
				$('#facDrp').change(function(){
					var fac = $(this).val()
					$.ajax({
    					type:'POST',
    					data:{faculty: fac},
    					url: "Controller/Registrar/Grade/GetFacultySubject",
    					success: function(result){
    						$('#subjectDrp').html('<option value="default" selected="selected" disabled="disabled" >Select a Faculty</option>')
    						$('#subjectDrp').append(result)
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
					
				})
				
			});
		</script>
    </jsp:attribute>
    
    <jsp:body>
        <script src="../Assets/Registrar/Grade/Grading.js"></script>
    		
	    	<div class="row">
		    	<div class="col-lg-12">
			    	<section class="panel">
			        	<div class="panel-body">
			        	<div class="row">
				            	<div class="col-lg-6">
			                    	Faculty
			                    	<br/>
			                        <select class="populate " id="facDrp">
				                  	    <option value="default" selected="selected" disabled="disabled" >Select a Faculty</option>                            	       	
			                  			${facDrp}      	
			                		</select>
				                </div>
	 		            	</div>
			            	<div class="row">
				            	<div class="col-lg-6" style="margin-top:10px">
			                    	Academic Year
			                    	<br/>
			                        <select class="populate " id="acadyearDrp">
				                  	    <option value="default" selected="selected" disabled="disabled" >Select a Academic Year</option>                            	       	
			                  			${acadyearDrp}      	
			                		</select>
				                </div>
				            	<div class="col-lg-6">
			                    	Semester
			                    	<br/>
			                        <select class="populate " id="semesterDrp">
				                  	    <option value="default" selected="selected" disabled="disabled" >Select a Semester</option>                            	       	
			                  			${semesterDrp}      	
			                		</select>
			                    </div>
	 		            	</div>
	 		            	<div class="row" style="margin-top:10px">
				            	<div class="col-lg-6">
			                    	Subject
			                    	<br/>
			                        <select class="populate " id="subjectDrp">
				                  	    <option value="default" selected="selected" disabled="disabled" >Select a Subject</option>      
				                  	    ${subjectDrp}                      	       	
			                		</select>
			                    </div>
			                    <div class="col-lg-6">
			                    	Section
			                    	<br/>
			                        <select class="populate " id="sectionDrp">
				                  	   <option value="default" disabled="disabled" selected="selected">Select a Section</option>    
				                  	   ${sectionDrp}            	       	
			                		</select>
			                    </div>
	 		            	</div>
			            	<div class="row" id="excelBtn">
				            	<div class="col-lg-6">
			                    	<label class="btn btn-success" id="lblimport" for="importBtn" style="margin-top:15px">
						            	<input id="importBtn" type="file" accept=".csv" style="display:none;" >
						                <i class="fa fa-upload"></i> Import
						            </label>
			                    	<label class="btn btn-info" for="exportBtn" style="margin-top:15px">
						            	<input id="exportBtn" type="button" style="display:none;" >
						                <i class="fa fa-download"></i> Export
						            </label>
			                    </div>
			            	</div>
			            	<div class="row">
			            		<div class="col-lg-12">
			                    	<div class="adv-table editable-table ">
		                            <div class="space15"></div>
		                            	<table class="table table-striped table-hover table-bordered" id="editable-sample">
			                                <thead>
			                                    <tr>
		                                            <th style="width: 25%">Student Number</th>
		                                            <th style="width: 25%">Student Name</th>
		                                            <th style="width: 20%">Section</th>
		                                            <th style="width: 15%">Final Grade</th>
		                                            <th style="width: 15%">Grade Status</th>
			                                	</tr>
			                                </thead>
			                            	<tbody>  
			                            		
												
			                            	</tbody>
		                            	</table>
		                         	</div>
		                         	<button class="btn btn-success hidden" id="saveBtn" type="button"><i class="fa fa-save" ></i> Save</button>
			                    </div>
			            	</div>
			            </div>
			         </section>
		    	</div>
	         </div>
          
    
    </jsp:body>


</t:Registrar>
<%
	}
	else{
	
%>    

<t:Registrar title="Grading" from="Grading" to="">

	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
		<script lang="javascript" src="../Assets/js/xlsx.full.min.js"></script>
		<script lang="javascript" src="../Assets/js/FileSaver.min.js"></script>
		
    </jsp:attribute>    
    
    <jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$("#subjectDrp").select2( {width: '100%' });
				
				
			});
		</script>
    </jsp:attribute>
    
    <jsp:body>
        <script src="../Assets/Faculty/Grading/Grading.js"></script>
    		
	    	<div class="row">
		    	<div class="col-lg-12">
			    	<section class="panel">
			        	<div class="panel-body">
			            	<div class="row" style="text-align:center;color:#B33A3A">
				            	<h4>The Grading module isn't open yet</h4>
	 		            	</div>
			        	</div>
			   		</section>
			    </div>
	         </div>
          
    
    </jsp:body>


</t:Registrar>

<%
	}
	
%>    

