function showDialog() {
	$("#dialog").dialog({
		autoOpen : true,height : 'auto',width : 'auto',	modal : true,closeOnEscape : false
	});
	$("#dialog").dialog('option', 'title', "Technology");
	$("#dialog").dialog('option', 'show', 'drop');
	$("#dialog").dialog('option', 'resizable', true)
	$("#dialog").html("<p>Technology : <input type='text' size='30' id='technologyname' onkeypress='return charsonly(event)'/></p><p style='text-align: right;'><input type='button' value='Save' onclick='saveTechnology();' class='btn_green'></p>");
	$("#dialog").dialog('open');
}

function showEditDialog(technologyid, technologyName) {
	$("#dialog").dialog({
		autoOpen : true,height : 'auto',width : 'auto',modal : true,closeOnEscape : false
	});
	$("#dialog").dialog('option', 'title', "Technology");
	$("#dialog").dialog('option', 'show', 'drop');
	$("#dialog").dialog('option', 'resizable', true)
	$("#dialog").html("<p>Technology: <input type='text' size='30' value='"+ technologyName+ "' id='newtechnologyname' onkeypress='return charsonly(event)'/></p><p style='text-align: right;'><input type='button' value='Save'  class='btn_green' onclick='editTechnology();'/></p><input type='hidden'id='technologyid' value="+ technologyid + ">");
	$("#dialog").dialog('open');
}
function saveTechnology() {
	var frm = document.forms["TechnologyForm"];
	frm.operation.value = "add";
	var technology = document.getElementById("technologyname").value;
	if (technology == "") {
		alert("Enter Technology Name");
		return false;
	} else if (technology[0] == " ") {
		alert("Do not begin with space ");
		return false;
	} else {
		frm.technology.value = document.getElementById("technologyname").value;
		frm.submit();
	}
}
function editTechnology() {
	var frm = document.forms["TechnologyForm"];
	frm.operation.value = "edit";
	var technology = document.getElementById("newtechnologyname").value;
	if (technology == "") {
		alert("Enter technology name");
		return false;
	} else if (technology[0] == " ") {
		alert("Do not begin with space ");
		return false;
	} else {
		frm.technology.value = document.getElementById("newtechnologyname").value;
		frm.ctechId.value = document.getElementById("technologyid").value;
		frm.submit();
	}
}

function dopage(page, op) {
	document.forms["TechnologyForm"].operation.value = "LIST";
	document.forms["TechnologyForm"].startPage.value = page;
	document.forms["TechnologyForm"].submit();
}

function doSubmit() {
	var frm = document.forms["TechnologyForm"];
	frm.submit();
}
function doTechnologyAdd() {
	document.getElementById("technologyname").value = "";
}
function doTechnologyDelete(technologyid, technology) {
	document.getElementById("technologyName").value = technology;
	var frm = document.forms["TechnologyForm"];
	frm.ctechId.value = technologyid;
	frm.operation.value = "delete";
	if(confirm('Do you want to delete this Technology?')){
		frm.submit();
	}
}
function charsonly(e) {
	var unicode = e.charCode ? e.charCode : e.keyCode
	// if the key isn't the backspace key (which we should allow)
	if (unicode != 8 && unicode != 32 && unicode != 37 && unicode != 38
			&& unicode != 39 && unicode != 40) {
		//if (unicode < 65 || unicode > 90 && unicode < 97 || unicode > 122) // if not a number
		//	return false // disable key press
	}
}