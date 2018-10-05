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
	ResultSet rs = stmnt.executeQuery("SELECT CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active'),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  group by Student_Taken_Curriculum_Subject_StudentAccountID");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		couid = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"));
		String curcode = rs.getString("CurriculumYear_Code");
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		String retid = rs.getString("retid");
		if(retid.equals("Not Returnee")){
			tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+rs.getString("enrolledba")+"</td><td style='text-align:center'> <a class='btn btn-success schedule' data-toggle='modal' href='#Schedule'><i class='fa fa-calendar'></i></a> <a class='btn btn-cancel tar profile' style='color:white' data-toggle='modal' href='#Profile'><i class='fa fa-eye'></i></a>  <a class='btn btn-warning shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'><i class='fa fa-exchange'></i></a> <a class='btn btn-info curriculum' title='Curriculum' data-toggle='modal' href='#curriculum'><i class='fa fa-flag'></i></a> <a class='btn btn-danger addreturnee' title='Returnee'><i class='fa fa-rotate-right'></i></a> </td></tr>"; 
			
		}
		else{
			tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+rs.getString("enrolledba")+"</td><td style='text-align:center'> <a class='btn btn-success schedule' data-toggle='modal' href='#Schedule'><i class='fa fa-calendar'></i></a> <a class='btn btn-cancel tar profile' style='color:white' data-toggle='modal' href='#Profile'><i class='fa fa-eye'></i></a>  <a class='btn btn-warning shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'><i class='fa fa-exchange'></i></a> <a class='btn btn-info curriculum' title='Curriculum' data-toggle='modal' href='#curriculum'><i class='fa fa-flag'></i></a> <a class='btn btn-info tar returnee' title='Returnee' data-toggle='modal' data-curriculum-code='"+curcode+"' href='#Returnee'><i class='fa fa-rotate-left'></i></a> </td></tr>"; 
			
		}
		
	}
	String shiftcourses = "<option value='default' selected disabled >Select a Course</option>";
	rs = stmnt.executeQuery("SELECT * FROM `r_course` where Course_Display_Status = 'Active'");
	while(rs.next()){
		shiftcourses += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"))+"'>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</option>";
	}


	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("campusDrp", campusDrp);	
	pageContext.setAttribute("shiftcourses", shiftcourses);	

%>    

<t:Registrar title="Student" from="Student" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
//				alert(window.location.hostname+":"+window.location.port+"/")
//				$('#yearhidden').hide()
				EditableTable.init();
				$("select.schedule").select2();
				$("select#shiftCourseDrp").select2();
				$("select#shiftsectionDrp").select2();				
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
				
				$('#editable-sample').on('click','a.addreturnee',function(){
					var studnum = $(this).closest('tr').children('td:eq(0)').text()

					swal({
	                    title: "Are you sure?",
	                    text: "Do you really want to mark this student to file a leave of absence",
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
		        					data:{studnum: studnum},
		        					url: "Controller/Registrar/Student/AddReturnee",
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
		                    }
		
		                });

					
				})
				
				
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
				
				
				$('#editable-sample').on('click','a.shift',function(){
					var studentnumber = $(this).closest('tr').children('td:eq(0)').text()
					var studentname = $(this).closest('tr').children('td:eq(1)').text()
					$('#studnum').html(studentnumber)
					$('#studname').html(studentname)
					latstudnum = studentnumber
					/*
					var course = $(this).data('course')
					alert(course)
					$.ajax({
    					type:'POST',
    					data:{course: course},
    					url: "Controller/Registrar/Student/ShiftCurriculum",
    					success: function(result){
    						var item = JSON.parse(result)
    						console.log(item)
    						
    						
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					*/
					
					
				})
				
				$('#shiftCourseDrp').change(function(){
					var course = $(this).val()
					
					
					
					$.ajax({
    					type:'POST',
    					data:{course: course,studnum:latstudnum},
    					url: "Controller/Registrar/Student/ShiftCurriculum",
    					success: function(result){
    						var item = JSON.parse(result)
    						var tbody = ''
    						var body = ''
       						$.each(item,function(key,val){
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
       					 				
	       					 			if(val2.status == 'Cleared'){
		       					 			tbody += 	"<tr><td>"+val2.code+"</td>"+
					   						"<td>"+val2.desc+"</td>"+
					   						"<td style='font-weight:bold;'>"+prereq+"</td>"+
					   						"<td>"+val2.units+"</td></tr>"
	       					 				
	       					 			}
       					 				
       					 			}
       					 			else{
    						   			$.each(val2.group,function(key3,val3){
    	   					 				var prereq = ''
       	   					 				var i = 0
       	   					 				$.each(val3.prerequisite,function(key4,val4){
       	   					 					if(i != 0)
       	   					 						prereq  += ', '
       	   					 					prereq += val4
       	   					 				
       	   					 					i++
       	   					 				})
											if(val3.status == 'Cleared')
												tbody += 	"<tr><td>"+val2.code+"</td>"+
						   						"<td>"+val2.desc+"</td>"+
						   						"<td style='font-weight:bold;'>"+prereq+"</td>"+
						   						"<td>"+val2.units+"</td></tr>"
    						   			
    						   				
    						   				
    						   			})
    						   						
       					 			}
       					 			
       					 		})
       					 		
       					        
       						})
       						if(tbody == ''){
	   					 		body = "<tr style='font-style:italic;text-align:center'><td colspan='4'>No credited subjects</td></tr>";
   					 			
   					 		}
       						else{
	   					 		body = tbody;
       							
       						}
       						$('#shiftBody').html(body)
    						console.log(item)
    						
    						
    						$.ajax({
			   					type:'POST',
			   					data:{curcode: course},
			   					url:'Controller/Registrar/Student/ShifterCurriculum',
			   					success: function(result2){
			   						var item = $.parseJSON(result2)
		    						$('#cmainBody').html('')
		       						$.each(item, function (key, val) {
		       							if(val.group == ''){
		   									var sel = ''
		   									var sec = ''
		   									$.each(val.section, function (key2, val2) {
		   										var sched = ''
		   	   									sec = val2.section
		   	   									var j = 0
		   										$.each(val2.sched, function (key3, val3) {
			   										if(j != 0)
			   											sched += " / "
			   										sched += val3.schedule 
			   										j++
			   									});
		   	   									
		   										sel += "<option value='"+sec+"'>"+sec+" - "+sched+"</option>"

		   									});
			       							$('#cmainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val.tuition+'" style="cursor: pointer;">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val.units+'</center></td><td><select class="populate sectionselect"  >'+sel+'</td><td><center><input type="checkbox" class="form-control ckbox" style="width:20px;height:20px;" ></center></td></tr>')
		       							}
		           						else{
		           							$('#cmainBody').append('<tr><td colspan="7" style="font-weight:bold;font-style:italic;font-size:12px;" ><center class="codeText" style="text-align:center;font-weight:bold">'+val.code+'</center></td></tr>')
		           							$.each(val.group, function (key2, val2) {
		       									var sel = ''
		       	   								var sec = ''
		       	   								$.each(val2.schedule, function (key3, val3) {
		       										var sched = ''
		       	   									sec = val3.section
		       	   									var j = 0
		       										$.each(val3.schedule, function (key4, val4) {
		       											$.each(val4, function (key5, val5) {
		        	   										if(j != 0)
		        	   											sched += " / "
		        	   										sched += val5
		        	   										j++
		        	   									});
		    	   									});
		       	   									
		       										sel += "<option value='"+sec+"'>"+sec+" - "+sched+"</option>"

		       									});
		       	   								
			           							$('#cmainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject" ><center class="codeText" data-tuition="'+val2.tuition+'" style="cursor: pointer;">'+val2.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val2.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val2.units+'</center></td><td><select class="populate sectionselect"  >'+sel+'</td><td><center><input type="checkbox" class="form-control ckbox" style="width:20px;height:20px;" ></center></td></tr>')
		    										
		           							});
		           							
		           							
		           						}
		       							$("select.sectionselect").select2( {width: '100%' });
		                            });
		       						if($('#cmainBody').html() == ''){
		       							$('#cmainBody').html('<tr><td style="font-size:12px" ><center class="codeText"></center></td><td style="font-size:12px" ><center class="descText"></center></td><td style="font-size:12px" ><center class="unitText"></center></td><td><center></center></td></tr>')
		       							
		       						}
		       						else{
		       							$('#cmainBody').append('<tr><td style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px" colspan="7" id="totunit">Total: 0 Unit</td></tr>')
		       						}
			
			   						
			   						
			   					},
			                       error: function (response) {
			                           swal("Error encountered while adding data"+response, "Please try again", "error");
			                       }
			   				})
			   				
			   				$.ajax({
		    					type:'POST',
		    					data:{course: course},
		    					url: "Controller/Registrar/Student/GetSection",
		    					success: function(result){
		    						var item = JSON.parse(result)
		    						console.log(item)
		    						var body = '<option value="default" selected disabled>Select a Section</option>'
		    						$.each(item,function(key,val){
		    							body += "<option value='"+val+"'>"+val+"</option>"
		    							
		    						})
		    						$('#shiftsectionDrp').html(body)
		    						
		    						
		    					},
		                        error: function (response) {
		                            swal("Error encountered while accessing the data", "Please try again", "error");
		                        }
		    				});
			   				
			   				
			    						
    						
    						
    						
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
					
					
					
				})
				
				$('#cmainBody').on('change','.ckbox',function(){
	            	totunit = 0;
					tottuitionunit = 0
	            	$('#cmainBody tr').each(function(){
	            		if($(this).find('.unitTexts').html() != undefined){
	//                		alert($(this).find('.unitTexts').html())
	            			if($(this).find('input:checkbox').prop("checked") == true){            				
	            				totunit += parseInt($(this).find('.unitTexts').html())
	            				tottuitionunit += parseInt($(this).find('.codeText').data("tuition"))
	            				
	            			}
	            		}
	            		
	            	});
	            	$('#totunit').html('Total: ' + totunit + ' Units')
	            	
	        		
	            });
				
				
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
           					 				var enrollstatus = val2.estatus
           					 				
           					 				if(enrollstatus == 'Enrolled')
           					 					st = "Enrolled"           					 				
           					 				else if(val2.status == 'Not Cleared')
           					 					st = "<a class='btn btn-info enroll' title='Enroll this Subject'  data-toggle='modal' href='#enroll'><i class='fa fa-bolt'></i></a>"
        					 				else{
           					 					st = 'Cleared'
           					 					enrollstatus = 'Cleared'
        					 					
        					 				}
           					 					
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
    											enrollstatus = val3.estatus
    											if(enrollstatus == 'Enrolled')
               					 					st = "Enrolled"             					 				
               					 				else if(val3.status == 'Not Cleared')
    	       					 					st = "<a class='btn btn-info enroll' title='Enroll this Subject'  data-toggle='modal' href='#enroll'><i class='fa fa-bolt'></i></a>"
    	    					 				else{
    	       					 					st = 'Cleared'
    	           					 					enrollstatus = 'Cleared'
    	        					 					
    	        					 			}
        						   			
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
        		   						        "<th style='width: 15%'>Prerequisite</th>"+
        		   						        "<th style='width: 5%'>Cred. Unit</th>"+
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
	                    confirmButtonColor: '#228B22',
	                    confirmButtonText: 'Yes!',
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
				$('#shiftBtn').click(function(){
					var course = $('#shiftCourseDrp').val()
					var section = $('#shiftsectionDrp').val()
					var curtaken = []
					$('#cmainBody tr').each(function(){
						var takenstat = $(this).find('.ckbox').prop('checked') 
						if(takenstat != undefined){
							var code = $(this).find('.codeText').text()
							var sect =  $(this).find('.sectionselect option:selected').val()
							if(takenstat == true)
								takenstat = 'true'
							else
								takenstat = 'false'
							curtaken.push({code:code,section:sect,takenstat:takenstat})
							
						}
					})
					console.log(curtaken)
					
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
		                    	$.ajax({
		        					type:'POST',
		        					data:{course: course,studnum: latstudnum,section: section,curtaken:JSON.stringify(curtaken)},
		        					url: "Controller/Registrar/Student/Shift",
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
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 20%">Student Number</th>
	                                            <th style="width: 20%">Student Name</th>
	                                            <th style="width: 20%">Course and Section</th>
	                                            <th style="width: 20%">Status</th>
	                                            <th style="width: 200%">Action</th>
	                                            
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
