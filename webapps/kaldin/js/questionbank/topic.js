

function ReplaceAll(Source,stringToFind,stringToReplace){

	  var temp = Source;
	    var index = temp.indexOf(stringToFind);
	        while(index != -1){
	            temp = temp.replace(stringToFind,stringToReplace);
	            index = temp.indexOf(stringToFind);
	        }

	        return temp;

	}

function showEditDialog(topicId,topicName) {
	
	showDialog('edit');
	var frm=document.forms[0];
	var frm1=document.forms[1];
	frm.topicName.value=topicName;
	document.getElementById("topicname").value = topicName;
	//frm.operation.value="edit";
	
	frm.topicId.value=topicId;
	
	frm.topicId.value=topicId;
	frm.operation.value="edit";
	document.getElementById("category").style.display = 'none';
	
	
	/*topicName = ReplaceAll(topicName,"+"," ");
	$("#dialog").dialog({ autoOpen: true, height: 'auto', width: 'auto', modal: true, closeOnEscape:false });
    $("#dialog").dialog('option', 'title', "Question Sub Category");
	$("#dialog").dialog('option', 'show', 'drop');
    $("#dialog").dialog('option', 'resizable', true)
	$("#dialog").html("<p><input type='text' value='"+topicName+"' id='newtopicname' size='30' onkeypress='return charsonly(event)' /></p><p style='text-align: right;'><input type='button' value='Save' onclick='editTopic();' class='btn_green'/></p><input type='hidden'id='topicId' value="+topicId+">");

	$("#dialog").dialog('open');*/
}


getTopic=function(page)
{
	var subid=document.getElementById("subject").value;	
	if(page==""){
	$.post("Topic.do?click='true'",{subjectId:subid,op:"getTopic",spage:page},
			  function(data){
			  	if(data == null){
			  		message(container, "Data Not Found...");
			  	} else {
			  		d = data.split("@");
			  		//document.getElementById("mypage").innerHTML=d[0];
			  		document.getElementById("contentTable").innerHTML=d[1];		  
			  	}
	});
	}
	else{
		$.post("Topic.do",{subjectId:subid,op:"getTopic",spage:page},
			  function(data){
			  	if(data == null){
			  		message(container, "Data Not Found...");
			  	} else {
			  		d = data.split("@");
			  		//document.getElementById("mypage").innerHTML=d[0];
			  		document.getElementById("contentTable").innerHTML=d[1];		  
			  	}
	});
	}
}

	function saveTopic()
	{
		var topic=document.getElementById("topicname").value;
		if(topic==""){
			alert("Enter Sub-Category name! ");
			return false;
		}else if(topic[0]==" "){
			alert("Do not enter space at beggening! ");
			return false;
		}else {
			$.post("Topic.do", {
				check : "checktopic",
				topicname : topic
			},
				function(data) {
					if (data == 'Found') {
						alert("Sub Category already exists");
					} else {
						var frm=document.forms["TopicForm"];
						//frm.operation.value="add";
						if(frm.operation.value == 'add'){
							frm.subjectId.value=document.getElementById("subjectname").value;
						}
						
						frm.topicName.value=topic;
						frm.questionRedirect.value=false;
						frm.submit();
					}
				});
		}
	}
	function editTopic()
	{

		var topic=document.getElementById("newtopicname").value;
		if(topic==""){
			alert("Enter Sub-Category name! ");
			return false;
		}else if(topic[0]==" "){
			alert("Do not enter space at beggening! ");
			return false;
		}else {
			$.post("Topic.do", {
				check : "checktopic",
				topicname : topic
			},
				function(data) {
					if (data == 'Found') {
						alert("Sub Category already exists");
					} else {
						var frm=document.forms["TopicForm"];		
						frm.operation.value="edit";
						frm.topicName.value=topic;
						frm.topicId.value=document.getElementById("topicId").value;
						frm.submit();
					}
				});
		}
	}
	
	 function dopage(page,op){
		
	     document.forms[0].operation.value ="LIST";
         document.forms[0].startPage.value =page;
         document.forms[0].submit();
     }

	 function dopageOne(page,op){
			
	     document.forms["TopicForm"].operation.value ="LIST";
         document.forms["TopicForm"].startPage.value =page;
         getTopic(page);
     }
	function doSubmit()
	{
		
		var frm=document.forms["TopicForm"];
		frm.submit();
	}
	function doTopicAdd()
	{
		
		document.getElementById("topicName").value="";
		
	}
	
	function doTopicDelete(topicid)
	{
		var frm=document.forms["TopicForm"];
		frm.topicId.value=topicid;
		frm.operation.value="delete";
		if(confirm('Do you want to delete this Sub Category?')){
			doSubmit();
	}
	}
		
	function charsonly(e){
	var unicode=e.charCode? e.charCode : e.keyCode
	if (unicode!=8 && unicode!=43 && unicode!=35 && unicode!=32 && unicode!=37 && unicode!=38 && unicode!=39 && unicode!=40 &&  unicode!=127 && unicode!=46 && (unicode<65||unicode>90) && (unicode<97 || unicode>122) && (unicode<48||unicode>57) && (unicode<96 || unicode>105)){ //if the key isn't the backspace key (which we should allow)
		return false //disable key press
	}
}
