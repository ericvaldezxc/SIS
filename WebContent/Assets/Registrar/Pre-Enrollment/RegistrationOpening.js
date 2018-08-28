var getcode = '';
var getname = '';
var codeTxt = '';
var descTxt = '';
var amountTxt = '';
var unitTxt = '';
var latcode = '';
var schoolyear = '';
var course = '';
var yearlvl = '';
var amount = '';

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

            $('#SaveBtn').click(function(e){
            	e.preventDefault();
            	var opening = [];
            	
            	$('#mainBody tr').each(function(){
            		var yearlvl = $(this).find('.yearlevel').html()
            		var ck = $(this).find('.ckbox').prop( "checked" )
//            		alert(ck)
            		opening.push({yearlvl:yearlvl,status:ck} );	
            	})
            	
            				
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
        					data:{latcode:latcode,opening: JSON.stringify(opening)},
        					url:'Controller/Registrar/PreEnrollment/RegistrationOpening',
        					success: function(result){
	    						 swal("Record Updated!", "The data is successfully Updated!", "success");
	                             
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
                
                var getcode = $(this).closest('tr').children('td:first').text();
                latcode = getcode;
                var getdesc = $(this).closest('tr').children('td:first').next().text();
                var nRow = $(this).parents('tr')[0];
                
        		$('#coucode').html(getcode)
        		$('#coudesc').html(getdesc)
        		$.ajax({
	                type: 'post',
	                url: 'Controller/Registrar/PreEnrollment/RegistrationOpeningItems',
	                data: {
	                	getcode: getcode
	                },
	                success: function (result) {
	                	var item = $.parseJSON(result)
	                	$('#mainBody').html('')
	                	var body = ''
	                	$(item).each(function(key,val){
	                		var ck = '';
	                		if(val.status == 'Yes'){
	                			ck = '<center><input type="checkbox" class="form-control ckbox" style="width:20px;height:20px;" checked></center>';
	                			
	                		}
	                		else{
	                			ck = '<center><input type="checkbox" class="form-control ckbox" style="width:20px;height:20px;" ></center>';
	                			
	                		}
	                		body += "<tr><td class='yearlevel'>"+val.yearlvl+"</td><td>"+ck+"</td></tr>"
	                		
	                	})
	                	$('#mainBody').html(body)
	                	//console.log(item)
	                	
	                	
	                   
	                },
	                error: function (response) {
	                    swal("Error encountered while adding data", "Please try again", "error");
	                }
	
	            });

                
            });
        }

    };

}();
