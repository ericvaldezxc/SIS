<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="shortcut icon" href="Assets/assets/images/qcpu-seal-122x121.png" type="image/x-icon">

<title>Portal</title>
  <link rel="stylesheet" href="Assets/assets/web/assets/mobirise-icons/mobirise-icons.css">
  <link rel="stylesheet" href="Assets/assets/tether/tether.min.css">
  <link rel="stylesheet" href="Assets/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="Assets/assets/bootstrap/css/bootstrap-grid.min.css">
  <link rel="stylesheet" href="Assets/assets/bootstrap/css/bootstrap-reboot.min.css">
  <link rel="stylesheet" href="Assets/assets/socicon/css/styles.css">
  <link rel="stylesheet" href="Assets/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="Assets/assets/theme/css/style.css">
  <link rel="stylesheet" href="Assets/assets/mobirise/css/mbr-additional.css" type="text/css">
  <link href="Assets/js/plugins/sweetalert/sweetalert.css" type="text/css" rel="stylesheet" media="screen,projection">
  
</head>
<body>
  <section class="menu cid-r1bCnxa8A0" once="menu" id="menu1-0">
    <nav class="navbar navbar-expand beta-menu navbar-dropdown align-items-center navbar-fixed-top navbar-toggleable-sm bg-color transparent">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <div class="hamburger">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
        </button>
        <div class="menu-logo">
            <div class="navbar-brand">
                <span class="navbar-logo">
                    <a href="https://mobirise.com">
                         <img src="Assets/assets/images/qcpu-seal-122x121.png" alt="Mobirise" title="" style="height: 3.8rem;">
                    </a>
                </span>
                <span class="navbar-caption-wrap"><a class="navbar-caption text-white display-4" href="index.jsp">QUEZON CITY POLYTECHNIC UNIVERSITY&nbsp;</a></span>
            </div>
        </div>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
                <li class="nav-item">
                    <a class="nav-link link text-white display-4" href="Portal/Application.jsp">Apply Now</a>
                </li></ul>
            <div class="navbar-buttons mbr-section-btn"><a class="btn btn-sm btn-primary display-4" href="Login.jsp">Sign In</a></div>
        </div>
    </nav>
</section>

<section class="cid-r1bCsFkTvl mbr-fullscreen" id="header2-1">
	<div class="container align-center">
        <div class="row justify-content-md-center">
            <div class="mbr-white col-md-10">
                <h1 class="mbr-section-title mbr-bold pb-3 mbr-fonts-style display-1">Application Form</h1>
               	<div class="row" style="text-align:left">
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
				<div class="row" style="text-align:left">
		        	<div class="col-lg-6" style="padding-top:10px">
		        		Contact Number<input type="text" maxlength="11" class="form-control" placeholder="ex. 09xxxxxxxxx"  id="conTxt" >
		        	</div>
					<div class="col-lg-6" style="padding-top:10px">
						Email Address  <input type="text" class="form-control" placeholder="ex. juandelacruz@domain.com" id="emailTxt" >
					</div>
				</div>
				<div class="row" style="text-align:left">
					<div class="col-lg-6" style="padding-top:10px">
			    		Birth date
                        <input class="form-control" id="dobTxt" size="16" type="date" value="" />         
			        </div>
			        <div class="col-lg-6" style="padding-top:10px">
			        	Place of Birth <input type="text" class="form-control" placeholder="ex. Quezon City" id="pobTxt" >
			        </div>
		        </div>
		        <div class="row" style="text-align:left">
			    	<div class="col-lg-6 ">
		           		Gender
		            	<select class="form-control"  id="genderDrp">
							<option value="default" selected="selected" disabled="disabled" >Select a Gender</option>
							<option value="Male">Male</option>
							<option value="Female">Female</option>
	            		</select>
			    	</div>	
			    	<div class="col-lg-6" >
	                	Civil Status
		           		<select class="form-control" id="civilDrp">
			   					<option value="default" selected="selected" disabled="disabled" >Select a Civil Status</option>
			   					<option value="Single">Single</option>
			   					<option value="Married">Married</option>
			   					<option value="Widowed">Widowed</option>
			   					<option value="Divorced">Divorced</option>
		            	</select>	                            
		        	</div>	        	
		        </div>
		        <div class="row" style="text-align:left">
			    	<div class="col-lg-12 " style="padding-top:10px">
			        	Address <textarea class="form-control" placeholder="ex. Don fabian st. Commonwealth Quezon City" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="addressTxt"></textarea>
			    	</div>		
		        </div>
		        <br/>
		        <span class="input-group-btn" style="margin-top:10px">
                    <button href="" type="button" id="addBtn"  class="btn btn-secondary btn-form display-4">SEND FORM</button>
                </span>
		        
            </div>
        </div>
    </div>
</section>

<section class="cid-r1bGKcPuxd" id="footer1-5">

    

    

    <div class="container">
        <div class="media-container-row content text-white">
            <div class="col-12 col-md-3">
                <div class="media-wrap">
                    <a href="index.jsp">
                        <img src="Assets/assets/images/qcpu-seal-192x191.png" alt="Mobirise" title="">
                    </a>
                </div>
            </div>
            <div class="col-12 col-md-3 mbr-fonts-style display-7">
                <h5 class="pb-6">
                    Address
                </h5>
                <p class="mbr-text">Novaliches Bayan</p>
            </div>
            <div class="col-12 col-md-3 mbr-fonts-style display-7">
                <h5 class="pb-6">
                    Contacts
                </h5>
                <p class="mbr-text">QCPU Main Campus: 9360526<br>QCPU Batasan Campus: 4678957<br>QCPU RMDO: 5135867<br>QCPU Registrar: 3325003<br></p>
            </div>
        </div>
        <div class="footer-lower">
            <div class="media-container-row">
                <div class="col-sm-12">
                    <hr>
                </div>
            </div>
            <div class="media-container-row mbr-white">
                <div class="col-sm-6 copyright">
                    <p class="mbr-text mbr-fonts-style display-7">
                        © QCPU SIS
                    </p>
                </div>
                <div class="col-md-6">
                    <div class="social-list align-right">
                        <div class="soc-item">
                            <a href="https://twitter.com/mobirise" target="_blank">
                                <span class="socicon-twitter socicon mbr-iconfont mbr-iconfont-social"></span>
                            </a>
                        </div>
                        <div class="soc-item">
                            <a href="https://www.facebook.com/pages/Mobirise/1616226671953247" target="_blank">
                                <span class="socicon-facebook socicon mbr-iconfont mbr-iconfont-social"></span>
                            </a>
                        </div>
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
	

  <script src="Assets/assets/web/assets/jquery/jquery.min.js"></script>
  <script src="Assets/assets/popper/popper.min.js"></script>
  <script src="Assets/assets/tether/tether.min.js"></script>
  <script src="Assets/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="Assets/assets/dropdown/js/script.min.js"></script>
  <script src="Assets/assets/touchswipe/jquery.touch-swipe.min.js"></script>
  <script src="Assets/assets/parallax/jarallax.min.js"></script>
  <script src="Assets/assets/smoothscroll/smooth-scroll.js"></script>
  <script src="Assets/assets/theme/js/script.js"></script>
  <script type="text/javascript" src="Assets/js/plugins/sweetalert/sweetalert.min.js"></script>
  <script>
		$(document).ready(function(){
			
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
		     	
		     	dobTxt = $('#dobTxt').val();
		     	
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
	        					url:'Portal/Application',
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
</body>
</html>