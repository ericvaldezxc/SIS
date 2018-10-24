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
	String couid = "";
	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT Student_Account_ID,Curriculum_Max_Credited_Unit,CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active' and Returnee_StudentAccountID =  Student_Account_ID ),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  group by Student_Taken_Curriculum_Subject_StudentAccountID");
	while(rs.next()){
		
		
	}
	String shiftcourses = "<option value='default' selected disabled >Select a Course</option>";
	rs = stmnt.executeQuery("SELECT * FROM `r_course` where Course_Display_Status = 'Active'");
	while(rs.next()){
		shiftcourses += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"))+"'>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</option>";
	}
	
	String curyeardrp = "";
	rs = stmnt.executeQuery("SELECT * FROM `r_curriculumyear` ");
	while(rs.next()){
		curyeardrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Code"))+"'>"+ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Description"))+"</option>";
	}
	
	


	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courses", courseDrp);
		
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("campusDrp", campusDrp);	
	pageContext.setAttribute("shiftcourses", shiftcourses);	
	pageContext.setAttribute("acadyearDrp", drp.fillacadyearDrp2());
	pageContext.setAttribute("curyeardrp", curyeardrp);
	pageContext.setAttribute("yearDrp", drp.fillyearlvldrp());
	pageContext.setAttribute("semDrp", drp.fillsemesterDrp());	

	

%>    

<t:Registrar title="Student Grade" from="Student Grade" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
//				alert(window.location.hostname+":"+window.location.port+"/")
//				$('#yearhidden').hide()
				var availunittotake = 'None'
				var tocreditunit = 0
				EditableTable.init();
				$("select.schedule").select2();
				$("select#shiftCourseDrp").select2();
				$("select#returneeCurYearDrp").select2();
				$("select#shiftsectionDrp").select2();	
				$("#yearDrp").select2({width:"100%"});
				$("#semesterDrp").select2({width:"100%"});
				$("select#retsectionDrp").select2();	
				$("select#fcourseDrp").select2({width:"100%"});
				$("select#acadyearDrp").select2({width:"100%"});
				
				$('#fcourseDrp').on('change',function(){
					fillstud()
				})
				$('#yearDrp').on('change',function(){
					fillstud()
				})
				$('#acadyearDrp').on('change',function(){
					fillstud()
				})
				$('#semesterDrp').on('change',function(){
					fillstud()
				})
				
				
				
				function fillstud(){
					var table = $('#editable-sample').DataTable();
	                jQuery(table.fnGetNodes()).each(function () {
	                	table.fnDeleteRow(0);
	                });
	                
	                var sem = $('#semesterDrp option:selected').val()
	                var acadyear = $('#acadyearDrp option:selected').val()
	                var yearlvl = $('#yearDrp option:selected').val()
	                var course = $('#fcourseDrp option:selected').val()
	                
	                
	                $.ajax({
    					type:'POST',
    					data:{sem:sem,acadyear:acadyear,yearlvl:yearlvl,course:course},
    					dataType: "json",
    					url: "Controller/Registrar/Student/GetStudentGrade",
    					success: function(result){
    						$(result).each(function(key , val){
    		                    var aiNew = table.fnAddData([val.Number ,val.Name ,val.CAS,val.GWA,val.button ]);	
    		                	var nRow = table.fnGetNodes(aiNew[0]);
    		    				
    		    			})
    						
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
				}
				
				$('#btnprint').click(function(){
					var items = [];
                   	var code = $('#drporg option:selected').val();
                  	var rows = $('#editable-sample').dataTable()
                       .$('tr', {
                           "filter": "applied"
                       });
                  	var studbody = ""
	                $(rows).each(function(index, el) {
	                	var studnum = $(this).closest('tr').children('td:eq(0)').text();
	                	var name = $(this).closest('tr').children('td:eq(1)').text();
	                	var cas = $(this).closest('tr').children('td:eq(2)').text();
	                	var cur = $(this).closest('tr').children('td:eq(3)').text();
	                	var stat = $(this).closest('tr').children('td:eq(4)').text();
	                    items.push({studnum:studnum,name:name,cas:cas,cur:cur,stat:stat});
	                    studbody += "<tr><td>"+studnum+"</td><td>"+name+"</td><td>"+cas+"</td><td>"+cur+"</td><td>"+stat+"</td></tr>"
	                    
	
	                })
	                console.log(items)
	                var sec = $('#fcourseDrp option:selected').text()
	                var stat =  $('#fstatusDrp option:selected').text()
	                
	                
	                var pdf = new jsPDF('p', 'pt', 'letter');
	                var breaker = '_______________________________________________________________________'

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
					pdf.text(270,110,"Student List")
					
					pdf.setFontType("italic");
					pdf.setFontSize(11);
					pdf.text(15,130,"Course:")
					
					pdf.setFontType("italic");
					pdf.setFontSize(11);
					pdf.text(55,130,sec)
					
					specialElementHandlers = {
						'#bypassme': function(element, renderer){
							return true
						}
					}
					
					studbody = "<thead><th>Student Number</th><th>Student Name</th><th>Course and Section</th><th>GPA</th></thead><tbody>"+studbody+"</tbody>"
					$('#myHiddenTable').html(studbody)
					console.log(studbody)
					var res = pdf.autoTableHtmlToJson(document.getElementById("myHiddenTable"),true);
				    pdf.autoTable(res.columns, res.data, {
				      startY: 170
				    });

				   	
					
	                
	                
	                var myImage = new Image();
					myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
					myImage.onload = function(){
						pdf.addImage(myImage , 'png', 520, 20, 50, 50);
						 var uri = pdf.output('dataurlstring');
				  	   	 openDataUriWindow(uri);
				  	};
					
					
				})
				
				var latstudnum = ''
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
			
				function openDataUriWindow(url) {
				    var html = '<html>' +
				        '<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style>' +
				        '<body>' +
				        '<iframe src="' + url + '"></iframe>' +
				        '</body></html>';
				    a = window.open();
				    a.document.write(html);
				}
				
				
					
				
			
				
				
				var getlateststudnum = ""
				$('#editable-sample').on('click','a.profile',function(){
					var studentnumber = $(this).closest('tr').children('td:eq(0)').text()
					getlateststudnum = studentnumber
					var studentname = $(this).closest('tr').children('td:eq(1)').text()
					$('#studnum').html(studentnumber)
					$('#studname').html(studentname)
					
					$.ajax({
    					type:'POST',
    					data:{studentnumber: studentnumber},
    					url: "Controller/Registrar/Student/GetProfile",
    					success: function(result){
    						var item = JSON.parse(result)
    						$('#emailTxt').html(item.emailaddress)
    						$('#dobTxt').html(item.dob)
    						$('#pobTxt').html(item.pob)
    						$('#cnTxt').html(item.contactnum)
    						$('#ecnTxt').html(item.guardiannum)
    						$('#genTxt').html(item.gender)
    						$('#csTxt').html(item.civil)
    						$('#addTxt').html(item.address)
    						
    						
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					$.ajax({
    					type:'POST',
    					data:{studentnumber: studentnumber},
    					url: "Controller/Registrar/Student/GetEducationalAttainment",
    					success: function(result){
    						var item = JSON.parse(result)
    						var ntbody = ""
    						$('#educationalAttainmentTbl').html('')
    						$(item).each(function(key,val){
    							//alert(val.lvl)
    							$('#educationalAttainmentTbl').append('<tr data-row="'+val.row+'"><td><input type="text" value="'+val.school+'" class="form-control schoolnameTxt" placeholder="ex. QCPU" ></td><td>'+schoolvl+'</td><td><input type="text"  value="'+val.course+'" class="form-control courseTxt" placeholder="ex. BSIT" ></td><td><input type="text" value="'+val.address+'" class="form-control addressTxt" placeholder="ex. San Bartolome, Novaliches, Quezon City" ></td><td><input type="text" class="form-control incyearTxt"  value="'+val.year+'" placeholder="ex. 2019" ></td></tr>')
								$('#educationalAttainmentTbl').find("tr .schoollevel").last().val(val.lvl)
    						})
    						$('select.schoollevel').select2({width:"100%"})
    						
    						
    						
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
					
				})
				$('#SaveProfileBtn').click(function(){
					swal({
	                    title: "Are you sure?",
	                    text: "The record will be save and will be use for further transaction",
	                    type: "warning",
	                    showCancelButton: true,
	                    confirmButtonColor: '#228B22',
	                    confirmButtonText: 'Yes!',
	                    cancelButtonText: "No!",
	                    closeOnConfirm: false,
	                    closeOnCancel: false
	                },
	                function (isConfirm) {
	                    if (isConfirm) {
	                    	var fname = $('#firstNameTxt').val()
	    					var mname =  $('#middleNameTxt').val()
	    					var lname =  $('#lastNameTxt').val()
	    					var con = $('#conTxt').val()
	    					var email = $('#emailTxt').val()
	    					var gname = $('#guardianNameTxt').val()
	    					var gcon = $('#guardianNumberTxt').val()
	    					var dob = $('#dobTxt').val()
	    					var pob = $('#pobTxt').val()
	    					var add = $('#addressTxt').val()
	    					var gen = $('#genderDrp').val()
	    					var civil = $('#civilDrp').val()
	    					
	    					$.ajax({
	        					type:'POST',
	        					data:{
	        						fname : fname,
	        						mname : mname,
	        						lname : lname,
	        						con : con,
	        						email : email,
	        						gname : gname,
	        						gcon : gcon,
	        						dob : dob,
	        						pob : pob,
	        						add : add,
	        						gen : gen,
	        						civil : civil,
	        						latcode:peditnum},
	        					url: "Controller/Registrar/Student/StudentProfile",
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
				
				
				
			
				
				$('#nextprofile').click(function(){
					$("#studentmainprofile").slideUp()
					$("#firstpagebtn").slideUp()
					$("#secondpagebtn").slideDown()
					$("#educationalAttainment").slideDown()
					
					
				})
				$('#backprofile').click(function(){
					$("#secondpagebtn").slideUp()
					$("#educationalAttainment").slideUp()
					$("#studentmainprofile").slideDown()
					$("#firstpagebtn").slideDown()
					
					
				})
				var schoolvl = '<select class="populate schoollevel"  ><option value="default" selected="selected" disabled>Select a School Level</option><option value="Elementary">Elementary</option><option value="High School">High School</option><option value="Senior High School">Senior High School</option><option value="Vocational Technology">Vocational Technology</option><option value="College">College</option></select>'
				
				$('#addrowBtn').click(function(){
					var edubtbody = $('#educationalAttainmentTbl').text()
					if(edubtbody.includes("No Data available")){
						 $('#educationalAttainmentTbl').html('<tr data-row="None"><td><input type="text" class="form-control schoolnameTxt" placeholder="ex. QCPU" ></td><td>'+schoolvl+'</td><td><input type="text" class="form-control courseTxt" placeholder="ex. BSIT" ></td><td><input type="text" class="form-control addressTxt" placeholder="ex. San Bartolome, Novaliches, Quezon City" ></td><td><input type="text" class="form-control incyearTxt" placeholder="ex. 2019" ></td></tr>')
					}else{
						 $('#educationalAttainmentTbl').append('<tr data-row="None"><td><input type="text" class="form-control schoolnameTxt" placeholder="ex. QCPU" ></td><td>'+schoolvl+'</td><td><input type="text" class="form-control courseTxt" placeholder="ex. BSIT" ></td><td><input type="text" class="form-control addressTxt" placeholder="ex. San Bartolome, Novaliches, Quezon City" ></td><td><input type="text" class="form-control incyearTxt" placeholder="ex. 2019" ></td></tr>')
						
					}
					$('select.schoollevel').select2({width:'100%'})
					
					
					
					
					
				})
				var educattainmentlist = []
				$('#saverowBtn').click(function(){
					educattainmentlist = []
					 $('#educationalAttainmentTbl tr').each(function(){
						 var rowval = $(this).data('row').toString()
						 var school = $(this).find('.schoolnameTxt').val()
						 var schoollevel = $(this).find('.schoollevel option:selected').val()
						 var course = $(this).find('.courseTxt').val()
						 var address = $(this).find('.addressTxt').val()
						 var incyear = $(this).find('.incyearTxt').val()
						 
						 educattainmentlist.push({studnum:getlateststudnum,type:rowval,school:school,schoollevel:schoollevel,course:course,address:address,incyear:incyear});
					 })
					 
					 $.ajax({
     					type:'POST',
     					data:{educattainment: JSON.stringify(educattainmentlist)},
     					url:'Controller/Registrar/Student/EducationalAttainment',
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
//     						
     					},
                         error: function (response) {
                             swal("Error encountered while adding data", "Please try again", "error");
                         }
     				});
					 console.log(educattainmentlist)
					
					
				})
				
				
				
			
				$("#educationalAttainment").slideUp()
				$("#secondpagebtn").slideUp()
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
	
		<script src="../Assets/js/html2canvas.js"></script>
		<script src="../Assets/js/jspdf.js"></script>
		
		<script src="../Assets/js/jspdf.debug.js"></script>
		<script src="../Assets/js/jspdf.plugin.autotable.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-ui.min.js"></script>
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
                                            <button class="btn btn-success " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <div class="row">
	                                    <div class="col-lg-6">
		                                    <h5 style="">Course</h5>
		                                    <select id="fcourseDrp" class="populate" >
					                        	<option value="All">All</option>
					                        	${courses}
					                        </select>
	                                    </div>
                                    	<div class="col-lg-6">
					                   		<h5 style="">Year Level</h5>
					                    	<select class="populate" id="yearDrp" >
					                  	        <option value="All" selected="selected" disabled="disabled" >All</option>                  	
					                           	${yearDrp}
					                        </select>   
					            		</div>
					            	</div>
                                    <div class="row" style="margin-top:10px">
					            		<div class="col-lg-6" >
					                    	<h5 style="">Academic Year</h5>
					                        <select class="populate " id="acadyearDrp">
						                  	    <option value="default" selected="selected" disabled="disabled" >Select a Academic Year</option>                            	       	
					                  			${acadyearDrp}      	
					                		</select>
						                </div>
					            		<div class="col-lg-6">
					                   		<h5 style="">Semester</h5>
					                    	<select class="populate" id="semesterDrp" >
					                  	        <option value="default" selected="selected" disabled="disabled" >Select a Semester</option>                            	       	
					                  	       	 ${semDrp}      	
					                        </select>   
					            		</div>
					            	</div>
                                    
                                    <table class="hidden" id="myHiddenTable">
                                    </table>
                                    
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 16%">Student Number</th>
	                                            <th style="width: 20%">Student Name</th>
	                                            <th style="width: 12%">Course and Section</th>
	                                            <th style="width: 12%">GPA</th>
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="EditProfile" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Subject-Title">Edit Profile</h4>
	                </div>
	                <div class="modal-body" id="enrollBody"> 
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
                                Guardian Name <input type="text" class="form-control" placeholder="ex. Juan Dela Cruz" id="guardianNameTxt" >
                            </div>
                        	<div class="col-lg-6" style="padding-top:10px">
                                Guardian Contact Number<input type="text" maxlength="11" class="form-control" placeholder="ex. 09xxxxxxxxx"  id="guardianNumberTxt" >
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
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="enrollClose" type="button">Close</button>
            	        <button class="btn btn-success " id="SaveProfileBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="shift" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Subject-Title">Shift</h4>
	                </div>
	                <div class="modal-body" > 
		                <div class="row">
			                <div class="col-lg-6">
			                    Course
		             			<select id="shiftCourseDrp" class="populate" style="width:100%">
		                        	${shiftcourses}
		                        </select>  
		                    </div>
		                    <div class="col-lg-6">
			                    Section
		             			<select id="shiftsectionDrp" class="populate" style="width:100%">
		             				<option value="default" selected disabled>Select a Section</option>
		                        </select>  
		                    </div>
		                    <div class="col-lg-12" style="margin-top:20px">
			                    Credited Subjects
		                        <table class='table table-striped table-hover table-bordered'>
	    	   						<thead>
	    		   							<tr>
	    		   						    	<th style='width: 20%'>Code</th>
	    		   						        <th style='width: 25%'>Description</th>
	    		   						        <th style='width: 15%'>Prerequisite</th>
	    		   						        <th style='width: 5%'>Cred. Unit</th>
	    		   						   	</tr>
	    		   					</thead>
	    		   					<tbody id="shiftBody">
									   <tr>
									   		<td style="font-size:15px" colspan="4" ><center class="codeText"></center></td>
									   </tr>
	    		   					</tbody>
		           				</table>
		                    </div>
		                    <div class="col-lg-12" style="margin-top:20px">
			                    Curriculum
	                        	<table class="table table-striped table-hover table-bordered" id="itemsTbl">
	                            	<thead>
	                                       <tr>
	                                           <th style="width: 20%">Code</th>
						                	<th style="width: 30%">Description</th>
						                	<th style="width: 5%">Lec. Hours</th>
						                	<th style="width: 5%">Lab. Hours	</th>
						                	<th style="width: 5%">Cred. Units</th>
						                	<th style="width: 30%">Schedule</th>
						                	<th style="width: 5%">Action</th> 
	                                       </tr>
	                                   </thead>
	                                   <tbody id="cmainBody">    
									   <tr>
									   		<td style="font-size:15px" colspan="7" ><center class="codeText"></center></td>
									   </tr>
	                                   </tbody>
	                           	</table>
		                    </div>
		                </div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="ShiftClose" type="button">Close</button>
            	        <button class="btn btn-success " id="shiftBtn" type="button">Shift</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Returnee" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Subject-Title">Returnee</h4>
	                </div>
	                <div class="modal-body" > 
	                  
		                <div class="row">
			                <div class="col-lg-6">
			                    Curriculum Year
		             			<select id="returneeCurYearDrp" class="populate" style="width:100%">
		                        	${curyeardrp}
		                        </select>  
		                    </div>
		                    <div class="col-lg-6">
			                    Section
		             			<select id="retsectionDrp" class="populate" style="width:100%">
		             				<option value="default" selected disabled>Select a Section</option>
		                        </select>  
		                    </div>
		                    <div class="col-lg-12">
			                  	<div class="modal-body" id="retuneeCurBody"> 
				                   
				                </div>
		                  	</div>
		                    
		                    <div class="col-lg-12" style="margin-top:20px">
			                    Curriculum
	                        	<table class="table table-striped table-hover table-bordered" id="itemsTbl">
	                            	<thead>
	                                       <tr>
	                                           <th style="width: 20%">Code</th>
						                	<th style="width: 30%">Description</th>
						                	<th style="width: 5%">Lec. Hours</th>
						                	<th style="width: 5%">Lab. Hours	</th>
						                	<th style="width: 5%">Cred. Units</th>
						                	<th style="width: 30%">Schedule</th>
						                	<th style="width: 5%">Action</th> 
	                                       </tr>
	                                   </thead>
	                                   <tbody id="rmainBody">    
									   <tr>
									   		<td style="font-size:15px" colspan="7" ><center class="codeText"></center></td>
									   </tr>
	                                   </tbody>
	                           	</table>
		                    </div>
		                </div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="ShiftClose" type="button">Close</button>
            	        <button class="btn btn-success " id="retSaveBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>

	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Profile" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
                  <aside class="profile-nav alt">
                           <section class="panel">
                               <div class="user-heading alt gray-bg">
                                   <a href="#">
                                       <img alt="" src="../Assets/images/User/default.png">
                                   </a>
                                   <h1 id="studname">EKV</h1>
                                   <p id="studnum">Consistent B</p>
                               </div>

                               <ul class="nav nav-pills nav-stacked" id="studentmainprofile">
                                   <li><a href="javascript:;"> <i class="fa fa-rss"></i> Email Address <span class="badge label-success pull-right r-activity" id="emailTxt">10</span></a></li>
                                   <li><a href="javascript:;"> <i class="fa fa-phone"></i> Contact Number <span class="badge label-success pull-right r-activity" id="cnTxt">10</span></a></li>
                                   <li><a href="javascript:;"> <i class="fa fa-phone-square"></i> Emergency Contact Number <span class="badge label-success pull-right r-activity" id="ecnTxt">03</span></a></li>
                                   <li><a href="javascript:;"> <i class="fa fa-smile-o"></i> Gender <span class="badge label-success pull-right r-activity" id="genTxt">10</span></a></li>
                                   <li><a href="javascript:;"> <i class="fa fa-thumb-tack"></i> Civil Status <span class="badge label-success pull-right r-activity" id="csTxt">10</span></a></li>
                                   <li><a href="javascript:;"> <i class="fa fa-calendar fa-calendar-o"></i> Birthday <span class="badge label-success pull-right r-activity" id="dobTxt">15</span></a></li>
                                   <li><a href="javascript:;"> <i class="fa fa-location-arrow"></i> Place of Birth <span class="badge label-success pull-right r-activity" id="pobTxt">11</span></a></li>
                                   <li><a href="javascript:;"> <i class="fa fa-globe"></i> Address <span class="badge label-success pull-right r-activity" id="addTxt">11</span></a></li>
                               </ul>
                               <div class="col-lg-12" style="margin-top:10px">
								   <div id="educationalAttainment">
									   	 <table class="table table-striped table-hover table-bordered" id="">
			                            	<thead>
			                                       <tr>	
			                                       		<th style="width: 25%">School</th>
									                	<th style="width: 20%">School Level</th>
									                	<th style="width: 20%">Course</th>
									                	<th style="width: 20%">Address</th>
									                	<th style="width: 15%">Inclusive years</th>
			                                       </tr>
			                                   </thead>
			                                   <tbody id="educationalAttainmentTbl">    
											   <tr data-row="None" >
											   		<td style="text-align:center;font-style:italic" colspan="5" >No Data available</td>
											   </tr>
			                                   </tbody>
			                           	</table>
								   </div>
                               </div>
                               <div id="firstpagebtn">
                               		<a style="margin-left:95%" class='btn btn-info ' id="nextprofile" title="Educational Attainment" href='javascript:;'><i class='fa fa-arrow-circle-right'></i></a>
                               </div>
                               <div id="secondpagebtn" >
                               		<a style="margin-left:2%" class='btn btn-success ' id="addrowBtn" title="Add row" href='javascript:;'><i class='fa fa-plus'></i></a>
                               		<a class='btn btn-cancel tar' style="color:white" id="saverowBtn" title="Save" href='javascript:;'><i class='fa fa-save'></i></a>
                               		<a style="margin-left:85%" class='btn btn-info ' id="backprofile" title="Student Profile" href='javascript:;'><i class='fa fa-arrow-circle-left'></i></a>
                               </div>
  
                           </section>
                       </aside>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" type="button">Close</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    
	        
	    </jsp:body>


</t:Registrar>
