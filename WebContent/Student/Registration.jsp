<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Student" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	String username = "";
	YearLevelUp ylu = new YearLevelUp();
	EncryptandDecrypt ec = new EncryptandDecrypt();
	Fullname fn = new Fullname();
	FinalGrade fg = new FinalGrade();
	Dropdowns drp = new Dropdowns();
	String campusDrp = drp.fillcampusDrp();
	String tablebody = "";
	String uname = "";
	if( session.getAttribute("username").toString() != null)
		 uname = session.getAttribute("username").toString(); 
	String body = "";
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT * FROM `t_student_account` inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID where Student_Account_Student_Number = '"+uname+"'");
	String yearlvl = "";
	String course = "";
	String fname = "";
	String mname = "";
	String lname = "";
	String fullname = "";
	String coursedesc = "";
	String sco = "";
	String section = "";
	String accnum = "";
	String accid = "";
	String stat = "";
	while(rs.next()){
		yearlvl = rs.getString("Student_Account_Year");
		course= rs.getString("Course_ID");
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
		fullname = fn.fullname(fname, mname, lname);
		coursedesc = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"));
		sco = rs.getString("Student_Account_Scholastic_Status");
		section = rs.getString("Section_Code");
		accnum = rs.getString("Student_Account_Student_Number");
		accid = rs.getString("Student_Account_ID");
		
		
	}
	
	String tcount = "";
	rs = stmnt.executeQuery("SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_SectionID is not null and Student_Taken_Curriculum_Subject_StudentAccountID = '"+accid+"' ");
	while(rs.next()){
		tcount =  rs.getString("cou");		
		
	}
	
	String sem = "";
	rs = stmnt.executeQuery("SELECT Semester_Description FROM `r_semester` where Semester_Active_Flag = 'Active' ");
	while(rs.next())
		sem = rs.getString("Semester_Description");
	sem = ec.decrypt(ec.key, ec.initVector, sem);
	
	//out.print(sem + " - " + tcount);
	if(sem.equals("First Semester") && !tcount.equals("0")){
		yearlvl = ylu.yearLevel(yearlvl);

	}
	//out.print(yearlvl);
	
	
	rs = stmnt.executeQuery("SELECT * FROM `r_registation_opening` where Registation_Opening_YearLevel = '"+yearlvl+"' and Registation_Opening_CourseID = '"+course+"' ");
	int i =0;
	int fstat = 0;
	while(rs.next()){
		stat = rs.getString("Registation_Opening_Status");
		if(stat.equals("Yes"))
			fstat = 1;
		i++;
	}
	if(i == 0 ){
		fstat = 0;		
	}
	int finstat = 0;
	rs = stmnt.executeQuery("SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = '"+accid+"' and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present') ");
	while(rs.next()){
		String gstat = rs.getString("cou");
		if(gstat.equals("0"))
			finstat = 0 ;
		else
			finstat = 1 ;
		
	}
	

	rs = stmnt.executeQuery("SELECT count(*) as cou FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present' ");
	String cou = "";
	while(rs.next()){
		cou = rs.getString("cou");
	}
	String acadyear = "";
	String acad = "";
	rs = stmnt.executeQuery("SELECT Academic_Year_Description,Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present' ");
	while(rs.next()){
		acadyear = rs.getString("Academic_Year_Description");
		acad = rs.getString("Academic_Year_ID");

	}
	
	acadyear = ec.decrypt(ec.key, ec.initVector, acadyear);

	
	String feebody = "";	
	float totalfee = 0;
	String ffee = "";
	//out.print("SELECT *,format(Course_Fee_Item_Amount,2)  as amou FROM `r_course_fee` inner join r_course_fee_items on Course_Fee_ID = Course_Fee_Item_CourseFeeID inner join r_fee on  Course_Fee_Item_FeeID = Fee_ID where Course_Fee_CourseID = '"+course+"' and Course_Fee_AcademicYearID = '"+acad+"'  ");
	rs = stmnt.executeQuery("SELECT *,format(Course_Fee_Item_Amount,2)  as amou FROM `r_course_fee` inner join r_course_fee_items on Course_Fee_ID = Course_Fee_Item_CourseFeeID inner join r_fee on  Course_Fee_Item_FeeID = Fee_ID where Course_Fee_CourseID = '"+course+"' and Course_Fee_AcademicYearID = '"+acad+"'");
	while(rs.next()){
		String fee =  ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"));
		String amou =  rs.getString("amou");
		totalfee = Float.parseFloat(rs.getString("Course_Fee_Item_Amount")) + totalfee;
		feebody += "<tr><td>"+fee+"</td><td class='amo'>"+amou+"</td></tr>";
		
	}
	
	rs = stmnt.executeQuery("SELECT *,format(Mandatory_Fee_Amount,2)  as amou FROM `r_mandatory_fee` inner join r_fee on Mandatory_Fee_FeeID = Fee_ID where Mandatory_Fee_AcademicYearID = '"+acad+"'");
	while(rs.next()){
		String fee =  ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"));
		String amou =  rs.getString("amou");		
		totalfee = Float.parseFloat(rs.getString("Mandatory_Fee_Amount")) + totalfee;
		feebody += "<tr><td>"+fee+"</td><td class='amo'>"+amou+"</td></tr>";
		
	}
	
	rs = stmnt.executeQuery("SELECT format('"+totalfee+"',2) as fee ");
	while(rs.next()){
		ffee =  rs.getString("fee");		
		
	}

	
	
	
	
	pageContext.setAttribute("body", body);
	pageContext.setAttribute("acadyear", acadyear);
	pageContext.setAttribute("sem", sem);
	pageContext.setAttribute("fullname", fullname);
	pageContext.setAttribute("coursedesc", coursedesc);
	pageContext.setAttribute("sco", sco);
	pageContext.setAttribute("section", section);
	pageContext.setAttribute("accnum", accnum);
	pageContext.setAttribute("Fee", feebody);
	pageContext.setAttribute("totalFee", ffee);
	

	if(fstat == 0){

%>    

<t:Student title="Registration" from="Registration" to="">
	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Student/Schedule/Schedule.js"></script>
    
        <div class="row">
            <div class="col-sm-12">
            	<section class="panel">
                	<div class="panel-body">
                       	<div class="row">
					    	<div class="col-lg-12">
						    	<section class="panel">
						        	<div class="panel-body">
						            	<div class="row" style="text-align:center;color:#B33A3A">
							            	<h4>The Registration isn't open yet</h4>
				 		            	</div>
						        	</div>
						   		</section>
						    </div>
				         </div>
                	</div>
               	</section>
            </div>
         </div>
    </jsp:body>
</t:Student>

<%
	}
	else if(finstat == 1){

%>    

<t:Student title="Registration" from="Registration" to="">
	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Student/Schedule/Schedule.js"></script>
    
        <div class="row">
            <div class="col-sm-12">
            	<section class="panel">
                	<div class="panel-body">
                       	<div class="row">
					    	<div class="col-lg-12">
						    	<section class="panel">
						        	<div class="panel-body">
						            	<div class="row" style="text-align:center;color:#B33A3A">
							            	<h4>You are already Enrolled for this current semester</h4>
				 		            	</div>
						        	</div>
						   		</section>
						    </div>
				         </div>
                	</div>
               	</section>
            </div>
         </div>
    </jsp:body>
</t:Student>

<%
	}
	else{
%>    
<t:Student title="Registration" from="Registration" to="">
	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				
            	var totunit = 0
            	var tottuitionunit = 0
           		$.ajax({
   					type:'POST',
   					async:true,
   					url:'Controller/Student/Registration/CurriculumItems',
   					success: function(result){
   						var item = $.parseJSON(result)
						$('#mainBody').html('')
   						$.each(item, function (key, val) {
   							if(val.group == ''){
   								if(val.stat == 'Yes'){
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
//   									alert(val.code+sel)
	       							$('#mainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val.tuition+'" style="cursor: pointer;">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val.units+'</center></td><td><select class="populate sectionselect"  >'+sel+'</td><td><center><input type="checkbox" class="form-control ckbox" style="width:20px;height:20px;" ></center></td></tr>')
   									
   								}
   								else if(val.stat == 'Taken'){
	       							$('#mainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val.tuition+'">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val.units+'</center></td><td style="text-align:center;color:#68a0b0">You already Taken this subject</td><td><center><input type="checkbox" class="form-control" disabled style="width:20px;height:20px;" ></center></td></tr>')
   									
   								}
	       						else
	       							$('#mainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val.tuition+'">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val.units+'</center></td><td style="text-align:center;color:#B33A3A">You dont have the prerequisite of this subject</td><td><center><input type="checkbox" class="form-control" disabled style="width:20px;height:20px;" ></center></td></tr>')
   							}
       						else{
       							$('#mainBody').append('<tr><td colspan="7" style="font-weight:bold;font-style:italic;font-size:12px;" ><center class="codeText" style="text-align:center;font-weight:bold">'+val.code+'</center></td></tr>')
       							$.each(val.group, function (key2, val2) {
       								if(val2.stat == 'Yes'){
       									var sel = ''
       	   								var sec = ''
       	   								$.each(val2.schedule, function (key3, val3) {
       										var sched = ''
       	   									sec = val3.section
       	   									var j = 0
//   											console.log(val3.schedule)
       										$.each(val3.schedule, function (key4, val4) {
       											$.each(val4, function (key5, val5) {
        	   										if(j != 0)
        	   											sched += " / "
        	   										sched += val5
        	   										j++
        	   									});
    	   									});
       	   									
       										sel += "<option value='"+sec+"'>"+sec+" - "+sched+"</option>"
//       										alert(sel)

       									});
       	   								
	           							$('#mainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject" ><center class="codeText" data-tuition="'+val2.tuition+'" style="cursor: pointer;">'+val2.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val2.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val2.units+'</center></td><td><select class="populate sectionselect"  >'+sel+'</td><td><center><input type="checkbox" class="form-control ckbox" style="width:20px;height:20px;" ></center></td></tr>')
       									
       								}

       								else if(val2.stat == 'Taken'){
    	       							$('#mainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val2.tuition+'">'+val2.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val2.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val2.units+'</center></td><td style="text-align:center;color:#68a0b0">You already Taken this subject</td><td><center><input type="checkbox" class="form-control" disabled style="width:20px;height:20px;" ></center></td></tr>')
       									
       								}
									else
	           							$('#mainBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val2.tuition+'">'+val2.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val2.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.lab+'</center></td><td style="font-size:12px" ><center class="unitTexts">'+val2.units+'</center></td><td style="text-align:center;color:#B33A3A">You dont have the prerequisite of this subject</td><td><center><input type="checkbox" class="form-control" disabled style="width:20px;height:20px;" ></center></td></tr>')
										
       							});
       							
       							
       						}
   							$("select.sectionselect").select2( {width: '100%' });
                        });
   						if($('#mainBody').html() == ''){
   							$('#mainBody').html('<tr><td style="font-size:12px" ><center class="codeText"></center></td><td style="font-size:12px" ><center class="descText"></center></td><td style="font-size:12px" ><center class="unitText"></center></td><td><center></center></td></tr>')
   							
   						}
   						else{
   							$('#mainBody').append('<tr><td style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px" colspan="7" id="totunit">Total: 0 Unit</td></tr>')
   						}

   						
   						
   					},
                       error: function (response) {
                           swal("Error encountered while adding data"+response, "Please try again", "error");
                       }
   				});
            	
            	$('#mainBody').on('click','center.codeText',function(){
            		$('#Prereq').modal("show")
            		$.ajax({
       					type:'POST',
       					data:{subject:$(this).html()},
       					url:'Controller/Student/Registration/Prerequisite',
       					success: function(result){
       						var item = $.parseJSON(result)
    						$('#prereqBody').html('')
    						var i = 0 
       						$.each(item, function (key, val) {       							
       							$('#prereqBody').append('<tr><td style="font-weight:bold;font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val.tuition+'">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lab+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.units+'</center></td></tr>')
       							i++;
       						})
       						if(i == 0)
	   							$('#prereqBody').append('<tr><td colspan="5" style="text-align:center;color:#B33A3A" class="subject">No data available to show</td></tr>')
       						
       					},
                        error: function (response) {
                        	swal("Error encountered while adding data"+response, "Please try again", "error");
                       }
       				});
            	})    
            	$('#AssessBtn').on('click',function(){
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
            		
		            		var enrollsubject = []
		            		$('#mainBody tr').each(function(){
		            			var subcode = $(this).find('.codeText').html()
		            			var section = $(this).find('.sectionselect option:selected').val()
		            			var stat = $(this).find('.ckbox').prop('checked')
		            			if(stat == true){
		            				enrollsubject.push({code:subcode,section:section,stat:"true"})
		            				
		            			}
		            			else if(stat == false){
		            				enrollsubject.push({code:subcode,section:section,stat:"false"})
		            				
		            			}
		            				
		            		})
		            		
		            		$.ajax({
		       					type:'POST',
		       					data:{subjects:JSON.stringify(enrollsubject)},
		       					url:'Controller/Student/Registration/EnrollSubject',
		       					success: function(result){
		       						swal({
		                                title: "Successfully Enrolled!"
		                                , text: "You are successfully enrolled!"
		                                , type: "success"
		                                , confirmButtonColor: '#88A755'
		                                , confirmButtonText: 'Okay'
		                                , closeOnConfirm: false
		                            }, function (isConfirm) {
		                                if (isConfirm) {
		                                    window.location.reload();
		                                }
		                            });
		       						//console.log(result)
		       						
		       						
		       					},
		                        error: function (response) {
		                        	swal("Error encountered while adding data"+response, "Please try again", "error");
		                       }
		       				});
                        } else {
                            swal("Cancelled", "The transaction is cancelled", "error");
                        }

                    });
            		//console.log(enrollsubject)
            		
            	});
            	$('#prereqBody').on('click','center.codeText',function(){
            		$('#Prereq').modal("show")
            		$.ajax({
       					type:'POST',
       					data:{subject:$(this).html()},
       					url:'Controller/Student/Registration/Prerequisite',
       					success: function(result){
       						var item = $.parseJSON(result)
    						$('#prereqBody').html('')
    						var i = 0
       						$.each(item, function (key, val) {       							
       							$('#prereqBody').append('<tr><td font-weight:bold; style="font-size:12px;color:#68a0b0;" class="subject"><center class="codeText" data-tuition="'+val.tuition+'">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lec+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.lab+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.units+'</center></td></tr>')
       							i++;
       						})
       						if(i == 0)
	   							$('#prereqBody').append('<tr><td colspan="5" style="text-align:center;color:#B33A3A" class="subject">No data available to show</td></tr>')
       						
       						
       					},
                        error: function (response) {
                        	swal("Error encountered while adding data"+response, "Please try again", "error");
                       }
       				});
            	})         
            	
            	$('#mainBody').on('change','.ckbox',function(){
            		
                	getfee()
                	totunit = 0;
    				tottuitionunit = 0
                	$('#mainBody tr').each(function(){
                		if($(this).find('.unitTexts').html() != undefined){
                			if($(this).find('input:checkbox').prop("checked") == true){            				
                				totunit += parseInt($(this).find('.unitTexts').html())
                				tottuitionunit += parseInt($(this).find('.codeText').data("tuition"))
                				
                			}
                		}
                		
                	});
                	$('#totunit').html('Total: ' + totunit + ' Units')
                	
            		
			    	

                	
                });
            	
                function getfee(){
                	var subj = []
                	
                	
                    
    				$('#mainBody tr ').each(function(){
    					if($(this).find('.ckbox').prop("checked") != undefined)
    						if($(this).find('.ckbox').prop("checked") == true){
    							subj.push($(this).find('.codeText').text())
    						}
    				})
    				$.ajax({
       					type:'POST',
       					data:{subj:JSON.stringify(subj)},
       					url:'Controller/Student/Registration/Fee',
       					success: function(result){
       						var item = $.parseJSON(result)
       						$('#feemainBody').slideUp(5000)
       						$('#feemainBody  tr.subj').each(function(key,val){
		                        $(this).remove();
		                        
		                    })
		                    
		                    $('#feemainBody  tr.totamount').each(function(key,val){
		                        $(this).remove();
		                        
		                    })
       						$.each(item,function(key,val){
       							$('#feemainBody').append('<tr class="subj"><td>'+val.fee+'</td><td class="amo">'+val.amount+'</td></tr>')
       							
       						})
       						
       						var totalunit = 0
       						
       						$('#mainBody tr').each(function(key,val){
       							if($(this).find('.ckbox').prop('checked') == true){
       								var unit = $(this).find('.codeText').data('tuition')
	       							totalunit = parseFloat(totalunit) +  parseFloat(unit)
       							}
		                        
		                    })
		                    
		                    $.ajax({
								type:'POST',
								data:{},
								url: 'Controller/Student/Registration/GetTuitionUnit',
								success: function(result2){
									var acadamo = parseFloat(totalunit) * parseFloat(result2);
									$.ajax({
				    					type:'POST',
				    					data:{Amount: acadamo},
				    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
				    					success: function(result3){
											$('#feemainBody').append('<tr class="subj"><td>Academic ('+totalunit+' Tuition Unit)</td><td class="amo">'+result3+'</td></tr>')	   
				 
											 var totalamo = 0
											 $('#feemainBody  tr').each(function(key,val){
												 	if($(this).find('.amo').html() != undefined){
								                        var amo = $(this).find('.amo').html().replace(",", "")
								                        totalamo = parseFloat(totalamo) +  parseFloat(amo)

												 	}
											 })
							                    
							                    
							                    $.ajax({
													type:'POST',
													data:{Amount: totalamo},
													url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
													success: function(result4){
							       						$('#feemainBody').append('<tr class="totamount" style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px;"><td>Total Amount: </td><td style="text-align:left;font-weight: bold" class="TotalAmount">'+result4+'</td></tr>')
							       						$('#feemainBody').slideDown(100)

													},
								                    error: function (response) {
								                        swal("Error encountered while accessing the data", "Please try again", "error");
								                    }
												});
				                             
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
		                    
//		                    $('#feemainBody').append('<tr class="subj"><td>Academic ('+totalunit+'Tuition Units)</td><td class="amo">'+totalunit+'</td></tr>')
		                    
		                    
       						 
		                   
		                        
       					},
                        error: function (response) {
                        	swal("Error encountered while adding data"+response, "Please try again", "error");
                       }
       				});
    				
    			}

			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Student/Registration/Registration.js"></script>
	    <div class="row">
		    <div class="col-md-6">
		        <div class="mini-stat clearfix">
		            <span class="mini-stat-icon orange"></span>	        
		            <div class="mini-stat-info">
		                <span id="academicyear">${acadyear}</span>
		                Academic Year
		            </div>
		        </div>
	    	</div>
	    	<div class="col-md-6">
		        <div class="mini-stat clearfix">
			        <span class="mini-stat-icon tar"></span>
		            <div class="mini-stat-info">
		                <span id="semester">${sem}</span>
		                Semester
		            </div>
		        </div>
	    	</div>
	    </div>
	    
        <div class="row">
            <div class="col-sm-12">
            	<section class="panel">
                	<div class="panel-body">
                       	<div class="row">
					    	<div class="col-lg-6">
					    		<h4>${fullname}</h4>
					    		<h6 style="font-style:italic">${accnum} - ${sco}</h6>
						    </div>
						    <div class="col-lg-6">
					    		<h4>${coursedesc}</h4>
					    		<h6 style="font-style:italic">${section}</h6>
						    </div>
				         </div>
                	</div>
               	</section>
            </div>
            
            <div class="col-sm-12">
	        	<section class="panel">
	         		<header class="panel-heading" >
	            		Curriculum Subjects 
	            		<span class="tools pull-right">
			           	<a href="javascript:;" class="fa fa-chevron-down"></a>
	        		   	</span>
		       		</header>
		           <div class="panel-body">
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
						    <tbody id="mainBody">    
						    	<tr>
									<td></td>
								   	
				                </tr>
			                </tbody>
			           </table>
			           <div class="row pull-right">
			           		<div class="col-lg-4 "> 
			           			<button class="btn btn-success " id="AssessBtn" type="button">Assess</button> 
			           		</div>
			           </div>
			       	</div>
		 	</section>
	       </div>

         
         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="Prereq" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Prerequisite</h4>
	                </div>
	                <div class="modal-body">
	                	<table class="table table-striped table-hover table-bordered" id="prereqTbl">
						   	<thead>
			              		<tr>
				                	<th style="width: 200px">Code</th>
				                	<th style="width: 200px">Description</th>
				                	<th style="width: 100px">Lec. Hours</th>
				                	<th style="width: 100px">Lab. Hours	</th>
				                	<th style="width: 100px">Cred. Units</th>
				                </tr>
						    </thead>
						    <tbody id="prereqBody">    
						    	<tr>
									<td style="font-size:15px"><center class="codeText"></center></td>
								   	<td style="font-size:15px"><center class="descText"></center></td>
								   	<td style="font-size:15px"><center class="unitText"></center></td>
								   	<td>
								   		<center>
								   		</center>
				                   </td>
				                </tr>
			                </tbody>
			           </table>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button">Close</button>
	                    <button class="btn btn-success " id="addBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>	
    </jsp:body>
</t:Student>
<%
	}
%>    
