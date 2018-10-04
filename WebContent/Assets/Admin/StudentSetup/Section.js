var getcode = '';
var getname = '';
var code = '';
var latcode = '';
var desc = '';
var year = '';
var section = '';
var course = '';
var curriculum = '';
var unitTxt = '';


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
            
			function getTotalAmount(){
				amountTotal = 0;
				$('#viewmainBodyFee tr').each(function(){
                	var amount = $(this).find('option:selected').data("amount");
                	amount = amount.replace(',', '');
                	var quantity = $(this).find('.quantityText').val();
           
                	if(amount != '' )	
	                	amountTotal = parseFloat(amountTotal) + (parseFloat(amount) * parseFloat(quantity)) ;
				})
				
        		$.ajax({
					type:'POST',
					data:{Amount: amountTotal},
					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
					success: function(result){
//						alert(result)
	                	$('#totalAmount').html(result)

                         
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }
				});
				
				
			}

            $('#addBtn').click(function(e){
            	e.preventDefault();
				 year = $('#yearDrp').val();
				 section = $('#sectionTxt').val();
				 course = $('#courseDrp').val();
				 campus = $('#campusDrp').val();
//				 var _course = document.getElementById('CourseDrp');
//				 var coursename = _course.options[_course.selectedIndex].text;//
//				 var coursevalue = _course.options[_course.selectedIndex].value;

				 var cas = course + '-'+ campus + ' ' + year + '-' + section;
				 year = $('#yearDrp option:selected').text();

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
        					data:{code:cas, year: year, section: section,campus:campus, course: course,type:"Insert",latcode:latcode},
        					url:'Controller/Admin/Student/SectionController',
        					success: function(result){
	    						 swal("Record Added!", "The data is successfully added!", "success");
	                             var aiNew = oTable.fnAddData([cas, curriculum, coursename, "<center><a class='btn btn-success edit' data-toggle='modal' href='#SectionEdit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>"]);
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
            $('#updateBtn').click(function(e){
            	e.preventDefault();
				 desc = $('#UpddescTxt').val();
				 year = $('#UpdyearTxt').val();
				 section = $('#UpdsectionTxt').val();
				 course = $('#UpdCourseDrp').val();
				 curriculum = $('#UpdCurriculumDrp').val();
				 var cas = course + '-' + year + '-' + section;
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
       					data:{cas:cas,desc: desc, year: year, section: section, course: course, curriculum: curriculum,type:"Update",latcode:latcode},
       					url:'Controller/Admin/Student/SectionController',
       					success: function(result){
	    						 swal("Record Updated!", "The data is successfully updated!", "success");
	                             var aiNew = oTable.fnAddData([codeTxt, descTxt, "<center><a class='btn btn-success edit' data-toggle='modal' href='#SectionEdit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>"]);
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


            $('#editable-sample').on('click','a.fee',function(r){
				var curcode = $(this).closest('tr').children('td:first').text();	
				$('#feeCode').html(curcode)
				
				$.ajax({
					type:'POST',
					data:{curcode:curcode},
					url:'Controller/Admin/Curriculum/CurriculumFeeItemViewController',
					success: function(result){
						var item = $.parseJSON(result);
						var i = 0;
						var code = [];
						var description = [];
						var amount = [];
//						var quan = [];
                    	$('#viewmainBodyFee').html('')

                        $.each(item, function (key, val) {
                        	$('#viewmainBodyFee').append($('#feeduplicate').html())

                        	code.push(val.code);
                        	description.push(val.desc); 
                        	amount.push(val.amount); 
//                        	quan.push(val.quantity); 
                        	
                        	i++;
                        	
                        });
                        if(i != 0){
                        	i=0;
                            $('#viewmainBodyFee tr .FeeDrp').each(function(index,val){
                            	
                            	$(this).find("option[value='"+code[i]+"']").attr('selected', 'selected');

                            	i++;
                             });
                            i = 0;
                            $('#viewmainBodyFee tr').each(function(index,val){
                            	
                             	$(this).find(".descriptionText").html(description[i]);
                             	$(this).find(".amountText").html(amount[i]+ ' Php');
                             	$(this).find(".quantityText").val(1);
                             	
                            	i++;
                             });
                            getTotalAmount()
                        	
                        }
                        else{
                   		 $('#viewmainBodyFee').html($('#feeduplicate').html())
                        }
                        

					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});
				
			});
            
            $('#editable-sample').on('click','a.edit', function (e) {
                e.preventDefault();
                
                var getcode = $(this).closest('tr').children('td:first').text();
                latcode = getcode;
                var getdesc = $(this).closest('tr').children('td:first').next().text();
                var nRow = $(this).parents('tr')[0];
                $('#Code').html(getcode)
                
        		$.ajax({
					type:'POST',
					data:{curcode:latcode},
					url:'Controller/Admin/Student/SectionViewController',
					success: function(result){
						var item = $.parseJSON(result)
						$.each(item, function (key, val) {
							$('#UpdyearTxt').val(val.year)
							$('#UpdsectionTxt').val(val.section)
							$('#UpdCourseDrp').val(val.coursecode)
							$('#UpdCurriculumDrp').val(val.curriculumcode)
						
							$('#UpddescTxt').val(val.desc)
							
                         	
                        });
					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});
                
                
            });
            $('#FeesaveBtn').on('click', function(){
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
                    	var FeeCode = $('#feeCode').html()
        				$.ajax({
        					type:'POST',
        					data:{curcode:FeeCode},
        					url:'Controller/Admin/Curriculum/CurriculumFeeUpdateController',
        					success: function(result){
        						
        					},
                            error: function (response) {
                                swal("Error encountered while adding data"+response, "Please try again", "error");
                            }
        				});
        				
                        $('#viewmainBodyFee tr ').each(function(index,val){
                        	var FeeCode = $(this).find('.FeeDrp option:selected').attr("value");
                        	var CurCode = $('#feeCode').html();
                        	var Quantity = $(this).find('.quantityText').val();

                    		$.ajax({
            					type:'POST',
            					data:{CurCode:CurCode,FeeCode:FeeCode,Quantity:Quantity,type:'Insert'},
            					url:'Controller/Admin/Curriculum/CurriculumFeeController',
            					success: function(result){
                                     
            					},
                                error: function (response) {
                                    swal("Error encountered while adding data"+response, "Please try again", "error");
                                }
            				});
         					
                         });
                        
        				swal("Record Updated!", "The data is successfully updated!", "success");


                    } else
                        swal("Cancelled", "The transaction is cancelled", "error");

                });
				
			});
        }

    };

}();
