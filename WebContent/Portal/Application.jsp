<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application</title>
<!--Core CSS -->
<link href="../Assets/bs3/css/bootstrap.min.css" rel="stylesheet">
<link href="../Assets/css/bootstrap-reset.css" rel="stylesheet">
<link href="../Assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="../Assets/css/bootstrap-switch.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/bootstrap-fileupload/bootstrap-fileupload.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/bootstrap-wysihtml5/bootstrap-wysihtml5.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/bootstrap-datepicker/css/datepicker.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/bootstrap-timepicker/compiled/timepicker.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/bootstrap-colorpicker/css/colorpicker.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/bootstrap-datetimepicker/css/datetimepicker.css" />

<!--dynamic table-->
<link rel="stylesheet" type="text/css" href="../Assets/js/jquery-multi-select/css/multi-select.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/jquery-tags-input/jquery.tagsinput.css" />
<link rel="stylesheet" type="text/css" href="../Assets/js/select2/select2.css" />
<!-- Custom styles for this template -->
<link href="../Assets/css/style.css" rel="stylesheet">
<link href="../Assets/css/style-responsive.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="../Assets/js/select2/select2.css" />
<link href="../Assets/js/plugins/sweetalert/sweetalert.css" type="text/css" rel="stylesheet" media="screen,projection">
<link rel="icon" href="../Assets/images/PUPLogo.png" sizes="32x32">
</head>
<body>
	<section id="main-content">
        <section class="wrapper">
        <!-- page start-->
            <div id="body">
		     <section class="panel">
		        <div class="panel-body">
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
					    		Birth date
                                <input class="form-control form-control-inline input-medium default-date-picker" id="dobTxt" size="16" type="text" value="" />
                                    
					        </div>
					        <div class="col-lg-6" style="padding-top:10px">
					        	Place of Birth <input type="text" class="form-control" placeholder="ex. Quezon City" id="pobTxt" >
					        </div>
				        </div>
				        <div class="row">
					    	<div class="col-lg-6 ">
						    	<div class="col-lg-12" style="padding-top:10px">
					           		Gender
					            	<select style="width: 300px" id="genderDrp">
										<option value="default" selected="selected" disabled="disabled" >Select a Gender</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
				            		</select>
				            	</div>
				            	<div class="col-lg-12" style="padding-top:10px">
				                	Civil Status
					           		<select style="width: 300px" id="civilDrp">
						   					<option value="default" selected="selected" disabled="disabled" >Select a Civil Status</option>
						   					<option value="Single">Single</option>
						   					<option value="Married">Married</option>
						   					<option value="Widowed">Widowed</option>
						   					<option value="Divorced">Divorced</option>
					            	</select>	                            
					        	</div>
					    	</div>
					    	<div class="col-lg-6 " style="padding-top:10px">
					        	Address <textarea class="form-control" placeholder="ex. Don fabian st. Commonwealth Quezon City" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="addressTxt"></textarea>
					    	</div>				        	
				        </div>
				        <div class="row">
				       		<div style="text-align:center;margin-top:2%;">
						        <button class="btn btn-success " id="addBtn" type="button">Submit</button> 
				       		</div>
				        </div>
					</form>	
		        </div>
		    </section>
		    </div>
        <!-- page end-->
        </section>
    </section>
	<script src="../Assets/js/jquery.js"></script>
    <script src="../Assets/bs3/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="../Assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="../Assets/js/jquery.scrollTo.min.js"></script>
    <script src="../Assets/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
    <script src="../Assets/js/jquery.nicescroll.js"></script>
   	<script src="../Assets/js/select2/select2.js"></script>
	<script src="../Assets/js/select-init.js"></script>

	<script type="text/javascript" src="../Assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="../Assets/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script type="text/javascript" src="../Assets/js/bootstrap-daterangepicker/moment.min.js"></script>
	<script type="text/javascript" src="../Assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	<script type="text/javascript" src="../Assets/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
	<script type="text/javascript" src="../Assets/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
    <!--dynamic table-->
    <script type="text/javascript" language="javascript" src="../Assets/js/advanced-datatable/js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="../Assets/js/data-tables/DT_bootstrap.js"></script>
    <!--common script init for all pages-->
    <script src="../Assets/js/iCheck/jquery.icheck.js"></script>
	<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.multi-select.js"></script>
	<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
	<script src="../Assets/js/select2/select2.js"></script>
	<script src="../Assets/js/select-init.js"></script>
	<script type="text/javascript" src="../Assets/js/ckeditor/ckeditor.js"></script>

	<script src="../Assets/js/advanced-form.js"></script>

    <script src="../Assets/js/scripts.js"></script>
    <!--icheck init -->
	<script src="../Assets/js/icheck-init.js"></script>
	<script>
		$(document).ready(function(){
			$("#genderDrp").select2( {width: '100%' });
			$("#civilDrp").select2( {width: '100%' });
			
			$('#addBtn').on('click',function(){
		     	var firstNameTxt = $('#firstNameTxt').val();
		     	var middleNameTxt = $('#middleNameTxt').val();
		     	var lastNameTxt = $('#lastNameTxt').val();
		     	var dobTxt = $('#dobTxt').val();
		     	var pobTxt = $('#pobTxt').val();
		     	var genderDrp = $('#genderDrp').val();
		     	var civilDrp = $('#civilDrp').val();
		     	var addressTxt = $('#addressTxt').val();
		     	var conTxt = $('#conTxt').val();
		     	var emailTxt = $('#emailTxt').val();	
		     	var type = '';
		     	var latcode = '';
		     	
		     	var date = dobTxt.substring(0,2)
		     	var month = dobTxt.substring(3,5)
		     	var year = dobTxt.substring(6,10)
		     	dobTxt = year+'-'+date+'-'+month
		     	
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
	        					data:{
	        						firstNameTxt: firstNameTxt, 
	        						middleNameTxt: middleNameTxt, 
	        						lastNameTxt: lastNameTxt, 
	        						dobTxt: dobTxt, 
	        						pobTxt: pobTxt, 
	        						genderDrp: genderDrp, 
	        						civilDrp: civilDrp, 
	        						addressTxt: addressTxt,
	        						latcode:latcode,
	        						conTxt:conTxt,
	        						emailTxt:emailTxt,
	        						type:"Insert"
	        						
	        						},
	        					url:'Application',
	        					success: function(result){
		        						swal({
		                                    title: "Application is successful!"
		                                    , text: "The application is successfully send!"
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
			
		})
	</script>
    <!--dynamic table initialization -->

    <script type="text/javascript" src="../Assets/js/plugins/sweetalert/sweetalert.min.js"></script>
</body>
</html>