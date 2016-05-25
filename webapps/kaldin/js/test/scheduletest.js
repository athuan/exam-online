
function selectAll() {
	frm = document.forms["ScheduleTestForm"];
	if (document.getElementById("chkselectAll").checked == true) {
		CheckBoxArray = frm.userId;
		for (i = 0; i < CheckBoxArray.length; i++) {
			CheckBoxArray[i].checked = true;
		}
	} else {
		CheckBoxArray = frm.userId;
		for (i = 0; i < CheckBoxArray.length; i++) {
			CheckBoxArray[i].checked = false;
		}
	}
}

function showCertificateOption(){
	if (document.getElementById("iscertificateenabled") != null) {
		if (document.getElementById("iscertificateenabled").value == 0)
			document.getElementById("certselection").style.display = 'none';
		else
			document.getElementById("certselection").style.display = '';
	}
}
var getProperty = function (propertyName) {
    return certificate[propertyName];
};
function getPreview(){
	var id = document.getElementById("selectcertificateId").value; 
	window.open("certpdfs/"+getProperty("a"+id), "Preview Certificate", "width=700px, height=600px,scrollbars=yes, center=yes");
}

