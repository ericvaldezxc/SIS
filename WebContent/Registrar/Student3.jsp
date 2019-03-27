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
	ResultSet rs = stmnt.executeQuery("SELECT Student_Account_Year,Student_Account_CourseID,Student_Account_CurriculumYearID,Curriculum_ID,Student_Account_ID,Curriculum_Max_Credited_Unit,CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active' and Returnee_StudentAccountID =  Student_Account_ID ),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_curriculum on CurriculumItem_CurriculumID = Curriculum_ID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  group by Student_Taken_Curriculum_Subject_StudentAccountID");
	while(rs.next()){
		String fstudid = rs.getString("Student_Account_ID");
		String curyearid = rs.getString("Student_Account_CurriculumYearID");
		String studyearlvl = rs.getString("Student_Account_Year");
		String courid = rs.getString("Student_Account_CourseID");
		String courseCode = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"));
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		couid = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"));
		String curcode = ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Code"));
		String curdesc = ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Description"));
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		String retid = rs.getString("retid");
		String enrollstat = rs.getString("enrolledba");
		String printregi = "";
		String unitstotake = "";
		int i = 0;
		String maxunit = "0";
		ResultSet rs2 = stmnt2.executeQuery("SELECT * FROM `r_curriculum` where Curriculum_CurriculumYearID = '"+curyearid+"' and Curriculum_CourseID = '"+courid+"' and Curriculum_SemesterID = (SELECT Semester_ID FROM `r_semester` WHERE Semester_Active_Flag = 'Active' ) and Curriculum_YearLevel = '"+studyearlvl+"'");
		while(rs2.next()){
			maxunit = rs2.getString("Curriculum_Max_Credited_Unit");
		}		

		
		
		rs2 = stmnt2.executeQuery("select "+maxunit+"-IFNULL(SUM(Subject_Credited_Units),0) as unitotake from t_student_taken_curriculum_subject inner join r_subject ON Student_Taken_Curriculum_Subject_SubjectID = Subject_ID where Student_Taken_Curriculum_Subject_StudentAccountID = '"+fstudid+"' and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Taken_Curriculum_Subject_AcademicIYearID = (select Academic_Year_ID from r_academic_year where Academic_Year_Active_Flag ='Present') and Student_Taken_Curriculum_Subject_SemesterID = (select Semester_ID from r_semester where Semester_Active_Flag = 'Active') ");
		while(rs2.next()){
			unitstotake = rs2.getString("unitotake");
		}		
		
		String tdunit = "<td>Not Available</td>";
		if(enrollstat.equals("Enrolled")){
			printregi = "<li><a class='printregi' title='Print Registration Card'>Print Registration Card <i class='fa fa-print'></i></a></li>";
			tdunit = "<td>"+ unitstotake+" Units</td>";
		}
		String buttons = "<div class='btn-group' style='margin-left:0px'>"+
	    "<button data-toggle='dropdown' class='btn btn-primary dropdown-toggle ' type='button'><span><i class='fa fa-ellipsis-v'></i></span></button>"+
	    "<ul role='menu' class='dropdown-menu'>";
	       
		
		/*
		if(retid.equals("Not Returnee")){
			tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+curdesc+"</td><td>"+rs.getString("enrolledba")+"</td><td>"+unitstotake+" Unit/s</td><td style='text-align:center'> <a class='btn btn-success schedule' data-toggle='modal' title='Student Schedule' href='#Schedule'><i class='fa fa-calendar'></i></a> <a class='btn btn-cancel tar profile' style='color:white' data-toggle='modal' title='View Student Profile'  href='#Profile'><i class='fa fa-eye'></i></a> <a class='btn pedit' style='background-color:#33cc33;color:white' style='color:white' data-toggle='modal' title='Edit Student Profile'  href='#EditProfile'><i class='fa fa-edit'></i></a>  <a class='btn btn-warning shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'><i class='fa fa-exchange'></i></a> <a class='btn btn-info curriculum' title='Curriculum' data-toggle='modal' data-available-units-to-take='"+unitstotake+"' href='#curriculum'><i class='fa fa-flag'></i></a> "+printregi+" <a class='btn btn-danger addreturnee' title='Returnee'><i class='fa fa-rotate-right'></i></a> <a title='Print Transcript of records' class='btn btn-success tor' data-studnum='"+rs.getString("Student_Account_Student_Number")+"' ><i class='fa fa-print'></i></a> </td></tr>"; 
			
		}
		else{
			tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+curdesc+"</td><td>"+rs.getString("enrolledba")+"</td><td>"+unitstotake+" Unit/s</td><td style='text-align:center'> <a class='btn btn-success schedule' data-toggle='modal' href='#Schedule'><i class='fa fa-calendar'></i></a> <a class='btn btn-cancel tar profile' style='color:white' data-toggle='modal' href='#Profile'><i class='fa fa-eye'></i></a> <a class='btn pedit' style='background-color:#33cc33;color:white' style='color:white' data-toggle='modal' href='#EditProfile'><i class='fa fa-edit'></i></a> <a class='btn btn-warning shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'><i class='fa fa-exchange'></i></a> <a class='btn btn-info curriculum' title='Curriculum' data-toggle='modal' data-available-units-to-take='"+unitstotake+"' href='#curriculum'><i class='fa fa-flag'></i></a> "+printregi+" <a class='btn btn-info tar returnee' title='Returnee' data-course='"+couid+"' data-toggle='modal' data-curriculum-code='"+curcode+"' href='#Returnee'><i class='fa fa-rotate-left'></i></a> <a title='Print Transcript of records' class='btn btn-success tor' data-studnum='"+rs.getString("Student_Account_Student_Number")+"' ><i class='fa fa-print'></i></a> </td></tr>"; 
			
		}courseCode
		*/
		if(retid.equals("Not Returnee")){
			buttons = buttons + "<li><a class='enrolledSubject' data-id='"+fstudid+"' data-toggle='modal' title='Enrolled Subject' href='#EnrolledSubjectModal'>Enrolled Subject<i class='fa fa-eye'></i></a> </li><li><a class='schedule' data-toggle='modal' title='Student Schedule' href='#Schedule'>View Schedule <i class='fa fa-calendar'></i></a> </li><li><a class='profile' data-toggle='modal' title='View Student Profile'  href='#Profile'>View Profile <i class='fa fa-eye'></i></a> </li><li><a class='pedit'data-toggle='modal' title='Edit Student Profile'  href='#EditProfile'>Edit Profile <i class='fa fa-edit'></i></a>  </li><li><a class='shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'>Shift <i class='fa fa-exchange'></i></a> </li><li><a class='curriculum' title='Curriculum' data-toggle='modal' data-available-units-to-take='"+unitstotake+"' data-course='"+courseCode+"' href='#curriculum'>Curriculum Status <i class='fa fa-flag'></i></a></li><li> "+printregi+" </li><li><a class='addreturnee' title='Returnee'>Make Returnee <i class='fa fa-rotate-right'></i></a> </li><li><a title='Print Transcript of records' class='tor' data-studnum='"+rs.getString("Student_Account_Student_Number")+"' >Print TOR <i class='fa fa-print'></i></a></li></ul></div>";
			tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+curdesc+"</td><td>"+rs.getString("enrolledba")+"</td><td>"+unitstotake+" Unit/s</td><td style=''>"+buttons+"</td></tr>"; 
			
		}
		else{
			buttons = buttons + "<li><a class='enrolledSubject' data-id='"+fstudid+"' data-toggle='modal' title='Enrolled Subject' href='#EnrolledSubjectModal'>Enrolled Subject<i class='fa fa-eye'></i></a> </li><li><a class='schedule' data-toggle='modal' title='Student Schedule' href='#Schedule'>View Schedule <i class='fa fa-calendar'></i></a> </li><li><a class='profile' data-toggle='modal' title='View Student Profile'  href='#Profile'>View Profile <i class='fa fa-eye'></i></a> </li><li><a class='pedit'data-toggle='modal' title='Edit Student Profile'  href='#EditProfile'>Edit Profile <i class='fa fa-edit'></i></a>  </li><li><a class='shift' data-toggle='modal' data-course='"+couid+"'  title='Shift' href='#shift'>Shift <i class='fa fa-exchange'></i></a> </li><li><a class='curriculum' title='Curriculum' data-toggle='modal' data-available-units-to-take='"+unitstotake+"' data-course='"+courseCode+"' href='#curriculum'>Curriculum Status <i class='fa fa-flag'></i></a></li><li> "+printregi+" </li><li><a class='returnee' title='Returnee' data-course='"+couid+"' data-toggle='modal' data-curriculum-code='"+curcode+"' href='#Returnee'>Mark as Returnee<i class='fa fa-rotate-left'></i></a></li><li><a title='Print Transcript of records' class='tor' data-studnum='"+rs.getString("Student_Account_Student_Number")+"' >Print TOR <i class='fa fa-print'></i></a></li></ul></div>";

			tablebody += "<tr><td>"+ rs.getString("Student_Account_Student_Number")+"</td><td>"+ fullname+"</td><td>"+ rs.getString("Section_Code")+"</td><td>"+curdesc+"</td><td>"+rs.getString("enrolledba")+"</td><td>"+unitstotake+" Unit/s</td><td style=''> "+buttons+"</td></tr>"; 
			
		}
		
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
	pageContext.setAttribute("curyeardrp", curyeardrp);	
	

%>    

<t:Registrar title="Student" from="Student" to="">

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
				$("select#retsectionDrp").select2();	
				$("select#fstatusDrp").select2();
				$("select#fcourseDrp").select2();
				
				$('#fstatusDrp').on('change',function(){
					fillstud()
				})
				$('#fcourseDrp').on('change',function(){
					fillstud()
				})
				
				
				$('#editable-sample').on('click','a.enrolledSubject',function(){
					let myId = $(this).data('id')
//					$('#studentNumberTxtTo').val(myId)
					$('#tableBodyTo').val('')
					$.ajax({
    					type:'POST',
    					data:{id: myId},
    					dataType:"JSON",
    					url: "Controller/Registrar/Student/getEnrolledSubject",
    					success: function(result){
    						let enrolledSubjectTableBody = ''
    						$(result).each(function(key , val3){
    							$.ajax({
    		    					type:'POST',
    		    					data:{subject: val3.subjectCode},
    		    					async:false,
    		    					url: "Controller/Registrar/Student/Schedule",
    		    					success: function(result){
    		    						var item = $.parseJSON(result)
    		    						var opt = '<select class="populate selSubjectDrp" style="width:250px">'
    		    						
    		    						$.each(item,function(key,val){
    		    							var optbody = ''
    		   								$.each(val.sched,function(key2,val2){
    		   	    							optbody += val2 + ' '
    		   	    						})
    		   	    						if(val3.sectionCode == val.section)
	    		    							opt += '<option selected value="'+val.section+'">'+optbody+'</option>'
    		    							else
	    		    							opt += '<option value="'+val.section+'">'+optbody+'</option>'
    		    						})
    		    						
    		    						if(opt == '')
    		    							opt = '<option value="default">No Schedule Available</option> '
	    								
   		    							opt = opt + "</select>"
	    								console.log(val3)
		    							enrolledSubjectTableBody = $('#tableBodyTo').val()	    								
	    								enrolledSubjectTableBody = enrolledSubjectTableBody + '<tr><td data-id="'+val3.takenSubjectId+'">'+val3.subjectCode+'</td><td>'+val3.subjectDesc+'</td><td>'+opt+'</td><td>'+val3.credUnit+'</td><td style="text-align:center"><button class="btn btn-danger btn-sm deleteEnrolledSubject" data-id="'+val3.takenSubjectId+'" ><span><i class="fa fa-trash-o"></i></span></button></td></tr>'
//	    								enrolledSubjectTableBody = enrolledSubjectTableBody + '<tr><td>'+val3.subjectCode+'</td><td>'+val3.subjectDesc+'</td><td>'+val3.credUnit+'</td><td style="text-align:center"><button class="btn btn-danger btn-sm deleteEnrolledSubject" data-id="'+val3.takenSubjectId+'" ><span><i class="fa fa-trash-o"></i></span></button></td></tr>'

	    								$('#tableBodyTo').val(enrolledSubjectTableBody)
   		    							
    		    						//$('#schedDrp').html(opt)
    		    						//$('select#schedDrp').select2('val', 'default')
    		    						
    		    					},
    		                        error: function (response) {
    		                            swal("Error encountered while accessing the data", "Please try again", "error");
    		                        }
    		    				})
								enrolledSubjectTableBody = $('#tableBodyTo').val()	    		    				
    		    				//alert(enrolledSubjectTableBody)
        						if(enrolledSubjectTableBody == '')
        							enrolledSubjectTableBody = '<tr><td colspan="5" style="text-align:center"> No data available</td></tr>'
  								$('#tableBodyTo').hide()	    
       							$('#enrolledSubjectTbl').html(enrolledSubjectTableBody)
       							$("#enrolledSubjectTbl select.selSubjectDrp").select2()


    							
    							
    						
    						})

    						
    						
    						
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
				})	
				
				$('#enrolledSubjectTbl').on('click','button.deleteEnrolledSubject',function(){
					var myId = $(this).data('id')
					var btnDelete = $(this)
					swal({
	                    title: "Are you sure?",
	                    text: "Do you really want to remove this enrolled subject?",
	                    type: "warning",
	                    showCancelButton: true,
	                    confirmButtonColor: '#DD6B55',
	                    confirmButtonText: 'Yes!',
	                    cancelButtonText: "No!",
	                    closeOnConfirm: false,
	                    closeOnCancel: false
	                },
		                function (isConfirm) {
		                    if (isConfirm) {
		                    	$(btnDelete).parents("tr").remove()
		                    	$.ajax({
		        					type:'POST',
		        					data:{id: myId},
		        					url: "Controller/Registrar/Student/removeEnrolledSubject",
		        					success: function(result){
		        						
		        						swal("Record Updated!", "The data is successfully Updated!", "success");
		        						
		        						
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
					

				//start
				
				$("#importBtn").on('change', function() {
	             	$('#importModal').modal('toggle')
	        		handleFiles(this.files)
	        	});
				
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

	    		function errorHandler(evt) {
	      		  if(evt.target.error.name == "NotReadableError") {
	      		      alert("Cannot read file!");
	      		  }
	      		}

	    		
	    		function loadHandler(event) {
	    		  var csv = event.target.result;
	    		  processData(csv);
	    		}
	    		let studentForImport = []

	    		function processData(csv) {
	    		    var allTextLines = csv.split(/\r\n|\n/);
	    		    studentForImport = []
	    		    for (var i=1; i<allTextLines.length; i++) {
	    		        var row = allTextLines[i].split(';');		
	    		        for (var j=0; j<row.length; j++) {
	    			        var col = row[j].split(',');
	    			        if(col[0] != "" ){
	    			        	studentForImport.push({ firstName:col[0] , middleName:col[1] , lastName:col[2] , cn:col[3], emailAdd:col[4], guardianName:col[5], guardianContactNumber:col[6], dob:col[7] , pob:col[8] , gender:col[10] , civilStatus:col[11] , address:col[9] ,studNumber:col[12]  });
	    			        	
	    			        }
	    		        }
	    		    }
	    		    
	    			var table = $('#importList').DataTable();
	                $(table.fnGetNodes()).each(function () {
	                	table.fnDeleteRow(0);
	                });
	               
	                $(studentForImport).each(function(key , val){

	                    var aiNew = table.fnAddData([ val.studNumber, val.firstName, val.middleName, val.lastName, val.cn, val.emailAdd, val.guardianName, val.guardianContactNumber, val.dob, val.pob, val.gender, val.civilStatus, val.address]);
	                    	
	                	var nRow = table.fnGetNodes(aiNew[0]);
	    				
	    			})
//	    		    console.log({'etoyon':studentForImport})
	    		    

	    		    
	    		}
	    		
	    		$('#saveImportBtn').on('click',function(){
	    			$.ajax({
    					type:'POST',
    					data:{studentList: JSON.stringify(studentForImport)},
    					url: "Controller/Registrar/Student/importStudent",
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
                            
                        }
    				});
	    		})
				
				
				
				
				
				
				let studNumberList = []
				
    			var table = $('#editable-sample').DataTable();
                $(table.fnGetNodes()).each(function () {
                	var tr = $(this).closest('tr');    
                	var index = table.fnGetPosition(tr[0]);
                	studNumberList.push(table.fnGetData(index)[0])
                });

                
                
                //end

                let finalForExport = []
				
                let headerExcel = [ 'First Name' , 'Middle Name' , 'Last Name' , 'Contact Number' , 'Email Address' , 'Guardian Name' ,  'Guardian Contact Number' , 'Date of Birth' , 'Place of Birth', 'Address' , 'Gender' , 'Civil Status' , 'Student Number']
				$('#exportBtn').click(function(){
					exportStudentList = []
					finalForExport = []
					finalForExport.push(headerExcel)
					console.log(finalForExport)
					$.ajax({
	    					type:'POST',
	    					data:{studentList: JSON.stringify(studNumberList)},
	    					dataType: "json",
	    					url: "Controller/Registrar/Student/exportStudent",
	    					success: function(result){
	    						$(result).each(function(key , val){
	    							let exportStudentList = []
		    						exportStudentList.push(val.fname)
		    						exportStudentList.push(val.mname)
		    						exportStudentList.push(val.lname)
	    							exportStudentList.push(val.contactnum)
	    							exportStudentList.push(val.emailaddress)
		    						exportStudentList.push(val.guardianname)
		    						exportStudentList.push(val.guardiannum)
		    						exportStudentList.push(val.dob)
		    						exportStudentList.push(val.pob)
	    							exportStudentList.push(val.address)
		    						exportStudentList.push(val.gender)
		    						exportStudentList.push(val.civil)
		    						exportStudentList.push(val.studentNumber)
		    						finalForExport.push(exportStudentList)
	    						})
	    					
	    						var wb = XLSX.utils.book_new();
					             wb.Props = {
					                     Title: "Student List",
					                     Subject: "Students",
					                     Author: "EKPV",
					                     CreatedDate: new Date(2018,08,24)
					             };
					             wb.SheetNames.push("Student List");
					             
								var ws = XLSX.utils.aoa_to_sheet(finalForExport);
						        wb.Sheets["Student List"] = ws;
						        var wbout = XLSX.write(wb, {bookType:'csv',  type: 'binary'});
						        saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), 'StudentList.csv');

	    							    						
	                             
	    					},
	                        error: function (response) {
	                            
	                        }
	    				});
					
				})
				
				function s2ab(s) {
       
                     var buf = new ArrayBuffer(s.length);
                     var view = new Uint8Array(buf);
                     for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
                     return buf;
                     
             	}

				
				
				function fillstud(){
					studNumberList = []
					var table = $('#editable-sample').DataTable();
	                jQuery(table.fnGetNodes()).each(function () {
	                	table.fnDeleteRow(0);
	                });
	                
	                $.ajax({
    					type:'POST',
    					data:{status: $('#fstatusDrp option:selected').val(),course: $('#fcourseDrp option:selected').val()},
    					dataType: "json",
    					url: "Controller/Registrar/Student/GetStudent",
    					success: function(result){
    						$(result).each(function(key , val){
    							studNumberList.push(val.Number)
    		                    var aiNew = table.fnAddData([val.Number ,val.Name ,val.CAS ,val.cur,val.status,val.units ,val.button ]);	
    		                	var nRow = table.fnGetNodes(aiNew[0]);
    		    				
    		    			})
    		    			console.log(studNumberList)
    						
                             
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
					pdf.text(15,130,"Section:")
					
					pdf.setFontType("italic");
					pdf.setFontSize(11);
					pdf.text(55,130,sec)

					pdf.setFontType("italic");
					pdf.setFontSize(11);
					pdf.text(15,150,"Status:")
					
					pdf.setFontType("italic");
					pdf.setFontSize(11);
					pdf.text(50,150,stat)
					
					specialElementHandlers = {
						'#bypassme': function(element, renderer){
							return true
						}
					}
					
					studbody = "<thead><th>Student Number</th><th>Student Name</th><th>Course and Section</th><th>Curriculum</th><th>Status</th></thead><tbody>"+studbody+"</tbody>"
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
				
				
				$('#curBody').on('click','a.enroll',function(){
					$('#curriculum').modal('toggle')
					tocreditunit = $(this).data("credited-unit")
					var newavailunittotake = parseFloat(availunittotake) - tocreditunit 
					if(newavailunittotake >= 0){
						console.log(tocreditunit)
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
//	    							optbody += 
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
	    						$('#enroll').modal("toggle")
	    						
	    					},
	                        error: function (response) {
	                            swal("Error encountered while accessing the data", "Please try again", "error");
	                        }
	    				});
					}
					else{
						swal({
                            title: "There are no more allowed units to take for this semester"
                            , text: "Please check the student allowed units to take"
                            , type: "error"
                            , confirmButtonColor: '#88A755'
                            , confirmButtonText: 'Okay'
                            , closeOnConfirm: true
                        }, function (isConfirm) {
                            if (isConfirm) {
                               $('#curriculum').modal('toggle')
                            }
                        });
                       

					}
					
					
				})
				$('#enrollClose').click(function(){
					$('#curriculum').modal('toggle')
				})
				var retglobstudnum = ''
				var retglobcourse = ''
				var retglobcourse = ''
			
				$('#editable-sample').on('click','a.printregi',function(){
					var studn = $(this).closest('tr').children('td:eq(0)').text()
					var pdf = new jsPDF('l', 'mm', [150, 300]);
					var breaker = '__________________________________________________________________________________________'
					source = $('#feeTable')[0];
					specialElementHandlers = {
						'#bypassme': function(element, renderer){
							return true
						}
					}
					margins = {
					    top: 5,
					    left: 5,
					    width: 0
					  };
					
					
					pdf.setFontType("bold");
					pdf.setFontSize(8);
					pdf.text(17,10,"Quezon City Polytechnic University")
					
					pdf.setFontType("italic");
					pdf.setFontSize(8);
					pdf.text(17,13,"NOVA Branch")

					pdf.setFontType("italic");
					pdf.setFontSize(8);
					pdf.text(125,13,"CERTIFICATE OF REGISTRATION")
					
					pdf.setFontType("normal");
					pdf.setFontSize(15);
					pdf.text(17,15,breaker)
					
					pdf.setFontType("italic");
					pdf.setFontSize(16);
					pdf.text(16,20,"|")
					
					pdf.setFontType("italic");
					pdf.setFontSize(16);
					pdf.text(16,25,"|")
					
					$.ajax({
    					type:'POST',
    					data:{studentnumber: studn},
    					url: 'Controller/Registrar/Student/GetRegicard',
    					success: function(result){
    						var item = $.parseJSON(result)
    						pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(20,20,"Student Number")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(20,23,item.studentnumber)
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(105,20,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(105,25,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(110,20,"Name")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(110,23,item.name)
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(175,20,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(175,25,"|")
								
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(180,20,"Semester")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(180,23,item.sem)
							
								
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(245,20,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(245,25,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(250,20,"School Year")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(250,23,item.year)
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(281,20,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(281,25,"|")
							
							pdf.setFontType("normal");
							pdf.setFontSize(15);
							pdf.text(17,25,breaker)
							//-----------------------------
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(16,30,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(16,35,"|")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(20,30,"Address")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							var address = item.address
							var FinalAddress = pdf.splitTextToSize(address, 150);
							pdf.text(20,33,FinalAddress)
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(175,30,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(175,35,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(180,30,"Year Level")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(180,33,item.yearlvl)
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(245,30,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(245,35,"|")
		
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(250,30,"Academic Status")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(250,33,item.scho)
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(281,30,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(281,35,"|")
							
							pdf.setFontType("normal");
							pdf.setFontSize(15);
							pdf.text(17,35,breaker)
							
							//-----------------------------
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(16,40,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(16,45,"|")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(20,40,"Contact Person in case of Emergency")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(20,43,item.guardian)
		
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(155,40,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(155,45,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(160,40,"Emergency Number")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(160,43,item.guardiannum)
		
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(245,40,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(245,45,"|")
		
							
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(250,40,"Course and Section")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(250,43,item.section)
							
							pdf.setFontType("normal");
							pdf.setFontSize(15);
							pdf.text(17,45,breaker)
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(281,40,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(281,45,"|")
							var base = 50
		
							//-----------------------------
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(16,50,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(16,55,"|")
							
							pdf.setFontType("normal");
							pdf.setFontSize(8);
							pdf.text(20,50,"Subject Code")
							
		
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(75,50,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(75,55,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(80,base,"Subject Description")
		
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(125,50,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(125,55,"|")
		
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(130,50,"Cred. Units")
												
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(165,50,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(165,55,"|")
		
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(170,50,"Section")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(195,50,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(195,55,"|")
		
							
							pdf.setFontType("italic");
							pdf.setFontSize(8);
							pdf.text(200,50,"Schedule")
		
							
							pdf.setFontType("normal");
							pdf.setFontSize(15);
							pdf.text(17,51,breaker)
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(281,50,"|")
							
							pdf.setFontType("italic");
							pdf.setFontSize(16);
							pdf.text(281,55,"|")
							
							
							
							 $.ajax({
								type:'POST',
								data:{StudentNumber:studn},
								url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'StudentSchedule2',
								success: function(result){
									var item2 = $.parseJSON(result)
									var body = ''
									base = 55
									
									$.each(item2,function(key,val){
										//console.log(val)
										var i = 0
										var sched = ''
										$.each(val.schedule,function(key2,val2){
											if(i == 0)
												sched = ''
											console.log(val2.room)
											sched += val2.time + val2.room + ' '
											i++
											
										})
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(16,base,"|")
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(16,base+5,"|")
										
										pdf.setFontType("normal");
										pdf.setFontSize(8);
										pdf.text(20,base+3,val.code)
					
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(75,base,"|")
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(75,base+5,"|")
										
										pdf.setFontType("normal");
										var subdesc = pdf.splitTextToSize(val.desc, 100);
										pdf.setFontSize(7);
										pdf.text(80,base,subdesc)
					
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(125,base,"|")
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(125,base+5,"|")
										
										pdf.setFontType("normal");
										pdf.setFontSize(8);
										pdf.text(130,base+3,val.cred)
															
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(165,base,"|")
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(165,base+5,"|")
										
										pdf.setFontType("normal");
										pdf.setFontSize(8);
										pdf.text(170,base+3,val.section)
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(195,base,"|")
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(195,base+5,"|")
										
										pdf.setFontType("normal");
										pdf.setFontSize(6);
										
										var finalSchedule = pdf.splitTextToSize(sched, 80);
										pdf.text(200,base+3,finalSchedule)
					
										pdf.setFontType("normal");
										pdf.setFontSize(15);
										pdf.text(17,base+5,breaker)
										
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(281,base,"|")
										
										pdf.setFontType("italic");
										pdf.setFontSize(16);
										pdf.text(281,base+5,"|")
										base = base + 10
										
										
									

									
									
									
									
									
									
									})
									
									var myImage = new Image();
									myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
									myImage.onload = function(){
										pdf.addImage(myImage , 'png', 5, 5, 10, 10);
										 var uri = pdf.output('dataurlstring');
								  	   	 openDataUriWindow(uri);
								  	};
			                         
								},
			                    error: function (response2) {
			                        swal("Error encountered while accessing the data", "Please try again", "error");
			                    }
							});
							
							
							

						
							
							
    						
			        	
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
					

					
					
					/*
					

					var regibody =    '<table class="table table-bordered" >' 
										+'<thead style="display:none"><tr><th>F</th><th>S</th><th>T</th><th>F</th><th>F</th></tr></thead>'
					                  	+'<tbody>'
						                	+'<tr>'
							                	+'<td>Student Number</td>'
							                	+'<td colspan="2">Name</td>'
							                	+'<td>Semester</td>'
							                	+'<td>School Yea</td>'
						                	+'</tr>'
						                	+'<tr>'
							                	+'<td colspan="3">Address</td>'
							                	+'<td>Year Level</td>'
							                	+'<td>Academic Status</td>'
						                	+'</tr>'
						                	+'<tr>'
							                	+'<td colspan="3">Contact Person in case of Emergency</td>'
							                	+'<td>Emergency Number</td>'
							                	+'<td>Course and Section</td>'
						                	+'</tr>'
						                	+'<tr>'
							                	+'<td>Subject Code</td>'
							                	+'<td>Subject Description</td>'
							                	+'<td>Cred. Units</td>'
							                	+'<td>Section</td>'
												+'<td>Schedule</td>'
											+'</tr>'
										+'</tbody>'
									+'</table>'
									
					
					
					
					pdf.fromHTML(
							$('#regiBody').html() // HTML string or DOM elem ref.
						  	, 10 // x coord
						  	, 50 // y coord
						  	, {
						  		'width': 300 // max width of content on PDF
						  		, 'elementHandlers': specialElementHandlers
						  	}
						)
						*/
					

					
					
				
				})	
				
				
				
				
				$('#editable-sample').on('click','a.tor',function(){
					var pdf = new jsPDF('p', 'pt', 'letter');
		            var breaker = '_______________________________________________________________________'
		            var studnums = $(this).data('studnum')
					var mybase = 210;
		            specialElementHandlers = {
							'#bypassme': function(element, renderer){
								return true
							}
						}
		        	$.ajax({
    					type:'POST',
    					data:{stnum:studnums},
    					url: "Controller/Registrar/GraduatedStudents/GetProfile",
    					success: function(result2){
    						var item2 = $.parseJSON(result2)
    						pdf.addPage();
    						pdf.addPage();
    						pdf.addPage();
			    			
    						$.ajax({
		    					type:'POST',
		    					data:{stnum:studnums},
		    					url: "Controller/Registrar/GraduatedStudents/TranscriptofRecord",
		    					success: function(result){
		    						var item = $.parseJSON(result)
		    						var title = ''
		    						var torbody = ''
		    						var i = 0
		    						pdf.setPage(1)
		    						
		    						var myImage = new Image();
				   					myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
				   					myImage.onload = function(){
				   						pdf.setPage(1)
				   						pdf.addImage(myImage , 'png', 520, 20, 50, 50);
				   						var uri = pdf.output('dataurlstring');
				   					  	openDataUriWindow(uri);
				   					};
		    						
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
		    							mybase =  mybase + 70
		    							i++
		    							if(i == 4 ){
		    								pdf.setPage(2)
		    								mybase = 40			    						
		    								
		    							}
		    							if(i == 7 ){
		    								pdf.setPage(3)
		    								mybase = 40			    						
		    								
		    							}
		    							if(i == 10 ){
		    								pdf.setPage(4)
		    								mybase = 40			    						
		    								
		    							}
		    							
		    						})
		    						
									
									
		    						
		    								
						            
		    						
									
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
				
				
					
				$('#editable-sample').on('click','a.returnee',function(){
					var studnum = $(this).closest('tr').children('td:eq(0)').text()
					retglobstudnum = studnum
					var curcode = $(this).data("curriculum-code")
					$('#returneeCurYearDrp').select2('val',curcode)
					var course = $(this).data("course")
					curyeardesc = $('#returneeCurYearDrp option:selected').val()
					retglobcourse = course
					fillreturneeCur()
					
					
					
					
				
				})	
				$('#returneeCurYearDrp').on('change',function(){
					curyeardesc = $('#returneeCurYearDrp option:selected').val()
					fillreturneeCur()
				})
				
				
				function fillreturneeCur(){
					$.ajax({
    					type:'POST',
    					data:{studentnumber: retglobstudnum,curyeardesc:curyeardesc},
    					url: "Controller/Registrar/Student/ReturneeCurriculum",
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
       						$('#retuneeCurBody').html(body)
    						console.log(item)

                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
					

					
    						
 						
	 					$.ajax({
		   					type:'POST',
		   					data:{studentnumber: retglobstudnum,curcode: retglobcourse,curyeardesc:curyeardesc},
		   					url:'Controller/Registrar/Student/ReturneeNewCur',
		   					success: function(result2){
		   						var item = $.parseJSON(result2)
		   						$('#rmainBody').html('')
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
		       							$('#rmainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val.tuition+'" style="cursor: pointer;">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val.units+'</center></td><td><select class="populate sectionselect"  >'+sel+'</td><td><center><input type="checkbox" class="form-control ckbox" style="width:20px;height:20px;" ></center></td></tr>')
		      							}
		          						else{
		          							$('#rmainBody').append('<tr><td colspan="7" style="font-weight:bold;font-style:italic;font-size:12px;" ><center class="codeText" style="text-align:center;font-weight:bold">'+val.code+'</center></td></tr>')
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
		      	   								
		           							$('#rmainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject" ><center class="codeText" data-tuition="'+val2.tuition+'" style="cursor: pointer;">'+val2.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val2.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val2.units+'</center></td><td><select class="populate sectionselect"  >'+sel+'</td><td><center><input type="checkbox" class="form-control ckbox" style="width:20px;height:20px;" ></center></td></tr>')
		   										
		          							});
		          							
		          							
		          						}
		      							$("select.sectionselect").select2( {width: '100%' });
		                           });
		      						if($('#rmainBody').html() == ''){
		      							$('#rmainBody').html('<tr><td style="font-size:12px" ><center class="codeText"></center></td><td style="font-size:12px" ><center class="descText"></center></td><td style="font-size:12px" ><center class="unitText"></center></td><td><center></center></td></tr>')
		      							
		      						}
		      						else{
		      							$('#rmainBody').append('<tr><td style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px" colspan="7" id="rtotunit">Total: 0 Unit</td></tr>')
		      						}
		
		   						
		   						
		   					},
	                       error: function (response) {
	                           swal("Error encountered while adding data"+response, "Please try again", "error");
	                       }
	   				})
   				
	   				$.ajax({
	   					type:'POST',
	   					data:{course: retglobcourse},
	   					url: "Controller/Registrar/Student/GetSection",
	   					success: function(result){
	   						var item = JSON.parse(result)
	   						console.log(item)
	   						var body = '<option value="default" selected disabled>Select a Section</option>'
	   						$.each(item,function(key,val){
	   							body += "<option value='"+val+"'>"+val+"</option>"
	   							
	   						})
	   						$('#retsectionDrp').html(body)
	   						
	   						
	   					},
	                       error: function (response) {
	                           swal("Error encountered while accessing the data", "Please try again", "error");
	                       }
	   				});
			   				
				}
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
				var peditnum =''
				$('#editable-sample').on('click','a.pedit',function(){
					var studentnumber = $(this).closest('tr').children('td:eq(0)').text()
					peditnum = studentnumber
					var studentname = $(this).closest('tr').children('td:eq(1)').text()
					$('#studnum').html(studentnumber)
					$('#studname').html(studentname)
					
					$.ajax({
    					type:'POST',
    					data:{studentnumber: studentnumber},
    					url: "Controller/Registrar/Student/GetWholeProfile",
    					success: function(result){
    						var item = JSON.parse(result)
    						$('#firstNameTxt').val(item.fname)
    						$('#middleNameTxt').val(item.mname)
    						$('#lastNameTxt').val(item.lname)
    						$('#conTxt').val(item.contactnum)
    						$('#emailTxt').val(item.emailaddress)
    						$('#guardianNameTxt').val(item.guardianname)
    						$('#guardianNumberTxt').val(item.guardiannum)
    						$('#dobTxt').val(item.dob)
    						$('#pobTxt').val(item.pob)
    						$('#addressTxt').val(item.address)
    						$('#genderDrp').val(item.gender)
    						$('#civilDrp').val(item.civil)
    						
    						
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
				
				$('#retSaveBtn').click(function(){
					var section = $('#retsectionDrp').val()
					var curtaken = []
					$('#rmainBody tr').each(function(){
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
		        					data:{curyear:curyeardesc,course:retglobcourse,studnum: retglobstudnum,section: section,curtaken:JSON.stringify(curtaken)},
		        					url: "Controller/Registrar/Student/Returnee",
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
       					 				//alert(val2.desc)
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
				
				$('#rmainBody').on('change','.ckbox',function(){
	            	totunit = 0;
					tottuitionunit = 0
	            	$('#rmainBody tr').each(function(){
	            		if($(this).find('.unitTexts').html() != undefined){
	//                		alert($(this).find('.unitTexts').html())
	            			if($(this).find('input:checkbox').prop("checked") == true){            				
	            				totunit += parseInt($(this).find('.unitTexts').html())
	            				tottuitionunit += parseInt($(this).find('.codeText').data("tuition"))
	            				
	            			}
	            		}
	            		
	            	});
	            	$('#rtotunit').html('Total: ' + totunit + ' Units')
	            	
	        		
	            });
				
				
				 
				//tocreditunit
				$('#editable-sample').on('click','a.curriculum',function(){
					var studentnumber = $(this).closest('tr').children('td:eq(0)').text()
					if(availunittotake == 'None')
						availunittotake = $(this).data("available-units-to-take")
					var courseCodeTo = $(this).data("course")
					
				 	globstudnum = studentnumber
					$.ajax({
    					type:'POST',
    					async:false,
    					data:{studentnumber: studentnumber},
    					url: "Controller/Registrar/Student/Curriculum3",
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
           					 				
           					 				
           					 				$.ajax({
           	                					type:'POST',
           	                					async:false,
           	                					data:{latcode : val2.code, course : courseCodeTo},
           	                					url:'Controller/Registrar/Curriculum/GetPreqreqPlease2',
           	                					success: function(result){
           	                						if(result == 'null' || result == null)
           	                							result = ''
        	                						$('#studentNumberTxtTo').val(result)
           	                						
           	                					}
           	                						
           	            					})
           	            					prereq = $('#studentNumberTxtTo').val()
           					 				
           					 				var st = ''
           					 				var enrollstatus = val2.estatus
           					 				
           					 				if(enrollstatus == 'Enrolled')
           					 					st = "Enrolled"           					 				
           					 				else if(val2.status == 'Not Cleared')
           					 					st = "<a class='btn btn-info enroll' title='Enroll this Subject' data-credited-unit='"+val2.units+"'   href='#enroll'><i class='fa fa-bolt'></i></a>"
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
           	   					 				
           	   					 				
           	   					 				//etolang alisin mo ha
           	   					 				
	           	   					 			$.ajax({
	           	                					type:'POST',
	           	                					async:false,
	           	                					data:{latcode : val3.code, course : courseCodeTo},
	           	                					url:'Controller/Registrar/Curriculum/GetPreqreqPlease',
	           	                					success: function(result){
	           	                						if(result == 'null' || result == 'default' )
	           	                							result = ''
          	                							$('#studentNumberTxtTo').val(result)
	           	                						
	           	                					}
	           	                						
	           	            					})
	           	            					prereq = $('#studentNumberTxtTo').val()
           	   					 				
           	   					 				
           	   					 				
    											var st = ''
    											enrollstatus = val3.estatus
    											if(enrollstatus == 'Enrolled')
               					 					st = "Enrolled"             					 				
               					 				else if(val3.status == 'Not Cleared')
    	       					 					st = "<a class='btn btn-info enroll' title='Enroll this Subject' data-credited-unit='"+val3.units+"'   href='#enroll'><i class='fa fa-bolt'></i></a>"
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
		        						availunittotake = parseFloat(availunittotake) - tocreditunit 
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
	
		<script src="../Assets/js/html2canvas.js"></script>
		<script src="../Assets/js/jspdf.js"></script>
		
		<script src="../Assets/js/jspdf.debug.js"></script>
		<script src="../Assets/js/jspdf.plugin.autotable.js"></script>
		
		<script lang="javascript" src="../Assets/js/xlsx.full.min.js"></script>
		<script lang="javascript" src="../Assets/js/FileSaver.min.js"></script>
		
		
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
                                            <label class="btn btn-info" id="lblimport" for="importBtn" style="margin-left :10px">
								            	<input id="importBtn" type="file" accept=".csv" style="display:none;" >
								                <i class="fa fa-upload"></i> Import
								            </label>
					                    	<button class="btn btn-primary" id="exportBtn" style="margin-left:10px">
								                <i class="fa fa-download"></i> Export
								            </button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <div class="col-lg-6'">
	                                    Status
	                                    <br/>
	                                    <select id="fstatusDrp" class="populate" style="width:40%">
				                        	<option value="Both">Both</option>
				                        	<option value="Enrolled">Enrolled</option>
				                        	<option value="Not Enrolled">Not Enrolled</option>
				                        </select>
                                    </div>
                                    <div class="col-lg-6'">
	                                    Course
	                                    <br/>
	                                    <select id="fcourseDrp" class="populate" style="width:40%">
				                        	<option value="All">All</option>
				                        	${courses}
				                        </select>
                                    </div>
                                    
                                    <table class="hidden" id="myHiddenTable">
                                    </table>
                                    
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 17%">Student Number</th>
	                                            <th style="width: 20%">Student Name</th>
	                                            <th style="width: 15%">Course and Section</th>
	                                            <th style="width: 15%">Curriculum</th>
	                                            <th style="width: 10%">Status</th>
	                                            <th style="width: 10%">Available Units</th>
	                                            <th style="width: 13%">Action</th>
	                                            
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
	    
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="EnrolledSubjectModal" class="modal fade">
	       <div class="modal-dialog" style="width:60%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" >Enrolled Subjects</h4>
	                </div>
	                <div class="modal-body">
                        <div class="row">
	                        <div class="col-lg-12">
		                        <table class="table table-striped table-hover table-bordered" >
		                        	<thead>
		                                   <tr><th style="width: 20%">Code</th><th style="width: 25%">Description</th><th>Schedule</th><th style="width: 15%">Cred. Unit</th><th style="width: 10%">Action</th></tr>
		                               </thead>
		                               <tbody id="enrolledSubjectTbl" data-body=''>   
		                              		<tr>
		                              		 	<td colspan="5" style="text-align:center"> No data available</td>
		                            		</tr>  
		                               </tbody>
		                        </table>
		                        <input type="text" class="form-control" id="tableBodyTo">
		                        <input type="text" class="form-control" id="studentNumberTxtTo">
	                        </div>
                        </div>
	                </div>
	                <div class="modal-footer">
	                	 <button data-dismiss="modal" class="btn btn-default" id="" type="button">Close</button>
	                	 <button class="btn btn-success" id="saveSchedTableBtn" type="button">Save</button>
	                </div>
	            </div>
	       </div>
	    </div>	
	    
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="importModal" class="modal fade">
	        <div class="modal-dialog" style="width:80%">
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
		                                       <th>Student Number</th>
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
