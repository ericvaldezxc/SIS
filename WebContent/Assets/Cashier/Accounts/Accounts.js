var getcode = '';
var getname = '';
var codeTxt = '';
var descTxt = '';
var unitTxt = '';
var latcode = '';
var finalstudentNumber = '';
var finalstudentName = '';
var finalstudentBalance = '';
var totalamoun = ''

var EditableTable = function () {

    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();

            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                //.substring(aData[0].indexOf("*") + 5, aData[0].length)

                jqTds[0].innerHTML = '<input type="text" class="form-control small " value="' + aData[0] + '" disabled style="width:100%" >';
                jqTds[1].innerHTML = '<input type="text" class="form-control small" value="' + aData[1] + '" style="width:100%">';
                jqTds[2].innerHTML = '<input type="text" class="form-control small" value="' + aData[2] + '" style="width:100%">';
                jqTds[3].innerHTML = '<center><a class="btn btn-success  edit" href=""><i class="fa fa-save"></i></a> <a class="btn btn-danger cancel" href=""><i class="fa fa-ban"></i></a></center>';


            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);

                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate("<center><a class='btn btn-success edit' href='javascript:;'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", nRow, 3, false);
                oTable.fnDraw();


            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate('<a class="btn btn-success edit" href="">Edit</a>', nRow, 2, false);
                oTable.fnDraw();
            }

            var oTable = $('#editable-sample').dataTable({
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
                }
            });

            jQuery('#editable-sample_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
            jQuery('#editable-sample_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown

            var nEditing = null;

            $('#editable-sample_new').click(function (e) {

            });

            $('#addBtn').click(function(e){
            	e.preventDefault();
            	 var payment = $('#amountTxt').val()
            	 var sname = $('#student-name').text()
            	 var snum = $('#student-number').text()
            	 var balance = $('#student-balance').text()
            	 var rembalance = $('#remaining-balance').text()
            	 
				
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
        					data:{amount: payment, studentNumber:finalstudentNumber},
        					url:'Controller/Cashier/Account/Payment',
        					success: function(result){
        		                var pdf = new jsPDF('p', 'mm', [110, 80]);
        		                var breaker = '_______________________________________________________________________'

        		                pdf.setFontType("normal");
        						pdf.setFontSize(7);
        						pdf.text(3,3,breaker)

        						pdf.setFontType("bold");
        						pdf.setFontSize(8);
        						pdf.text(3,7,"Quezon City Polytechnic University")

        						pdf.setFontType("italic");
        						pdf.setFontSize(5);
        						var addre = pdf.splitTextToSize("QCPU Technical & Vocational Building, 673 Quirino Hway, Novaliches, Quezon City, 1116 Metro Manila", 45);
        						pdf.text(3,9,addre)
        						
        						pdf.setFontType("normal");
        						pdf.setFontSize(7);
        						pdf.text(3,13,breaker)
        						
        						pdf.setFontType("italic");
        						pdf.setFontSize(11);
        						pdf.text(33,23,"Payment")

        						pdf.setFontType("italic");
        						pdf.setFontSize(7);
        						pdf.text(3,30,sname)

        						pdf.setFontType("italic");
        						pdf.setFontSize(6);
        						pdf.text(5,33,snum)

    							pdf.setFontType("italic");
        						pdf.setFontSize(7);
        						pdf.text(33,40,balance + "")
        						
        						pdf.setFontType("bold");
        						pdf.setFontSize(6);
        						pdf.text(30,43,"-")

        						pdf.setFontType("italic");
        						pdf.setFontSize(6);
        						pdf.text(33,43,payment + "")

        						pdf.setFontType("bold");
        						pdf.setFontSize(6);
        						pdf.text(33,44,"_________")

        						pdf.setFontType("italic");
        						pdf.setFontSize(6);
        						pdf.text(33,47,rembalance + " Remaining Balance")
        						        						
        						pdf.setFontType("normal");
        						pdf.setFontSize(7);
        						pdf.text(3,105,breaker)

        						
        						/*
        						 var payment = $('#amountTxt').val()
				            	 var sname = $('#student-name').text()
				            	 var snum = $('#student-number').text()
				            	 var balance = $('#student-balance').text()
				            	 var rembalance = $('#remaining-balance').text()
        						*/

        						specialElementHandlers = {
									'#bypassme': function(element, renderer){
										return true
									}
								}
        		                
        		                var myImage = new Image();
        						myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
        						myImage.onload = function(){
        							pdf.addImage(myImage , 'png', 70, 4, 8, 8);
        							 var uri = pdf.output('dataurlstring');
        					  	   	 openDataUriWindow(uri);
        					  	};
        						

	                             $("#addcloseBtn").click();
	    						 swal({
                                     title: "Successful!"
                                     , text: "The payment is successfully assess!"
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
								
			});
            
			function openDataUriWindow(url) {
			    var html = '<html>' +
			        '<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style>' +
			        '<body>' +
			        '<iframe src="' + url + '"></iframe>' +
			        '</body></html>';
			    a = window.open();
			    a.document.write(html);
			}

            
            $('#updateBtn').click(function(e){
            	e.preventDefault();
            	codeTxt = $('#codeUpdateTxt').val();
            	unitTxt = $('#unitsTxt').val();				 
            	descTxt = $('#descUpdateTxt').val();

				
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
        					data:{codeTxt: codeTxt, descTxt: descTxt,type:"Update",latcode:latcode,unitTxt:unitTxt},
        					url:'Controller/Admin/Curriculum/SubjectController',
        					success: function(result){
        						 $('#codeTxt').val('') ;
        						 $('#descTxt').val('');
                                 swal({
                                     title: "Record Updated!"
                                     , text: "The data is successfully Added!"
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
                            }
        				});

                    } else {

                        swal("Cancelled", "The transaction is cancelled", "error");
                    }

                });
								
			});

            $('#editable-sample').on('click',' a.delete', function (e) {
                e.preventDefault();

                var getval = $(this).closest('tr').children('td:first').text();;
                var nRow = $(this).parents('tr')[0];


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
                                type: 'post',
                                url: 'Controller/Admin/Curriculum/SubjectController',
                                data: {
                                	codeTxt: codeTxt, descTxt: descTxt,type:"Delete",latcode:getval
                                },
                                success: function (response) {
                                    swal({

                                            title: "Record Deleted!",
                                            text: "The data is successfully deleted!",
                                            type: "success",
                                            confirmButtonColor: '#86CCEB',
                                            confirmButtonText: 'Okay',
                                            closeOnConfirm: false
                                        },
                                        function (isConfirm) {
                                            if (isConfirm) {
                                                window.location.reload();

                                            } else
                                                swal("Cancelled", "The transaction is cancelled", "error");

                                        });
                                },
                                error: function (response) {
                                    swal("Error encountered while adding data", "Please try again", "error");
                                }

                            });

                        } else
                            swal("Cancelled", "The transaction is cancelled", "error");

                    });

            });

            $('#editable-sample ').on('click','a.retrieve', function (e) {
                e.preventDefault();

                var getval = $(this).closest('tr').children('td:first').text();
                var nRow = $(this).parents('tr')[0];


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
                                type: 'post',
                                url: 'Controller/Admin/Curriculum/SubjectController',
                                data: {
                                	codeTxt: codeTxt, descTxt: descTxt,type:"Retrieve",latcode:getval
                                },
                                success: function (response) {
                                    swal({

                                            title: "Record Retrieved!",
                                            text: "The data is successfully retrieved!",
                                            type: "success",
                                            confirmButtonColor: '#86CCEB',
                                            confirmButtonText: 'Okay',
                                            closeOnConfirm: false
                                        },
                                        function (isConfirm) {
                                            if (isConfirm) {
                                                window.location.reload();

                                            } else
                                                swal("Cancelled", "The transaction is cancelled", "error");

                                        });
                                },
                                error: function (response) {
                                    swal("Error encountered while adding data", "Please try again", "error");
                                }

                            });

                        } else
                            swal("Cancelled", "The transaction is cancelled", "error");

                    });

            });


            $('#editable-sample').on('click','a.cancel', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });
            function getamount(){
            	var currentamount = $('#amountTxt').val()
            	if(currentamount == '')
            		currentamount = 0
            	totalamount = parseFloat(finalstudentBalance) - parseFloat(currentamount) 
            	
            	$.ajax({
					type:'POST',
					data:{Amount: totalamount},
					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
					success: function(result){
						$('#remaining-balance').html(result)
                         
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }
				});	
            }

            $('#amountTxt').on('keyup',function(){
            	getamount()
			});

            $('#editable-sample').on('click','a.payment', function (e) {
                e.preventDefault();
                $('#amountTxt').val('')
                var studentNumber = $(this).data("student-number")
                finalstudentNumber = studentNumber
                var studentName = $(this).data("student-name")
                finalstudentName = studentName
                var studentBalance = $(this).data("student-balance") 
                finalstudentBalance = studentBalance.replace(",", "");
                latcode = studentNumber;
                $('#student-name').html(studentName)
                $('#student-number').html(studentNumber)
                $('#student-balance').html(studentBalance)
                getamount()

                
            });
            
            $('#editable-sample').on('click','a.offset', function (e) {
                e.preventDefault();
                $('#amountTxt').val('')
                var studentNumber = $(this).data("student-number")
                finalstudentNumber = studentNumber
                var studentName = $(this).data("student-name")
                finalstudentName = studentName
                var studentBalance = $(this).data("student-balance") 
                finalstudentBalance = studentBalance.replace(",", "");
                
                swal({

                    title: "Are you sure",
                    text: "Do you want to offset this account?",
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
                            type: 'post',
                            url: 'Controller/Cashier/Account/Offset',
                            data: {
                            	amount: finalstudentBalance, studentNumber: studentNumber
                            },
                            success: function (response) {
        		                var pdf = new jsPDF('p', 'mm', [110, 80]);
        		                var breaker = '_______________________________________________________________________'

        		                pdf.setFontType("normal");
        						pdf.setFontSize(7);
        						pdf.text(3,3,breaker)

        						pdf.setFontType("bold");
        						pdf.setFontSize(8);
        						pdf.text(3,7,"Quezon City Polytechnic University")

        						pdf.setFontType("italic");
        						pdf.setFontSize(5);
        						var addre = pdf.splitTextToSize("QCPU Technical & Vocational Building, 673 Quirino Hway, Novaliches, Quezon City, 1116 Metro Manila", 45);
        						pdf.text(3,9,addre)
        						
        						pdf.setFontType("normal");
        						pdf.setFontSize(7);
        						pdf.text(3,13,breaker)
        						
        						pdf.setFontType("italic");
        						pdf.setFontSize(11);
        						pdf.text(33,23,"Offset")

        						pdf.setFontType("italic");
        						pdf.setFontSize(7);
        						pdf.text(3,30,studentName)

        						pdf.setFontType("italic");
        						pdf.setFontSize(6);
        						pdf.text(5,33,studentNumber)

    							pdf.setFontType("italic");
        						pdf.setFontSize(7);
        						pdf.text(33,40,studentBalance + "")
        						
        						pdf.setFontType("bold");
        						pdf.setFontSize(6);
        						pdf.text(30,43,"-")

        						pdf.setFontType("italic");
        						pdf.setFontSize(6);
        						pdf.text(33,43,studentBalance + "")

        						pdf.setFontType("bold");
        						pdf.setFontSize(6);
        						pdf.text(33,44,"_________")

        						pdf.setFontType("italic");
        						pdf.setFontSize(6);
        						pdf.text(33,47,0 + " Remaining Balance")
        						        						
        						pdf.setFontType("normal");
        						pdf.setFontSize(7);
        						pdf.text(3,105,breaker)

        		                var myImage = new Image();
        						myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
        						myImage.onload = function(){
        							pdf.addImage(myImage , 'png', 70, 4, 8, 8);
        							 var uri = pdf.output('dataurlstring');
        					  	   	 openDataUriWindow(uri);
        					  	};
        						

                            	
                            	
                            	swal({

                                        title: "Record Updated!",
                                        text: "The data is successfully Updated!",
                                        type: "success",
                                        confirmButtonColor: '#86CCEB',
                                        confirmButtonText: 'Okay',
                                        closeOnConfirm: false
                                    },
                                    function (isConfirm) {
                                        if (isConfirm) {
                                            window.location.reload();

                                        } else
                                            swal("Cancelled", "The transaction is cancelled", "error");

                                    });
                            },
                            error: function (response) {
                                swal("Error encountered while adding data", "Please try again", "error");
                            }

                        });

                    } else
                        swal("Cancelled", "The transaction is cancelled", "error");

                });
                
                
                

                
            });
        }

    };

}();
