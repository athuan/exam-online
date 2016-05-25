function showDialog() {	
	$("#dialog").dialog({ autoOpen: true, height: 'auto', width: 'auto', modal: true, closeOnEscape:false });
    $("#dialog").dialog('option', 'title', "Complexity");
	$("#dialog").dialog('option', 'show', 'drop');
    $("#dialog").dialog('option', 'resizable', true)
	$("#dialog").html("<p>Complexity: <input type='text' id='levelname' size='30'/></p><p style='text-align: right;'><input type='button' value='Save' onclick='saveLevel();' class='btn_green'></p>");	
	$("#dialog").dialog('open');
}


function showEditDialog(levelid,levelName) {	
	$("#dialog").dialog({ autoOpen: true, height: 'auto', width: 'auto', modal: true, closeOnEscape:false });
    $("#dialog").dialog('option', 'title', "Complexity");
	$("#dialog").dialog('option', 'show', 'drop');
    $("#dialog").dialog('option', 'resizable', true)
	$("#dialog").html("<p>Complexity: <input type='text' value='"+levelName+"' id='newlevelname' size='30'/></p><p style='text-align: right;'><input type='button' value='Save' onclick='editLevel();' class='btn_green'/></p><input type='hidden'id='lvlName' value='"+levelName+"'> <input type='hidden'id='levelid' value="+levelid+">");
	$("#dialog").dialog('open');
}


	function saveLevel()
	{
		var frm=document.forms["LevelForm"];
		var level=document.getElementById("levelname").value;
	
		if(level==""){
			alert("Enter Complexity name!");
			return false;
		}else if(level[0]==" "){
			alert("Do not enter space at beggening!");
			return false;
		}else{
			$.post("Level.do",{ check : "checkLevel" , levelname : level},
				    function(data) {
				if(data=='Found'){
				 alert("Complexity is already exists!");
				}else{
					frm.operation.value="add";
				    frm.level.value=document.getElementById("levelname").value;
				    frm.submit();
				}
			});
			
		}
	}
	function editLevel()
	{
		/*var frm=document.forms["LevelForm"];		
		frm.operation.value="edit";
		var level=document.getElementById("newlevelname").value;
		if(level==""){
			alert("Enter level name");
			return false;
		}else if(level[0]==" "){
			alert("Do not begin with space ");
			return false;
		}else{		
			frm.level.value=document.getElementById("newlevelname").value;
			frm.levelid.value=document.getElementById("levelid").value;
			frm.submit();
		}*/
		var frm=document.forms["LevelForm"];
		var level=document.getElementById("newlevelname").value;
		if(level==""){
			alert("Enter Complexity name!");
			return false;
		}else if(level[0]==" "){
			alert("Do not enter space at beggening!");
			return false;
		}else if(document.getElementById("lvlName").value==level){
			frm.operation.value="edit";
			frm.levelid.value=document.getElementById("levelid").value;
		    frm.level.value=document.getElementById("newlevelname").value;
		    frm.submit();
		}else{
			$.post("Level.do",{ check : "checkLevel" , levelname : level},
				    function(data){
				if(data=='Found'){
				 alert("Complexity is already exists!");
				}else{
					frm.operation.value="edit";
					frm.levelid.value=document.getElementById("levelid").value;
				    frm.level.value=document.getElementById("newlevelname").value;
				    frm.submit();
				}
			});
			
		}
	}
	
	 function dopage(page,op){
		
	     document.forms["LevelForm"].operation.value ="LIST";
         document.forms["LevelForm"].startPage.value = page;
         document.forms["LevelForm"].submit();
     }

	function doSubmit()
	{
		
		var frm=document.forms["LevelForm"];
		frm.submit();
	}
	function doLevelAdd()
	{
		
		document.getElementById("levelname").value="";
		
	}
	function doLevelDelete(levelid)
	{
		
		
		var frm=document.forms["LevelForm"];
		frm.levelid.value=levelid;
		frm.operation.value="delete";
		if(confirm('Do you want to delete this Complexity?'))
			doSubmit();
		
	}
		
	function charsonly(e){
	
	var unicode=e.charCode? e.charCode : e.keyCode
	//if the key isn't the backspace key (which we should allow)
	if(unicode!=8 && unicode!=32 && unicode!=37 && unicode!=38 && unicode!=39 && unicode!=40){
	if (unicode<65||unicode>90 && unicode<97 || unicode>122) //if not a number
	return false //disable key press
	}
}
	
