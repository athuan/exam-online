function showQuestions() {
    var tpcid = '';
    var subid = '';
    // var level = '';
    if (document.getElementById("topicidresponse") && document.getElementById("topicidresponse").value != null && document.getElementById("topicidresponse").value != 0)
        tpcid = document.getElementById("topicidresponse").value;
    if (document.getElementById("subjectname").value != null && document.getElementById("subjectname").value != 0)
        subid = document.getElementById("subjectname").value;
    // if(document.getElementById("testlevel").value != null &&
    // document.getElementById("testlevel").value != 0)
    // level = document.getElementById("testlevel").value;

    var isError = false;
    if (subid == '') {
        isError = true;
    }
    if (isError) {
        alert('Please provide values for all mandatory fields');
    } else {
        $.post("showquestions.do", {
                topicid: tpcid,
                subjectid: subid,
                // levelid : level,
                op: 'showtopicquestions'
            },
            function(data) {
                if (data == null) {
                    alert("Sorry! some problem while showing the questions.");
                } else {
                    var table = document.getElementById("selqtable");
                    var rowCount = table.rows.length;
                    //alert('selected table >>>' + rowCount);
                    var chooseTable = document.getElementById("chooseqtable");
                    var chooseRowCount = chooseTable.rows.length;
                    //alert('choose table >>>' + chooseRowCount);
                    document.getElementById("questtochoose").innerHTML = data;
                    if (chooseRowCount != 1) {
                        var table = document.getElementById("selqtable");
                        var rowCount = table.rows.length;
                        var chooseTable = document.getElementById("chooseqtable");
                        var chooseRowCount = chooseTable.rows.length;
                        for (var i = 1; i < rowCount; i++) {
                            var row = table.rows[i];
                            var chkbox = row.cells[0].childNodes[0];
                            for (var j = 1; j < chooseRowCount; j++) {
                                var chooseRow = chooseTable.rows[j];
                                var choosechkbox = chooseRow.cells[0].childNodes[0];
                                if (chkbox.value == choosechkbox.value) {
                                    table.deleteRow(i);
                                    rowCount--;
            		                i--;
                                }
                            }
                        }
                    }
                }
           });
     }
 }
	
function addRow(tableID,qid,qtext) {
    var table = document.getElementById(tableID);

    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    var element1 = document.createElement("input");
    element1.type = "checkbox";
    element1.name="qid";
    element1.value=qid;
    cell1.appendChild(element1);

    var cell2 = row.insertCell(1);
    cell2.innerHTML = qtext;
}

function addSelectedQuestions(){
	selectQCount = document.getElementById("chooseqtable").rows.length - 1;
	chooseQCount = document.getElementById("chooseqtable").rows.length - 1;
	if(chooseQCount == 0){
		document.getElementById("ra").innerHTML = "<input type='checkbox' name='removeall' onchange='removeAll(this)'/>";
	}
	var givenquestion = document.getElementById("numberquestiongiven").value;
	var added = false;
	var existingQuestion = false;
	try {
        var table = document.getElementById("selqtable");
        var rowCount = table.rows.length;
        for(var i=1; i<rowCount; i++) {
            var row = table.rows[i];
            var chkbox = row.cells[0].childNodes[0];
            var qtext = row.cells[1].innerHTML;
            if(null != chkbox && true == chkbox.checked) {
            	if(selectQCount < givenquestion ){
            		if(checkandRemoveQuestions(chkbox.value)){
            			existingQuestion = true;
            	    }else{
		            	addRow("chooseqtable",chkbox.value,qtext);
		                table.deleteRow(i);
		                rowCount--;
		                i--;
		                selectQCount++;
		                added = true;
            	    }
            	}
            	if(selectQCount == givenquestion ){
            		document.getElementById("asq").disabled = true;
					jQuery('#asq').css('opacity','0.6');
					document.getElementById("ssq").disabled = false;
					jQuery('#ssq').css('opacity','1.0');
            	}
            }
        }
        jQuery('#selqtable tr').find('th:first :checkbox').each(function () {
    		jQuery(this).prop('checked', false);
    	});
    }catch(e) {
    	alert(e);
    }
    if(!added && !existingQuestion){
    	alert("Please select the Questions to be added.")
    }
    if(existingQuestion){
		alert("Selected Question already added.");
    }
    document.getElementById("selcount").innerHTML = "<b>" + selectQCount + "</b>";
}
function removeSelectedQuestions(){
	selectQCount = document.getElementById("chooseqtable").rows.length - 1;
	var givenquestion = document.getElementById("numberquestiongiven").value;
	var subid = document.getElementById("subjectname").value;
	var removed = false;
	try {
        var table = document.getElementById("chooseqtable");
        var rowCount = table.rows.length;
        for(var i=1; i<rowCount; i++) {
            var row = table.rows[i];
            var chkbox = row.cells[0].childNodes[0];
            var qtext = row.cells[1].innerHTML;
            if(null != chkbox && true == chkbox.checked) {
            	if(chkbox.value.indexOf(subid) !== -1){
            	  addRow("selqtable",chkbox.value,qtext); // Add question to left side only when question belongs to selected (category questions loaded on left side) category  
            	}
                table.deleteRow(i);
                rowCount--;
                i--;
                selectQCount--;
                removed = true;
            }
        }
        jQuery('#chooseqtable tr').find('th:first :checkbox').each(function () {
    		jQuery(this).prop('checked', false);
    	});
    }catch(e) {
       alert(e);
    }
    if(removed){
        document.getElementById("asq").disabled = false;
    	jQuery('#asq').css('opacity','1.0');
    	document.getElementById("ssq").disabled = true;
    	jQuery('#ssq').css('opacity','0.6');
    }else{
    	alert("Please select Question to be removed.")
    }
    document.getElementById("selcount").innerHTML = "<b>" + selectQCount + "</b>";
}

function deleteqid(type){
	var tpcid = 0;

	$.post(
		"questionpapertopicaction.do", {
		topicid: tpcid,
		type: type,
		op: "deletequestion"
	},

	function(data) {
		if (data == null) {
			message(container, "Data Not Found...");
		} else {
			d = data.split("$$");
			document.getElementById("selectedtopic").innerHTML = "";
			document.getElementById("selectedQuestions").value = "";
		    document.getElementById("btnaddquestions").disabled = false;
		    jQuery('#btnaddquestions').css('opacity','1.0');
		    document.getElementById("btnaddtopic").disabled = false;
		    jQuery('#btnaddtopic').css('opacity','1.0');
		}
	});
}

function saveSelectedQuestions(){
	jQuery('#testType').val(1);
	var selectQCount = document.getElementById("chooseqtable").rows.length - 1;
	var selectedQIds = "";
	try {
        var table = document.getElementById("chooseqtable");
        var rowCount = table.rows.length;
        for(var i=1; i<rowCount; i++) {
            var row = table.rows[i];
            var chkbox = row.cells[0].childNodes[0];
            if(chkbox.value == undefined){
            	//skip this as header row
            }else{
            	selectedQIds += chkbox.value + ",";
            }
        }
    }catch(e) {
       alert(e);
    }
   // alert('row count >>'+rowCount);
   //alert('test type >>'+document.getElementById("testType").value);
    $.post("questionpapertopicaction.do",
    		{
    			questionsIds : selectedQIds,
    			totalcount : rowCount-1,
    			type: 1, 
    			op : 'showquestion'
    		},
    		function(data) {
    			if (data == null) {
    				message(container, "Data Not Found...");
    			} else {
    				//alert(data);
    				document.getElementById("btnaddtopic").disabled = true;
    				jQuery('#btnaddtopic').css('opacity','0.6');
    				document.getElementById("btnaddquestions").disabled = true;
    				jQuery('#btnaddquestions').css('opacity','0.6');
    				d = data.split("$$");
    	           // alert(d[1]);
    				if (d[2] == 0) {
    					alert("Sorry! you have selected previous topic.");
    					return false;
    				}
    				//alert(d[4]);
    				document.getElementById("selectedQuestions").value = d[4];
    				totalquestioncount = parseInt(d[0],10);
    				document.getElementById("selectedtopic").innerHTML = "<h6>Questions Added to Question Paper</h6>" + d[1];
    				document.getElementById("totalquestioncnt").value = totalquestioncount;
    			    document.getElementById("btnaddquestions").disabled = true;
    			    jQuery('#btnaddquestions').css('opacity','0.6');
    			    document.getElementById("btnaddtopic").disabled = true;
    			    jQuery('#btnaddtopic').css('opacity','0.6');
    			    jQuery("#dialog").dialog('close');
    			}
    });
}


function selectAll(source) {
	var checkedStatus = source.checked;
	jQuery('#selqtable tr').find('td:first :checkbox').each(function () {
		jQuery(this).prop('checked', checkedStatus);
	});
}
function removeAll(source) {
	var checkedStatus = source.checked;
	jQuery('#chooseqtable tr').find('td:first :checkbox').each(function () {
		jQuery(this).prop('checked', checkedStatus);
	});
}
function checkandRemoveQuestions(qid){
	 var table = document.getElementById("chooseqtable");
     var rowCount = table.rows.length;
     for(var i=1; i<rowCount; i++) {
         var row = table.rows[i];
         var chkbox = row.cells[0].childNodes[0];
         if(chkbox.value == undefined){
         	//skip this as header row
         }else{
         	if(chkbox.value == qid)
         		return true;
         }
     }
     return false;
}
