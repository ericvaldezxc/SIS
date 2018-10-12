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
	
	String tablebody = "";

	Statement stmnt = conn.createStatement();
	Statement stmnt2 = conn.createStatement();
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	String couid = "";
	Fullname fn = new Fullname();	
	String student = "";
	ResultSet rs = stmnt.executeQuery("SELECT CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active' and Returnee_StudentAccountID =  Student_Account_ID ),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  and IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') = 'Enrolled' group by Student_Taken_Curriculum_Subject_StudentAccountID ");
		while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
			couid = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"));
			fullname = fn.fullname(fname, mname, lname);
			
			
			String uname = rs.getString("Student_Account_Student_Number");
			String sql2 = "SELECT Subject_Type,Schedule_ProfessorID ,Students_Grade_FacultyID,  ifnull(Students_Grade_Grade,'0') grade,IFNULL(Professor_FirstName,0) AS FNAME ,IFNULL(Professor_MiddleName,0) AS MNAME,IFNULL(Professor_LastName,0) AS LNAME,Professor_Code,Subject_Code,Subject_Description,Subject_Credited_Units,Section_Code FROM `t_student_taken_curriculum_subject` inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_course on Course_ID = Student_Taken_Curriculum_Subject_CourseID inner join t_student_account on Student_Account_ID = Student_Taken_Curriculum_Subject_StudentAccountID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID INNER JOIN r_section on Student_Taken_Curriculum_Subject_SectionID = Section_ID inner join r_curriculum on Curriculum_CourseID = Student_Taken_Curriculum_Subject_CourseID inner join r_curriculumitem on CurriculumItem_SubjectID = if(ifnull(Subject_Group,0)=0,Subject_ID,Subject_Group) left join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID INNER join r_professor on ifnull(Students_Grade_FacultyID,Schedule_ProfessorID ) = Professor_ID  where Student_Account_CurriculumYearID = Curriculum_CurriculumYearID and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Curriculum_YearLevel = Student_Taken_Curriculum_Subject_YearLevel and if(Schedule_ChildrenID is null,'0',Schedule_ChildrenID) = if(Schedule_ChildrenID is null,'0',Subject_ID)  and Student_Account_Student_Number = '"+uname+"' and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present') and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and Student_Taken_Curriculum_Subject_SectionID = Section_ID and if(Schedule_SectionID is null,0,Schedule_SectionID) = if(Schedule_SectionID is null,0,Section_ID)  and Schedule_ProfessorID is not null and Course_ID = Curriculum_CourseID  and Curriculum_SemesterID = Student_Taken_Curriculum_Subject_SemesterID  and Schedule_AcademicYearID = (SELECT myt1.Academic_Year_ID FROM `r_academic_year` as myt1 where myt1.Academic_Year_Active_Flag = 'Present')  ";				
			ResultSet rs2 = stmnt2.executeQuery(sql2);
			double gpa = 0;
			int countgpa = 0;
			double fgpa = 0;
			String finalgpa = "0";
			int f = 0;
			while(rs2.next()){
				String grade = rs2.getString("grade");
				if(rs2.getString("grade").equals("0")){
					grade = "";
				}
				else if(!rs2.getString("grade").equals("I") && !rs2.getString("grade").equals("Not S") && !rs2.getString("grade").equals("D") && !rs2.getString("Subject_Type").equals("Non-Academic")){
					countgpa++;
					gpa = gpa + Double.parseDouble(rs2.getString("grade"));
				}
				else{
					 f = 1;
				}
				
			}
			if(countgpa!=0){
				fgpa = gpa / countgpa;
			}
			else{
				fgpa = 0;
			}
			if(f == 0 && fgpa != 0 ){
				tablebody += "<tr><td>" + uname+ "</td><td>"+fullname+"</td><td>"+rs.getString("Section_Code")+"</td><td>"+fgpa+"</td><td></td><td></td></tr>"; 
				student += "<option value='"+uname+"'>"+fullname+"</option>";
				
			}
			
			
		}
		tablebody = "";
		
		 rs = stmnt.executeQuery("SELECT * from t_student_awards inner join  r_awards on Awards_ID = Student_Awards_AwardsID inner join t_student_account on Student_Awards_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Awards_AcademicYearID inner join r_semester on Student_Awards_SemesterID = Semester_ID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID   ");
			while(rs.next()){
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				couid = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"));
				fullname = fn.fullname(fname, mname, lname);
				
				
				String uname = rs.getString("Student_Account_Student_Number");
				
				tablebody += "<tr><td>" + uname+ "</td><td>"+fullname+"</td><td>"+rs.getString("Section_Code")+"</td><td>"+rs.getString("Awards_Description")+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description")) + " " + ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"))  + " Term"+"</td></tr>"; 
				
				
				
			}
		
		
		String award = "";
		rs = stmnt.executeQuery("SELECT * from r_awards where Awards_Display_Status = 'Active'");
		while(rs.next()){
			award += "<option value='"+rs.getString("Awards_Code")+"' data-mingwa='"+rs.getString("Awards_MinimunGWA")+"' data-mingrade='"+rs.getString("Awards_MinimunGrade")+"'>"+rs.getString("Awards_Description")+"</option>";
			
			
		}
	pageContext.setAttribute("tablebody", tablebody);
	Dropdowns drp = new Dropdowns();
	pageContext.setAttribute("acadyearDrp", drp.fillacadyearDrp2());
	pageContext.setAttribute("semesterDrp", drp.fillsemesterDrp());
	pageContext.setAttribute("award", award);
	pageContext.setAttribute("student", student);


%>    

<t:Registrar title="Academic Awards" from="Academic Awards" to="">

	<jsp:attribute name="myscript">      
		<script lang="javascript" src="../Assets/js/xlsx.full.min.js"></script>
		<script lang="javascript" src="../Assets/js/FileSaver.min.js"></script>
	
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$('#awardDrp').on("change",function(){
					var mingwa = $('#awardDrp option:selected').data("mingwa")
					var mingrade = $('#awardDrp option:selected').data("mingrade")
					console.log(mingwa + ' ' + mingrade)
					$.ajax({
    					type:'POST',
    					data:{minGWA: mingwa, minGrade: mingrade},
    					dataType:'json',
    					url:'Controller/Registrar/AcademicAwards/GetStudent',
    					success: function(result){
    						var studdrp = ""
    						$(result).each(function(key,val){
    							studdrp += "<option value='"+val.studnum+"'>"+val.studname+"</option>"
    							
    						})
    						$('#studentDrp').html(studdrp)
    						$('#studentDrp').multiSelect('refresh');
    						$('.ms-container').css("width", "100%"); 
    						
                             
    					},
                        error: function (response) {
                            swal("Error encountered while adding data", "Please try again", "error");
                            $("#editable-sample_new").click();
                        }
    				});
					
				})
				$('#SaveAcadwemicAwards').click(function(){
					var awards =  $('#awardDrp').val()
					var stud = $('#studentDrp').val()
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
		    					data:{code: awards, student: JSON.stringify(stud)},
		    					url:'Controller/Registrar/AcademicAwards/AddStudentAwards',
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
		                            swal("Error encountered while adding data", "Please try again", "error");
		                            $("#editable-sample_new").click();
		                        }
		    				});
	                    } else {

	                        swal("Cancelled", "The transaction is cancelled", "error");
	                        $("#editable-sample_new").click();
	                    }

	                });
				})
				
				
				$('#addScholarshipBtn').click(function(){
					 var codeTxt = $('#codeTxt').val();
					 var descTxt = $('#descTxt').val();
					 var discountTxt = $('#discountTxt').val();
					

					
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
		    					data:{code: codeTxt, desc: descTxt, discount: discountTxt},
		    					url:'Controller/Registrar/Scholarship/Scholarship',
		    					success: function(result){
		    						 swal("Record Added!", "The data is successfully added!", "success");
		                             var aiNew = oTable.fnAddData([codeTxt, descTxt, "<center><a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", '']);
		                             var nRow = oTable.fnGetNodes(aiNew[0]);
		                             document.getElementById("form-data").reset();
		                             $("#addcloseBtn").click();
		                             
		    					},
		                        error: function (response) {
		                            swal("Error encountered while adding data", "Please try again", "error");
		                            $("#editable-sample_new").click();
		                        }
		    				});
	                    } else {

	                        swal("Cancelled", "The transaction is cancelled", "error");
	                        $("#editable-sample_new").click();
	                    }

	                });
					
				})
				
				$('#editable-sample').on('click','a.genex',function(){
					alert('asd')
					var wb = XLSX.utils.book_new();
		             wb.Props = {
		                     Title: "Student Grades",
		                     Subject: "Grades",
		                     Author: "EKPV",
		                     CreatedDate: new Date(2018,08,24)
		             };
		             wb.SheetNames.push("Student Grades");
		             
	            	 var code = $(this).closest('tr').children('td:eq(0)').text()
	            	 var desc = $(this).closest('tr').children('td:eq(1)').text()
	            	 $.ajax({
						type:'POST',
	 					data:{scholar:code},
						url:'Controller/Registrar/Scholarship/GetStudent',
						success: function(result){
							var item = JSON.parse(result);
							console.log(item)
							var ws_data = item;
							var ws = XLSX.utils.aoa_to_sheet(ws_data);
					        wb.Sheets["Student Grades"] = ws;
					        var wbout = XLSX.write(wb, {bookType:'csv',  type: 'binary'});
					        saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), code+'.csv');
						},
	                    error: function (response) {
	                        swal("Error encountered while adding data"+response, "Please try again", "error");
	                    }
					});
				})
				
				
	             function s2ab(s) {
	       
	                     var buf = new ArrayBuffer(s.length);
	                     var view = new Uint8Array(buf);
	                     for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
	                     return buf;
	                     
	             }
             
				
				var latscode = ''
				$('#editable-sample').on('click','a.scholars',function(){
					var table = $('#studentscholarship').DataTable();
					jQuery(table.fnGetNodes()).each(function (index,elem) {
	                	table.fnDeleteRow(0);
	                });
					latscode = $(this).closest('tr').children('td:eq(0)').text()
					//alert(latscode)					
				})
				$('#editable-sample').on('click','a.scholarhistory',function(){
					var table = $('#paymenthistory').DataTable();
					jQuery(table.fnGetNodes()).each(function (index,elem) {
	                	table.fnDeleteRow(0);
	                });
					scholarcode = $(this).closest('tr').children('td:eq(0)').text()
					//alert(scholarcode)					
				})
	    		
	    		var oTable = $('#studentscholarship').dataTable({
	                 "aLengthMenu": [
	                     [5, 15, 20, -1],
	                     [5, 15, 20, "All"] // change per page values here
	                 ],
	                 // set the initial value
	                 "iDisplayLength": 5,
	                 "sDom": "<'row'<'col-lg-6'l><'col-lg-6'f>r>t<'row'<'col-lg-6'i><'col-lg-6'p>>",
	                 "sPaginationType": "bootstrap",
	                 "oLanguage": {
	                     "sLengthMenu": "_MENU_ records per page",
	                     "oPaginate": {
	                         "sPrevious": "Prev",
	                         "sNext": "Next"
	                     }
	                 },
	                 "columnDefs": [
	                     { "bSortable": false, "aTargets": [ 0 ] }
	                 ], 
	             });

	             jQuery('#studentscholarship_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
	             jQuery('#studentscholarship_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown
	             
	             var latscode = ''
 			
 	    		
 	    		var oTable = $('#paymenthistory').dataTable({
 	                 "aLengthMenu": [
 	                     [5, 15, 20, -1],
 	                     [5, 15, 20, "All"] // change per page values here
 	                 ],
 	                 // set the initial value
 	                 "iDisplayLength": 5,
 	                 "sDom": "<'row'<'col-lg-6'l><'col-lg-6'f>r>t<'row'<'col-lg-6'i><'col-lg-6'p>>",
 	                 "sPaginationType": "bootstrap",
 	                 "oLanguage": {
 	                     "sLengthMenu": "_MENU_ records per page",
 	                     "oPaginate": {
 	                         "sPrevious": "Prev",
 	                         "sNext": "Next"
 	                     }
 	                 },
 	                 "columnDefs": [
 	                     { "bSortable": false, "aTargets": [ 0 ] }
 	                 ], 
 	             });

 	             jQuery('#paymenthistory_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
 	             jQuery('#paymenthistory_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown
	             
				
				 $('#totalAmount').hide()
	             $('#importBtn').on('change', function() {
						var table = $('#studentscholarship').DataTable();
						jQuery(table.fnGetNodes()).each(function (index,elem) {
		                	table.fnDeleteRow(0);
		                });
						$('#totalAmount').slideDown()
						
					 	handleFiles(this.files)

						
				})
				
				
					
				function handleFiles(files) {
		    		if (window.FileReader) {
		    		   getAsText(files[0]);
		    		}else {
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
	    		function errorHandler(evt) {
	      		  if(evt.target.error.name == "NotReadableError") {
	      		      alert("Cannot read file!");
	      		  }
	      		}
	    		
	    		var student = []
	    		var studentnumber = []
	    		var totalamounttopay = "0";
	    		function processData(csv) {
	    			studentnumber = []
	    			var table = $('#studentscholarship').DataTable();
	    		    var allTextLines = csv.split(/\r\n|\n/);
	    		    console.log(allTextLines)
	    		    for (var i=1; i<allTextLines.length; i++) {
	    		        var row = allTextLines[i].split(';');		
	    		        for (var j=0; j<row.length; j++) {
	    			        var col = row[j].split(',');
	    			        if(col[0] != "" && col[2] != undefined){
	    			        	//var aiNew = table.fnAddData([col[0],col[1].replace('"','') + col[2].replace('"',''),col[3]]);
	    	                    //var nRow = table.fnGetNodes(aiNew[0]);
	    	                    studentnumber.push(col[0])
	    				        student.push({number:col[0],name:col[1].replace('"','') + col[2].replace('"',''),section:col[3]} );
	    			        	
	    			        }
	    		        }
	    		    }
	    		    console.log(studentnumber)
	    		    
	    		    $.ajax({
     					type:'POST',
     					data:{student: JSON.stringify(studentnumber)},
     					url:'Controller/Scholarship/Scholarship/GetStudentPayment',
     					success: function(result){
     						var item =  $.parseJSON(result)
     						totalamounttopay = "0"
     						$.each(item, function (key, val) {
     							totalamounttopay = parseFloat(totalamounttopay)  +  parseFloat(val.amount.replace(',',''))
     							
         						var aiNew = table.fnAddData([val.studnum,val.name,val.section,val.amount]);
        	                    var nRow = table.fnGetNodes(aiNew[0]);
        	                    $.ajax({
    								type:'POST',
    								data:{Amount: totalamounttopay},
    								url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
    								success: function(result2){
    									totalamounttopay = result2
    									console.log(result2)
    									$('#totalAmount').html("Total Amount: "+result2)
    								},
    			                    error: function (response) {
    			                        swal("Error encountered while accessing the data", "Please try again", "error");
    			                    }
    							});
     						})
//     						
     					},
                         error: function (response) {
                             swal("Error encountered while adding data", "Please try again", "error");
                         }
     				});
	    		    

	    		}
	    		$('#uploadstudentScholarshipBtn').click(function(){
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
	         					data:{scholarship:latscode,student: JSON.stringify(student)},
	         					url:'Controller/Scholarship/Scholarship/UploadStudent',
	         					success: function(result){
//	         						$('#lblimport').slideUp();
	 	    						 swal("Record Added!", "The data is successfully added!", "success");
	         					},
	                             error: function (response) {
	                                 swal("Error encountered while adding data", "Please try again", "error");
	                             }
	         				});

	                     } else {

	                         swal("Cancelled", "The transaction is cancelled", "error");
	                         $("#editable-sample_new").click();
	                     }

	                 });
	    		})
	    		var scholarcode = ""
	    		$("select#awardDrp").select2({width: '100%' });
	    		$("select#semesterDrp").select2({width: '100%' });
	    		$("#semesterDrp").on('change',function(){
	    			var sem = $('#semesterDrp option:selected').val()
	    			var acadyear = $('#acadyearDrp option:selected').val()
	    			if(sem != 'default' && sem != 'default'){
	    				var table = $('#paymenthistory').DataTable();
	    				jQuery(table.fnGetNodes()).each(function (index,elem) {
		                	table.fnDeleteRow(0);
		                })
	    				$.ajax({
         					type:'POST',
         					data:{scholar:scholarcode,semester:sem,acadyear:acadyear},
         					url:'Controller/Scholarship/Scholarship/GetPaymentHistory',
         					success: function(result){
         						var item =  $.parseJSON(result)
         						totalamounttopay = "0"
            					$.each(item, function (key, val) {
            	                    
            						totalamounttopay = parseFloat(totalamounttopay)  +  parseFloat(val.amount.replace(',',''))
             						var aiNew = table.fnAddData([val.studnum,val.name,val.section,val.amount,val.date]);
            	                    var nRow = table.fnGetNodes(aiNew[0]);

         						})
         						$.ajax({
     								type:'POST',
     								data:{Amount: totalamounttopay},
     								url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
     								success: function(result2){
     									totalamounttopay = result2
     									console.log(result2)
     									$('#paymenttotalAmount').html("Total Amount: "+result2)
     								},
     			                    error: function (response) {
     			                        swal("Error encountered while accessing the data", "Please try again", "error");
     			                    }
     							});
         						
         					},
                             error: function (response) {
                                 swal("Error encountered while adding data", "Please try again", "error");
                             }
         				});
	    			}
	    			
	    		})
	    		$('#printList').click(function(){
	    			var items = [];
                   	var code = $('#drporg option:selected').val();
                  	var rows = $('#paymenthistory').dataTable()
                       .$('tr', {
                           "filter": "applied"
                       });
                  	var studbody = ""
	                $(rows).each(function(index, el) {
	                	var studnum = $(this).closest('tr').children('td:eq(0)').text();
	                	var name = $(this).closest('tr').children('td:eq(1)').text();
	                	var cas = $(this).closest('tr').children('td:eq(2)').text();
	                	var amount = $(this).closest('tr').children('td:eq(3)').text();
	                	var date = $(this).closest('tr').children('td:eq(4)').text();
	                    items.push({studnum:studnum,name:name,cas:cas,amount:amount,date:date});
	                    studbody += "<tr><td>"+studnum+"</td><td>"+name+"</td><td>"+cas+"</td><td>"+amount+"</td><td>"+date+"</td></tr>"
	                    
	
	                })
	                console.log(items)
	               
	                
	                
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
					pdf.text(270,110,"Scholarship Payment")
					
					
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
	    		
	    		$("#acadyearDrp").on('change',function(){
	    			var sem = $('#semesterDrp option:selected').val()
	    			var acadyear = $('#acadyearDrp option:selected').val()
	    			if(sem != 'default' && sem != 'default'){
	    				$.ajax({
         					type:'POST',
         					data:{scholar:scholarcode,semester:sem,acadyear:acadyear},
         					url:'Controller/Scholarship/Scholarship/GetPaymentHistory',
         					success: function(result){
         						var item =  $.parseJSON(result)
         						totalamounttopay = "0"
                					$.each(item, function (key, val) {
                						totalamounttopay = parseFloat(totalamounttopay)  +  parseFloat(val.amount.replace(',',''))
                 						var aiNew = table.fnAddData([val.studnum,val.name,val.section,val.amount,val.date]);
                	                    var nRow = table.fnGetNodes(aiNew[0]);
                	                    
             						})
             						$.ajax({
         								type:'POST',
         								data:{Amount: totalamounttopay},
         								url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
         								success: function(result2){
         									totalamounttopay = result2
         									console.log(result2)
         									$('#paymenttotalAmount').html("Total Amount: "+result2)
         								},
         			                    error: function (response) {
         			                        swal("Error encountered while accessing the data", "Please try again", "error");
         			                    }
         							});
        	                   

         					},
                             error: function (response) {
                                 swal("Error encountered while adding data", "Please try again", "error");
                             }
         				});
	    			}
	    			
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
				
	    		$('#studentDrp').multiSelect({
					
				    selectableHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
				    selectionHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
				    afterInit: function (ms) {
				        var that = this,
				            $selectableSearch = that.$selectableUl.prev(),
				            $selectionSearch = that.$selectionUl.prev(),
				            selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
				            selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

				        that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
				            .on('keydown', function (e) {
				                if (e.which === 40) {
				                    that.$selectableUl.focus();
				                    return false;
				                }
				            });

				        that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
				            .on('keydown', function (e) {
				                if (e.which == 40) {
				                    that.$selectionUl.focus();
				                    return false;
				                }
				            });
				    },
				    afterSelect: function () {
				        this.qs1.cache();
				        this.qs2.cache();
				    },
				    afterDeselect: function () {
				        this.qs1.cache();
				        this.qs2.cache();
				    }
				});
	    		$('.ms-container').css("width", "100%"); 
	    		
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script src="../Assets/js/html2canvas.js"></script>
		<script src="../Assets/js/jspdf.js"></script>
		<script src="../Assets/js/jspdf.debug.js"></script>
		<script src="../Assets/js/jspdf.plugin.autotable.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
		
		<script lang="javascript" src="../Assets/js/xlsx.full.min.js"></script>
		<script lang="javascript" src="../Assets/js/FileSaver.min.js"></script>
		
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Pre-Enrollment/AcademicYear.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#FeeAdd">
                                        Add New <i class="fa fa-plus"></i>
                                    </button>
                                        </div>
                                        <!--  <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                        -->
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 200px">Student Number</th>
	                                            <th style="width: 100px">Student Name</th>
	                                            <th style="width: 100px">Course and Section</th>  
	                                            <th style="width: 120px">Award</th>  
	                                            <th style="width: 120px">Term</th>  
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="FeeAdd" class="modal fade">
	        <div class="modal-dialog" style="width:55%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Academic Awards</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                        		Award
	                        		<select class="populate " id="awardDrp">
				                  	    <option value="default" selected="selected" disabled="disabled" >Select a Award</option>                            	       	
			                  			${award}      	
			                		</select>  
	                        	</div>
	                        	<br/>
	                        	<div class="col-lg-12">
		                			Student
					                <select class="multi-select" multiple="" id="studentDrp" style="width: 100%;" >
					                   
					                </select>
					           </div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="SaveAcadwemicAwards" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    
	    </jsp:body>


</t:Registrar>
