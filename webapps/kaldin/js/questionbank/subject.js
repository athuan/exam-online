function savesubject()
{	
	alert("notepad");
}
	
function editsubject()
{
	var frm=document.forms[1];		
	frm.operation.value="edit";
	var sub=document.getElementById("newsubjectname").value;
	if(sub==""){
		alert("Subject can not be blank !");
		return false;
	}else if(sub[0]==" "){
		alert("Do not enter space at begining !");
		return false;
	}else{
		frm.subjectName.value=sub;
		frm.submit();
	}
}

function dopage(page,op){
	
    <logic:present name="search">
    	document.forms[0].operation.value ="LIST";
    	document.forms[0].startPage.value = page;
    	document.forms[0].submit();

    </logic:present>
    <logic:notPresent name="search">
    	document.forms[1].operation.value ="LIST";
    	document.forms[1].startPage.value = page;
    	document.forms[1].submit();
    </logic:notPresent>
}

function doSubmit()
{
	var frm=document.forms[1];
	frm.submit();
}

function doSubjectAdd()
{	
	document.getElementById("subName").value="";	
}


	
function showBlank(block){
		if(block=='help'){
			document.getElementById("help").style.display='block';
		}
		
	}
function callhide(elmId){
		var objDiv =  document.getElementById(elmId)
		if(objDiv.style.display == 'block'){
			objDiv.style.display='none';
		}else{
			objDiv.style.display='block';
		}
	}
function charsonly(e){
	var unicode=e.charCode? e.charCode : e.keyCode
	if (unicode!=8 && unicode!=43 && unicode!=35 && unicode!=32 && unicode!=37 && unicode!=38 && unicode!=39 && unicode!=40 &&  unicode!=127 && unicode!=46 && (unicode<65||unicode>90) && (unicode<97 || unicode>122)){ //if the key isn't the backspace key (which we should allow)
		return false // disable key press
	}
}