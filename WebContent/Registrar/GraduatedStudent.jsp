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
	ResultSet rs = stmnt.executeQuery(" select * FROM `t_graduate`  inner join t_student_account on Graduate_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Graduate_AcademicYearID inner join r_semester on Graduate_SemesterID = Semester_ID inner join r_section on Student_Account_SectionID = Section_ID where  Student_Account_Display_Status = 'Active'  and Graduate_Display_Status = 'Active' ");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		String year = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));
		String sem = ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"));
		String student = rs.getString("Student_Account_Student_Number");

		tablebody += "<tr><td>"+ student +"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+year+"</td><td>"+sem+"</td></tr>"; 
		
		
		
		
	}

	pageContext.setAttribute("tablebody", tablebody);
	
	
%>    

<t:Registrar title="Graduated Student" from="Graduated Student" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$('#btnprint').click(function(){
					var pdf = new jsPDF('p', 'pt', 'letter');
		            var breaker = '_______________________________________________________________________'
		           
					var mybase = 190;
		            specialElementHandlers = {
							'#bypassme': function(element, renderer){
								return true
							}
						}
		        	$.ajax({
    					type:'POST',
    					data:{stnum:"2018-00006-CM-0"},
    					url: "Controller/Registrar/GraduatedStudents/GetProfile",
    					success: function(result2){
    						var item2 = $.parseJSON(result2)
    						$.ajax({
		    					type:'POST',
		    					data:{stnum:"2018-00006-CM-0"},
		    					url: "Controller/Registrar/GraduatedStudents/TranscriptofRecord",
		    					success: function(result){
		    						var item = $.parseJSON(result)
		    						var title = ''
		    						var torbody = ''
		    						var i = 0
		    						$(item).each(function(key,val){
		    							pdf.setFontType("normal");
		    							pdf.setFontSize(14);
		    							pdf.text(35,mybase-5,breaker)
		    							
		    							pdf.setFontType("italic");
										pdf.setFontSize(17);
										pdf.text(33,mybase+10,"|")
										
		    							pdf.setFontType("italic");
										pdf.setFontSize(17);
										pdf.text(33,mybase+13,"|")
										
		    							
		       							title =  val.acadyear + " " + val.sem
		        						pdf.setFontType("italic");
		        						pdf.setFontSize(11);
		        						pdf.text(50 , mybase + 10 , title)
		        						
		        						pdf.setFontType("normal");
		    							pdf.setFontSize(14);
		    							pdf.text(35,mybase + 15,breaker)
		    							
		    							pdf.setFontType("italic");
										pdf.setFontSize(17);
										pdf.text(33,mybase+30,"|")
										
		    							pdf.setFontType("italic");
										pdf.setFontSize(17);
										pdf.text(33,mybase+33,"|")
										
										pdf.setFontType("italic");
										pdf.setFontSize(17);
										pdf.text(585,mybase+10,"|")
										
		    							pdf.setFontType("italic");
										pdf.setFontSize(17);
										pdf.text(585,mybase+13,"|")
		        						
		        						pdf.setFontType("italic");
		         						pdf.setFontSize(11);
		         						pdf.text(50 , mybase + 30 , "Code")
		         							
		         						pdf.setFontType("italic");
		         						pdf.setFontSize(11);
		         						pdf.text(150 , mybase + 30 , "Description")
		         							
		         						pdf.setFontType("italic");
		         						pdf.setFontSize(11);
		         						pdf.text(400 , mybase + 30 , "Grade")
		         							
		         						pdf.setFontType("italic");
		         						pdf.setFontSize(11);
		         						pdf.text(500 , mybase + 30 , "Credit")
		         						
		         						pdf.setFontType("italic");
										pdf.setFontSize(17);
										pdf.text(585,mybase+30,"|")
										
		    							pdf.setFontType("italic");
										pdf.setFontSize(17);
										pdf.text(585,mybase+33,"|")
		         						
		         						pdf.setFontType("normal");
		    							pdf.setFontSize(14);
		    							pdf.text(35,mybase + 35,breaker)
		        						
		    							$(val.grades).each(function(key2,val2){
		    								
		    								pdf.setFontType("italic");
											pdf.setFontSize(19);
											pdf.text(33,mybase+46,"|")
		    								
		    								pdf.setFontType("italic");
											pdf.setFontSize(17);
											pdf.text(33,mybase+48,"|")
											
			    							pdf.setFontType("italic");
											pdf.setFontSize(19);
											pdf.text(33,mybase+54,"|")
		    								
		    								pdf.setFontType("italic");
		           							pdf.setFontSize(9);
		           							pdf.text(50 , mybase + 50 , val2.subjcode)
		           							
		           							pdf.setFontType("italic");
		           							pdf.setFontSize(8);
		           							var desc = pdf.splitTextToSize(val2.subjdesc, 230);
		           							pdf.text(150 , mybase + 50 , desc)
		           							
		           							pdf.setFontType("italic");
		           							pdf.setFontSize(9);
		           							pdf.text(400 , mybase + 50 , val2.grade)
		           							
		           							pdf.setFontType("italic");
		           							pdf.setFontSize(9);
		           							pdf.text(500 , mybase + 50 , val2.subcredunit)
		           							
		           							pdf.setFontType("normal");
			    							pdf.setFontSize(14);
			    							pdf.text(35,mybase + 55,breaker)
			    							
			    							pdf.setFontType("italic");
											pdf.setFontSize(19);
											pdf.text(585,mybase+46,"|")
		    								
		    								pdf.setFontType("italic");
											pdf.setFontSize(17);
											pdf.text(585,mybase+48,"|")
											
			    							pdf.setFontType("italic");
											pdf.setFontSize(19);
											pdf.text(585,mybase+54,"|")
		    								
		        							mybase =  mybase + 25
		
		    							})
		    							
		    							i++
		    							
		    						})
		    						
									
									
		    						
		    								
						            pdf.setFontType("normal");
									pdf.setFontSize(14.5);
									pdf.text(15,15,breaker)
				
									pdf.setFontType("bold");
									pdf.setFontSize(13);
									pdf.text(15,40,"Quezon City Polytechnic University")
									
									pdf.setFontType("italic");
									pdf.setFontSize(7);
									var addre = pdf.splitTextToSize("QCPU Technical & Vocational Building, 673 Quirino Hway, Novaliches, Quezon City, 1116 Metro Manila", 230);
									pdf.text(15,55,addre)
									
									pdf.setFontType("normal");
									pdf.setFontSize(14.5);
									pdf.text(15,70,breaker)
									 
									pdf.setFontType("italic");
									pdf.setFontSize(14);
									pdf.text(240,110,"Transcript of Records")
									 
									pdf.setFontType("normal");
									pdf.setFontSize(8);
									pdf.text(15,130,"Student Number")
				
									pdf.setFontType("normal");
									pdf.setFontSize(8);
									pdf.text(110,130,item2.studnum)
									
									pdf.setFontType("normal");
									pdf.setFontSize(8);
									pdf.text(15,140,"Student Name")
				
									pdf.setFontType("normal");
									pdf.setFontSize(8);
									pdf.text(110,140,item2.name)
				
									pdf.setFontType("normal");
									pdf.setFontSize(8);
									pdf.text(15,150,"Year of Admission")
				
									pdf.setFontType("normal");
									pdf.setFontSize(8);
									pdf.text(110,150,item2.year)
				
									pdf.setFontType("normal");
									pdf.setFontSize(8);
									pdf.text(15,160,"Address")
				
									pdf.setFontType("normal");
									pdf.setFontSize(8);
									pdf.text(110,160,item2.address)
		    						
									var myImage = new Image();
				   					myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
				   					myImage.onload = function(){
				   						pdf.addImage(myImage , 'png', 520, 20, 50, 50);
				   						var uri = pdf.output('dataurlstring');
				   					  	openDataUriWindow(uri);
				   					};
		    					}
		    				})
    						
    						
    					}
    				})
		            
				
   						
   						
   					
				})	

					
				
				function openDataUriWindow(url) {
				    var html = '<html>' +
				        '<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style>' +
				        '<body>' +
				        '<iframe src="' + url + '"></iframe>' +
				        '</body></html>';
				    a = window.open();
				    a.document.write(html);
				}
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script src="../Assets/js/html2canvas.js"></script>
		<script src="../Assets/js/jspdf.js"></script>
		<script src="../Assets/js/jspdf.debug.js"></script>
		<script src="../Assets/js/jspdf.plugin.autotable.js"></script>
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
	                                            <th style="width: 20%">Student Number</th>
	                                            <th style="width: 20%">Name</th>
	                                            <th style="width: 20%">Course and Section</th>
	                                            <th style="width: 20%">Year</th>  
	                                            <th style="width: 20%">Semester</th>  
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
