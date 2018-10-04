var getcode = '';
var getname = '';
var codeTxt = '';
var descTxt = '';
var unitTxt = '';
var latcode = '';
var schoolyear = '';
var course = '';
var subjectDrp = '';
var amount = '';
var feeDrp = '' ;

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
            	schoolyear = $('#yearDrp').val();	
            	subjectDrp = $('#subjectDrp').val();
				
				
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
        					data:{schoolyear: schoolyear, subjectDrp: subjectDrp,type:"Insert",latcode:latcode},
        					url:'Controller/Registrar/PreEnrollment/SubjectFee',
        					success: function(result){
                            	$('#mainBody tr').each(function(index,val){
	                        		$.ajax({
	                					type:'POST',
	                					data:{amount: $(this).find('.amountTxt').val(),fee:$(this).find('.fee option:selected').val(),type:"Insert",latcode:latcode},
	                					url:'Controller/Registrar/PreEnrollment/SubjectFeeItem',
	                					async: true,
	                					success: function(result2){

	                					},
	                                    error: function (response) {
	                                        swal("Error encountered while adding data", "Please try again", "error");
	                                        
	                                    }
	                				});
	             					
	                             });
        						
        						
        						
	    						 swal("Record Added!", "The data is successfully added!", "success");
	                             var aiNew = oTable.fnAddData([schoolyear, subjectDrp,$('#totamount').html(), "<center><a class='btn btn-success edit' data-toggle='modal' href='#SubjectEdit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", '']);
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
								
			});
            $('#updBtn').click(function(e){
            	e.preventDefault();
            	schoolyear = $('#updyearDrp').val();	
            	subjectDrp = $('#updsubjectDrp').val();

				
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
        					data:{subj: subjectDrp, acad: schoolyear,type:"Update",latcode:latcode},
        					url:'Controller/Registrar/PreEnrollment/SubjectFeeItemUpdate',
        					success: function(result){
        						$('#updmainBody tr').each(function(index,val){
	                        		$.ajax({
	                					type:'POST',
	                					data:{amount: $(this).find('.amountTxt').val(),fee:$(this).find('.updfee option:selected').val(),type:"Update",latcode:latcode},
	                					url:'Controller/Registrar/PreEnrollment/SubjectFeeItem',
	                					async: true,
	                					success: function(result2){
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



            $('#editable-sample').on('click','a.edit', function (e) {
                e.preventDefault();
                
                var acdyear = $(this).data("acadyear");
                var sub = $(this).data("subject");
                
                latcode = $(this).data("id");
                
        		$("#updyearDrp").select2("val", acdyear);
        		$("#updsubjectDrp").select2("val", sub);
        		
        		$.ajax({
					type:'POST',
					data:{latcode:latcode},
					url:'Controller/Registrar/PreEnrollment/SubjectFeeItemView',
					success: function(result){
						var item = $.parseJSON(result);
						
						var code = [];
						var amount = [];

						$('#updmainBody').html('')
						$.each(item, function (key, val) {
							$('#updmainBody').append($('#updduplicate').html())
	
	                     	code.push(val.code);
	                     	amount.push(val.amount); 
	                     	
	                    });
						if(code.length == 0){
							$('#updmainBody').html($('#updduplicate').html())
							$("#updmainBody select.updfee").select2();
							$('#updtotamount').html('0.00')
							
						}
						else{
							$("#updmainBody select.updfee").select2();
							var i = 0
							var updamountTotal = 0;
							$.each($('#updmainBody tr'), function (key, val) {
								$(this).find('.updfee').select2("val", code[i]);
								$(this).find('.amountTxt').val(amount[i]);
								if(amount[i] != '' )	
			                		updamountTotal = parseFloat(updamountTotal) + (parseFloat(amount[i]) ) ;
		                     
		                     	i++
		                     	
		                    });
							
							$.ajax({
		    					type:'POST',
		    					data:{Amount: updamountTotal},
		    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
		    					success: function(result){
		    	                	$('#updtotamount').html(result)
		    	                	
		 
		                             
		    					},
		                        error: function (response) {
		                            swal("Error encountered while accessing the data", "Please try again", "error");
		                        }
		    				});
							
						}

                         
					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});

                
            });
        }

    };

}();
