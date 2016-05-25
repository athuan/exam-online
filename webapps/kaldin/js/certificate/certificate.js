function setCertificateTitle(){
	var status = document.getElementById("showCertTitle").checked;
	if(status){
		document.getElementById("certificatetitle").style.display = '';
		document.getElementById("showCertTitle").value = "0";
	}
	else{
		document.getElementById("certificatetitle").style.display = 'none';
		document.getElementById("showCertTitle").value = "1";
	}
}
function setCandidateName(){
	var status = document.getElementById("showCandName").checked;
	if(status){
		document.getElementById("candidatename").style.display = '';
		document.getElementById("showCandName").value = "0";
	}
	else{
		document.getElementById("candidatename").style.display = 'none';
		document.getElementById("showCandName").value = "1";
	}
}
function setMessage(){
	var status = document.getElementById("showMessage1").checked;
	if(status){
		document.getElementById("message1").style.display = '';
		document.getElementById("showMessage1").value = "0";
	}
	else{
		document.getElementById("message1").style.display = 'none';
		document.getElementById("showMessage1").value = "1";
	}
}
function setExamName(){
	var status = document.getElementById("showExamname").checked;
	if(status){
		document.getElementById("examname").style.display = '';
		document.getElementById("showExamname").value = "0";
	}
	else{
		document.getElementById("examname").style.display = 'none';
		document.getElementById("showExamname").value = "1";
	}
}
function setExamResult(){
	var status = document.getElementById("showResult").checked;
	if(status){
		document.getElementById("result").style.display = '';
		document.getElementById("showResult").value = "0";
	}
	else{
		document.getElementById("result").style.display = 'none';
		document.getElementById("showResult").value = "1";
	}
}
function setMessage2(){
	var status = document.getElementById("showMessage2").checked;
	if(status){
		document.getElementById("message2").style.display = '';
		document.getElementById("showMessage2").value = "0";
	}
	else{
		document.getElementById("message2").style.display = 'none';
		document.getElementById("showMessage2").value = "1";
	}
}
function setLogoStatus(){
	var status = document.getElementById("showLogo").checked;
	if(status){
		document.getElementById("logo").style.display = '';
		document.getElementById("showLogo").value = "0";
	}
	else{
		document.getElementById("logo").style.display = 'none';
		document.getElementById("showLogo").value = "1";
	}
}
function setExamDate(){
	var status = document.getElementById("showExamdate").checked;
	if(status){
		document.getElementById("examdate").style.display = '';
		document.getElementById("showExamdate").value = "0";
	}
	else{
		document.getElementById("examdate").style.display = 'none';
		document.getElementById("showExamdate").value = "1";
	}
}
function setBackgroundimage(imagename, cbid){
	var urlString = "url('certificateimg/" + imagename + "')";
	document.getElementById("lcs").style.backgroundImage = urlString;
	document.getElementById("cbid").value = cbid;
	$('.right_certificate_section li img').not(this).removeClass('current');
	$("#bg"+cbid).addClass('current');
}

function setValues(){
	if(document.getElementById("showExamdate").value == "1"){
		document.getElementById("showExamdate").checked = false;
		document.getElementById("examdate").style.display = 'none';
	}
	if(document.getElementById("showLogo").value == "1"){
		document.getElementById("showLogo").checked = false;
		document.getElementById("logo").style.display = 'none';
	}
	if(document.getElementById("showMessage2").value == "1"){
		document.getElementById("showMessage2").checked = false;
		document.getElementById("message2").style.display = 'none';
	}
	if(document.getElementById("showResult").value == "1"){
		document.getElementById("showResult").checked = false;
		document.getElementById("result").style.display = 'none';
	}
	if(document.getElementById("showExamname").value == "1"){
		document.getElementById("showExamname").checked = false;
		document.getElementById("examname").style.display = 'none';
	}
	if(document.getElementById("showMessage1").value == "1"){
		document.getElementById("showMessage1").checked = false;
		document.getElementById("message1").style.display = 'none';
	}
	if(document.getElementById("showCandName").value == "1"){
		document.getElementById("showCandName").checked = false;
		document.getElementById("candidatename").style.display = 'none';
	}
	if(document.getElementById("showCertTitle").value == "1"){
		document.getElementById("showCertTitle").checked = false;
		document.getElementById("certificatetitle").style.display = 'none';
	}
}
function setLogo(logoname){
	var urlString = "url('uploads/logos/" + logoname + "')";
	document.getElementById("logo").style.backgroundImage = urlString;
	document.getElementById("uplogo").value = logoname;
}
function showLogoupload(){
	$("#dialog").dialog({modal: true});
}
function showResponse(responseText, statusText, xhr, $form){
	setLogo(responseText);
	$("#dialog").dialog('close');
	document.getElementById("uplogo").value = responseText;
}

function validate(){
	var tempName = document.getElementById("templatename").value;
	if (tempName == null || tempName == "" ){
		alert("Please enter the Certificate Name");
		document.getElementById("templatename").focus();
		return false;
	}else
		return true;
}

function setNewValues(){
	document.getElementById("showCertTitle").checked = true;
	document.getElementById("showCertTitle").value = "0";
	document.getElementById("showCandName").checked = true;
	document.getElementById("showCandName").value = "0";
	document.getElementById("showMessage1").checked = true;
	document.getElementById("showMessage1").value = "0";
	document.getElementById("showExamname").checked = true;
	document.getElementById("showExamname").value = "0";
	document.getElementById("showResult").checked = true;
	document.getElementById("showResult").value = "0";
	document.getElementById("showMessage2").checked = true;
	document.getElementById("showMessage2").value = "0";
	document.getElementById("showLogo").checked = true;
	document.getElementById("showLogo").value = "0";
	document.getElementById("showExamdate").checked = true;
	document.getElementById("showExamdate").value = "0";
}
function setPosition(position){
	document.getElementById("logo").style.backgroundPosition = position;
	document.getElementById("logoPosition").value = position;
}
function showBackgroundupload(){
	$("#backgrounddialog").dialog({modal: true, width: 400, height: 225});
}
function showBackground(responseText, statusText, xhr, $form){
	if(responseText == "Error"){
		alert("Problem while uploading background image or invalid image format selected");
	}else{
		var res = responseText.split("$$");
		setBackgroundimage(res[0],res[1]);
	}
	document.getElementById("backgroundimg").value = "";
	$(".progress").hide();
	$("#backgrounddialog").dialog('close');
}
function setcursor(){
	$(nicEditors.findEditor("messageone").elm).focus();
}
function deleteBGimage(cbid){
	if(confirm('Are you sure you want to delete the Background Image?')){
		document.getElementById("dbg").value = cbid;
		document.forms["deletebg"].submit();
	}
}