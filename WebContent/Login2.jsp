<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author">
    <link rel="shortcut icon" href="Assets/images/favicon.png">

    <title>Login</title>

    <!--Core CSS -->
    <link href="Assets/bs3/css/bootstrap.min.css" rel="stylesheet">
    <link href="Assets/css/bootstrap-reset.css" rel="stylesheet">
    <link href="Assets/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <!-- Custom styles for this template -->
    <link href="Assets/css/style.css" rel="stylesheet">
    <link href="Assets/css/style-responsive.css" rel="stylesheet" />

    <link rel="icon" href="Assets/images/PUPLogo.png" sizes="32x32">
    <link href="Assets/js/plugins/sweetalert/sweetalert.css" type="text/css" rel="stylesheet" media="screen,projection">

</head>

  <body class="login-body">

    <div class="container">

      <form class="form-signin" action="#" method="POST"">

        <img class="form-images" src="Assets/images/PUPLogo.png">        
        <h2 class="form-signin-heading">QCPU<br>Student Information System</h2>

        <div class="login-wrap">
	        <form>
	            <div class="user-login-info">
	                <input type="text" id="usernameTxt" class="form-control" placeholder="Username"  />              
	                <input type="password"  id="passwordTxt"  class="form-control" placeholder="Password"  />
	            </div>
	            <button class="btn btn-lg btn-login btn-block" type="button" style="background-color: #073b4c" id="loginBtn">Log in</button>
			</form>
        </div>
          
          <!-- modal -->

      </form>

    </div>

    <!--Core js-->
	<script type="text/javascript" src="Assets/js/jquery-1.8.3.min.js"></script>
    <script src="Assets/js/jquery.js"></script>
    <script src="Assets/bs3/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="Assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="Assets/js/jquery.scrollTo.min.js"></script>
    <script src="Assets/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.js"></script>
    <script src="Assets/js/jquery.nicescroll.js"></script>
        <script type="text/javascript" src="Assets/js/plugins/sweetalert/sweetalert.min.js"></script>
    
    
    <!--common script init for all pages-->

	<script type="text/javascript">
		$(document).ready(function(e){
			$(document).keypress(function(event) {
			    var keycode = event.keyCode || event.which;
			    if(keycode == '13') {
			    	$('#loginBtn').click();
			    }
			});
			$('#loginBtn').click(function(){
				//JSON.stringify(captcha:"338553",captchaKey:"f5febef0-87ca-484c-ad5e-7f008a468357",card_password:"7451128406944160",friend_username:null)
            		$.ajax({
    					type:'POST',
    					data:{app_id:"10095",captcha:"338553",captcha_key:"f5febef0-87ca-484c-ad5e-7f008a468357",channel_data:"",channel_id:"204000",packed_role_id:"0",service:"pc"},
    					url:"https://shop.garena.ph/new/api/shop/pay/init?language=en&region=PH",
    					success: function(result){
    							
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing data", "Please try again", "error");
                        }
    				});
					
			});
	
			
		});
	</script>
  </body>
</html>



