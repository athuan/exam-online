<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="com.kaldin.setting.university.dao.impl.UniversityInfoImplementor"%>
<%@page import="com.kaldin.user.register.dto.PersonalInfoDTO"%>
<%@page import="com.kaldin.user.register.dao.impl.PersonalInfoImplementor"%>
<%@page import="java.util.ArrayList"%>
<%
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>My Profile - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/test/scheduletest.js?dt=19aug2013"></script>
<script type="text/javascript">
var rt_tabOptions = {manualStartup:true};
</script>
<script type="text/javascript">
/* Optional: Temporarily hide the "tabber" class so it does not "flash"
   on the page as plain HTML. After tabber runs, the class is changed
   to "tabberlive" and it will appear. */

document.write('<style type="text/css">.tabber{display:none;}<\/style>');

function showEditDialog1(academicId,qualification,university,passingyear,percentage) {	 
	var frm=document.forms["AcademicInfoForm"];
	frm.qualification.value=qualification;
	frm.university.value=university;
	frm.otherUniversityValue.value="";
	if(university != 'Other')
	frm.otherUniversityValue.value = university;

	if(frm.university.value=='0' || frm.otherUniversityValue.value!=='')
		frm.university.value='Other';
	
	frm.passingYear.value=passingyear;
	frm.percentage.value=percentage;
	frm.academicId.value=academicId;
	frm.operation.value="edit";
	setOtherOption();
	$("#editdialog1").dialog({ autoOpen: true, height: 'auto', width: 'auto', modal: true, closeOnEscape:false });
    $("#editdialog1").dialog('option', 'title', "Edit Academics Details");
	$("#editdialog1").dialog('option', 'show', 'drop');
    $("#editdialog1").dialog('option', 'resizable', true)
	$("#editdialog1").dialog('open');
	   
}

function doAcademicDelete(academicId) {
	var frm=document.forms["AcademicInfoForm"];
	frm.academicId.value=academicId;
	frm.operation.value="delete";
	if(confirm('Do you want to delete this Academics Info?')) {
		frm.submit();
	}
}
function addacademics() {
	 
	var frm=document.forms["AcademicInfoForm"];
	frm.qualification.value="";
	frm.university.value="";
	frm.passingYear.value=null;
	frm.percentage.value=null;
	frm.academicId.value=null;
	frm.operation.value="add";
	
	$("#editdialog1").dialog({ autoOpen: true, height: 'auto', width: 'auto', modal: true, closeOnEscape:false });
    $("#editdialog1").dialog('option', 'title', "Enter Academics Details");
	$("#editdialog1").dialog('option', 'show', 'drop');
    $("#editdialog1").dialog('option', 'resizable', true)
	$("#editdialog1").dialog('open');
}
function showEditDialog2(experienceId,companyName,description,fromDate,toDate) {
	 
	var frm=document.forms["ExperienceInfoForm"];
	frm.companyName.value=companyName;
	frm.description.value=description;
	frm.fromDate.value=fromDate;
	frm.toDate.value=toDate;
	frm.experienceId.value=experienceId;
	frm.operation.value="edit";
	
	document.getElementById("editdialog2").style.display="";
}

function doExperienceDelete(experienceId) {
	var frm=document.forms["ExperienceInfoForm"];
	frm.experienceId.value=experienceId;
	frm.operation.value="delete";
	if(confirm('Do you want to delete this Experience Info?'))	{
		frm.submit();
	}
}


function addexperience() {
	 
	var frm=document.forms["ExperienceInfoForm"];
	frm.companyName.value="";
	frm.description.value="";
	frm.fromDate.value="";
	frm.toDate.value="";
	frm.experienceId.value=null;
	frm.operation.value="add";
    document.getElementById("editdialog2").style.display="";
    if(document.getElementById("info") != null)
      document.getElementById("info").style.display="none";
}


function savePersonal(personalId) {
	if(validatePersonal()){
		var frm=document.forms["PersonalInfoForm"];
		frm.personalId.value=personalId;
		frm.submit();
	}else{
		return false;
	}
}


function validateAcademics() {
	var acValidation = document.getElementById('acdemic');
	
	 if(acValidation.qualification.value.toString()=="0") {
		alert("Select your qualification.");
		acValidation.qualification.focus();
		return false;
    }
	else if(acValidation.university.value.toString()=="0") {
		alert("Select University/Board.");
		acValidation.university.focus();
		return false;
    }else if(acValidation.university.value.toString()=="Other" && acValidation.otherUniversityValue.value.toString()=="") {
		alert("Enter Other University/Board.");
		acValidation.otherUniversityValue.focus();
		return false;
    }
	else if(acValidation.passingYear.value.toString()=="0")	{
		alert("Select passing year.");
		acValidation.passingYear.focus();
		return false;
    }else if(checkEmpty(acValidation.percentage)) {
		alert("Percentage must not be empty.");
		acValidation.percentage.focus();
		return false;
		}
	else if(isNumeric(acValidation.percentage)) {
		alert("Please Enter valid Percentage.");
		acValidation.percentage.focus();
		return false;
	}else if(acValidation.percentage.value>100){
		alert("Please Enter valid Percentage");
		acValidation.percentage.focus();
		return false;
	}
		
	else
	return true;
}
function checkEmpty(object){
 	if(object.value == ""){
  		return true;
  	}
  	return false;
}
function isNumeric(object) {
	if(isNaN(object.value.trim())) {
	    return true;
	}
	else
	return false; 
}
function dateChk(date){
	var regExpre=/^\(?([0-9]{4})\)?[-]?([0-9]{2})[-]?([0-9]{2})$/;
	if(!regExpre.test(date)){
		return true;
	}	
	return false;
}
function dateCmp(from,to){
	/*var str1 = from;
    var str2 = to;
    var yr1  = parseInt(str1.substring(0,4),10);
    var mon1 = parseInt(str1.substring(5,7),10);
    var dt1  = parseInt(str1.substring(8,10),10);
    var date1 = new Date(yr1, mon1-1, dt1);
    var yr2  = parseInt(str2.substring(0,4),10);
    var mon2 = parseInt(str2.substring(5,7),10);
    var dt2  = parseInt(str2.substring(8,10),10);
    var date2 = new Date(yr2, mon2-1, dt2);*/
    var fromDateSplitArr = from.split('-');
    var dt1  = fromDateSplitArr[0];
    var mon1 = fromDateSplitArr[1];
    var yr1  = fromDateSplitArr[2];

    var toDateSplitArr = to.split('-');
    var dt2  = toDateSplitArr[0];
    var mon2 = toDateSplitArr[1];
    var yr2  = toDateSplitArr[2];
    
    var fromDate = new Date(yr1,getMonthFromString(mon1),dt1);  
    var toDate = new Date(yr2,getMonthFromString(mon2),dt2);  
    var result; 
    if(fromDate < toDate) {
    	result = true;
    }
    else {
    	result = false;
    } 
    return result;
}

function getMonthFromString(mon){
	   return new Date(Date.parse(mon +" 1, 2012")).getMonth();
	}

function validateExperience() {
	var expValidation = document.getElementById('experience');

	if(checkEmpty(expValidation.companyName)||
		checkEmpty(expValidation.description)||
		expValidation.fromDate.value==""||
		expValidation.toDate.value=="")
		{
			alert("All fields must be filled.");			
			return false;
		}

	if(!dateCmp(expValidation.fromDate.value,expValidation.toDate.value)){
        alert("To date can not less than from date");
		return false;
	 }

	 return true;
	/*else if(isAlpha(expValidation.companyName)) {
					alert("Company name must be valid.");			
					return false;
			}
	else if(isAlpha(expValidation.description)) {
					alert("Designation must be valid.");				
					return false;
			}
	else  if(dateChk(expValidation.fromDate.value)){
					alert("From date must be valid.");
					return false;
			}
	else if(dateChk(expValidation.toDate.value)){
		    var d = new Date(expValidation.toDate.value);
                    alert(d);
					alert("To date must be valid.");
					return false;
			}
	else if(dateCmp(expValidation.fromDate.value,expValidation.toDate.value)){
		         alert("To date can not less than from date");
					return false;
			 }
	else*/
}



function isAlpha(object)
 {
	var Alphabet = "^[a-zA-Z]+$";				
	var name = object.value;
	name.trim();
	if (name.search(Alphabet) != 0)
	{					
	   	return true;
	    }
	  return false; 
}

function validEmail(object){
	  var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	  if(object.value.match(emailRegEx)){
			return false;
	  } else {
			return true;
	 }
}	

function validatePersonal() {
	var perValidation = document.getElementById('personal');
	if(checkEmpty(perValidation.firstName) || perValidation.firstName.value.trim() == '') {
			alert("First name must be valid.");
			perValidation.firstName.focus();
			return false;
	}else if(checkEmpty(perValidation.lastName)|| perValidation.lastName.value.trim() == '') {
		alert("Last name must be valid.");
		perValidation.lastName.focus();
		return false;
	}else if(checkEmpty(perValidation.emailId) || validEmail(perValidation.emailId)) {
		alert("Please enter valid email.");
		perValidation.emailId.focus();
		return false;
	}/*else if(!checkEmpty(perValidation.mobileNumber)){
		if(isNumeric(perValidation.mobileNumber)) {
			alert("Mobile number must be valid.");
			perValidation.mobileNumber.focus();
			return false;
		}else
			return true;
	}else if(!checkEmpty(perValidation.phoneNumber)){
		if(isNumeric(perValidation.phoneNumber)) {
			alert("Phone number must be valid.");
			perValidation.phoneNumber.focus();
			return false;
		}else
			return true;
	}*/else {
		return true;
	}
}


var state;
 <%if (request.getAttribute("var") == null) {%>
             state = "0";
            <%} else {%>
             state =<%=request.getAttribute("var")%>
           <%}%>

           
window.onload=function tabshow()
 { 
   var div = document.getElementById('mytab1');
         rt_tabAutomatic(div);

        if(state=="0" )
       {            
	     document.getElementById('mytab1').rt_tab.tabShow(0);
       }
       else
       {
    	   document.getElementById('mytab1').rt_tab.tabShow(state); 
        }	 
}

function setState(stateId){
	var frm = document.forms["PersonalInfoForm"]; 
	var countryId = frm.country.value;
	$.post("showstate.do", {
		companyId : countryId,
		stateId  : stateId
	}, function(data) {
		if (data == null) {
			message(container, "User haven't added their details");
		} else {
			//
			document.getElementById("state").innerHTML =data;
		}
	});
}

function setOtherOption(){	
	var acValidation = document.getElementById('acdemic');	
	if(acValidation.university.value.toString()=='Other'){
		document.getElementById("otherValueID").style.display="";
	}else{
		document.getElementById("otherValueID").style.display="none";
	}
}
</script>
<style type="text/css">
.back {
	background-color: red;
}

.ui-datepicker {
	width: 17em;
	padding: .2em .2em 0;
	z-index: 9999 !important;
}
</style>
</head>
<body>
	<%
		UniversityInfoImplementor uniInfoImplementor = new UniversityInfoImplementor();
		List<?> uniList = (List<?>) uniInfoImplementor.getUniversityList();
		session.setAttribute("universityList", uniList);
	%>

	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
		<!--HEADER ENDS HERE-->
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/userhome.do">Scheduled Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/loadtest.do">Given Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/callCandidateProfile.do" class="active">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/calluserchangepass.do">Change Password</a></li>
				</ul>
				<div class="sidebar_note message note"><p>You may add, edit/update your Personal, Academics and Experience details for your profile.</p></div>
			</div>
				<logic:present name="message">
			<p class="message info">
					<bean:write name="message" filter="true" />
			</p>
				</logic:present>
				
			<div id="main">
			<h3>My Profile</h3>
			<hr />
				<div id="basic-modal-content">
					<div align="center">

						<div id="editdialog1" style="display: none;">
							<html:form action="/academicInfo" styleId="acdemic">

								<table>
									<tr>
										<td><label>Qualification: </label></td>
										<td><html:select property="qualification"
												styleId="qualificationId">
												<%@ include file="/jsp/common/course.jsp"%>
											</html:select></td>
									</tr>
									<tr>
										<td><label> University/Board:</label></td>
										<td><html:select property="university" onchange="setOtherOption();">
												<html:option value="0">Select</html:option>
												<logic:iterate id="unilist" name="universityList">
													<html:option value="${unilist.universityName}">${unilist.universityName}</html:option>
												</logic:iterate>
												<optgroup label="Other"></optgroup>
												<html:option value="Other">Other</html:option>
											</html:select></td>
									</tr>
									<tr id="otherValueID" style="display:none;">
										<td><label> Other:</label></td>
										<td><html:text property="otherUniversityValue"/></td>
									</tr>
									<tr>
										<td><label> Yearing of Passing:</label></td>
										<td><html:select property="passingYear">
												<html:option value="0">Year</html:option>
												<%
													for (int iterator = 1960; iterator <= cal.get(Calendar.YEAR); iterator++) {
												%>
												<html:option value="<%= String.valueOf(iterator) %>">
													<%=iterator%>
												</html:option>
												<%
													}
												%>
											</html:select></td>
									</tr>
									<tr>
										<td><label> Percentage:</label></td>
										<td><html:text property="percentage"
												onkeypress="return isNumberKey(event);" /> <html:hidden
												property="operation"></html:hidden> <html:hidden
												property="academicId"></html:hidden></td>
									</tr>
									<tr>
										<td colspan="2" align="right"><html:submit value="Save"
												onclick="return validateAcademics();" styleClass="btn_green"/></td>
									</tr>
								</table>
							</html:form>
						</div>

						

						<div id="editdialog3" style="display: none;">
							<html:form action="/techInfo" styleId="tech">
								<table>
									<tr>
										<td><label> Technology:</label></td>
										<td><html:select property="technology">
												<option>Select</option>
												<logic:present name="TechList">
													<logic:iterate id="tech" name="TechList">
														<option value="${tech.technology}">${tech.technology}</option>
													</logic:iterate>
												</logic:present>
											</html:select></td>
									</tr>
									<tr>
										<td><label>Skills:</label></td>
										<td><html:select property="skills">
												<option value="Select">Select</option>
												<option value="Basic">Basic</option>
												<option value="Intermediate">Intermediate</option>
												<option value="Expert">Expert</option>
											</html:select></td>
									</tr>
									<tr>
										<td colspan="2" align="right"><html:hidden property="operation"></html:hidden> <html:hidden
												property="techId"></html:hidden>
										<html:submit value="Save"
												onclick="return validateTechnology();" styleClass="btn_green"/></td>
									</tr>
								</table>
							</html:form>
						</div>

						<div id="editdialog4" style="display: none;">
							<html:form action="/techInfo" styleId="tech1">
								<html:form action="/techInfo" styleId="tech">
									<table>
										<tr>
											<td><label> Technology:</label></td>
											<td><html:select property="technology">
													<option>Select</option>
													<logic:present name="TechList">
														<logic:iterate id="tech" name="TechList">
															<option value="${tech.technology}">${tech.technology}</option>
														</logic:iterate>
													</logic:present>
												</html:select></td>
										</tr>
										<tr>
											<td><label>Skills:</label></td>
											<td><html:select property="skills">
													<option value="Select">Select</option>
													<option value="Basic">Basic</option>
													<option value="Intermediate">Intermediate</option>
													<option value="Expert">Expert</option>
												</html:select></td>
										</tr>
										<tr>
											<td><html:hidden property="operation"></html:hidden> <html:hidden
													property="techId"></html:hidden></td>
											<td><html:submit value="Save"
													onclick="return editValidateTechnology();" styleClass="btn_green"/></td>
										</tr>
									</table>

								</html:form>
							</html:form>
						</div>

					</div>
				</div>


				<div class="rt_tab" id="mytab1">
					<div class="rt_tabtab">
						<div id="fill_info">
							<h2>Personal</h2>
							<html:form action="/personalInfo" styleId="personal">
								<logic:present name="PUsersDetail">
									<h3>fill your details</h3>
									<table>
										<tbody>
											<logic:iterate id='userdetail' name='PUsersDetail'>
												<tr>
													<td><label>Name:</label></td>
													<td colspan="3">
														<html:select property="title" value="${userdetail.title}">
															<html:option value="Mr.">Mr.</html:option>
															<html:option value="Mrs.">Mrs.</html:option>
															<html:option value="Miss.">Miss.</html:option>
														</html:select>
														<html:text property="firstName" value="${userdetail.firstName}" placeholder="First Name" />
													 	<html:text property="lastName" value="${userdetail.lastName}" placeholder="Last Name" /><span class="mandatory">*</span>
													</td>
												</tr>
												<tr>
													<td><label>address 1:</label></td>
													<td><html:text property="address1"
															value="${userdetail.address1}" /> </td>
													<td><label>address 2:</label></td>
													<td><html:text property="address2"
															value="${userdetail.address2}" /> </td>
												</tr>
												<tr>
													<td><label>Country:</label></td>
													<td><logic:present name="CountryList">
															<html:select property="country"
																value="${userdetail.country}" onchange="setState('')" style="width :193px;">
																<logic:iterate id="Country" name="CountryList">
																	<html:option value='${Country.countryId}'
																		 >${Country.countryName}</html:option>
																</logic:iterate>
															</html:select>
														</logic:present> 
													</td>

													<td><label>state:</label></td>

													<td>
														<span id="state">
															<select style="width: 193px;">
																<option>Select State:</option>
															</select>
														</span>
														
													</td>

												</tr>
												<script type="text/javascript">setState(${userdetail.state});</script>
												<tr>
													<td><label>city:</label></td>
													<td><html:text property="city"
															value="${userdetail.city}" /> 
													</td>



													<td><label>Email ID:</label></td>
													<td><html:text property="emailId"
															value="${userdetail.emailId}" readonly="true"/> <span class="mandatory">*</span>
													</td>
												</tr>
												<tr>

													<td><label>Mobile number:</label></td>
													<td>
													<logic:equal name="userdetail" property="mobileNumber" value="0">
														<html:text property="mobileNumber" value="" />
													</logic:equal>
													<logic:notEqual name="userdetail" property="mobileNumber" value="0">
														<html:text property="mobileNumber" value="${userdetail.mobileNumber}" />
													</logic:notEqual> 
													</td>


													<td><label>birth date:</label></td>
													<td>
													<html:text property="birthdate" styleId="bdate"
															value='${birthdate }' readonly="true" /> <script
															type="text/javascript">
							$(document).ready(function() {										
							$("#bdate").datepicker({dateFormat: 'dd-M-yy',showOn: 'both', buttonImage: 'images/cal.png',changeMonth: true , buttonImageOnly: true,changeYear: true,yearRange: '1950:2021',maxDate:-0});										
							});
							</script> <html:hidden property="operation" value="edit"></html:hidden> <html:hidden
															property="personalId"></html:hidden></td>
												</tr>
												<tr>
													<td><label>Telephone No:</label></td>
													<td>
													<logic:equal name="userdetail" property="phoneNumber" value="0">
														<html:text property="phoneNumber" value="" />
													</logic:equal>
													<logic:notEqual name="userdetail" property="phoneNumber" value="0">
														<html:text property="phoneNumber" value="${userdetail.phoneNumber}" />
													</logic:notEqual>
													</td>
													<td></td>
													<td></td>
												</tr>
											</logic:iterate>
										</tbody>
									</table>
									<center>
									<html:submit value="Save"
												onclick="return savePersonal(${userdetail.personalId});" styleClass="btn_green"/>
										<!-- <button class="btn_green" type="subm" onclick="savePersonal(${userdetail.personalId});">Save</button> -->
									</center>
								</logic:present>

								<logic:notPresent name="PUsersDetail"><p class="message invalid">No Record Present.</p> 
            						<h3>fill your details</h3>
									<table class="display">
										<thead>
											<tr>
												<th colspan="4" scope="col">Personal Details</th>
												<!--<th scope="col">Page Actions</th>-->
											</tr>
										</thead>

										<tbody>
											<tr>
												<td><label>first name:</label></td>
												<td colspan="3">
													<html:select property="title">
														<html:option value="Mr.">Mr.</html:option>
														<html:option value="Mrs.">Mrs.</html:option>
														<html:option value="Miss.">Miss.</html:option>
													</html:select>
													<html:text property="firstName" placeholder="First Name" />
												 	<html:text property="lastName" placeholder="Last Name" /><span class="mandatory">*</span>
												</td>
											</tr>
											<tr>
												<td><label>address 1:</label></td>
												<td><html:text property="address1" value="" /> 
												</td>

												<td><label>address 2:</label></td>
												<td><html:text property="address2" value="" /> 
												</td>

											</tr>
											<tr>
												<td><label>Country:</label></td>
												<td><logic:present name="CountryList">
														<html:select value="239" property="country" 
															onchange="setState('')" style="width : 193px;">
															<logic:iterate id="Country" name="CountryList">
																<html:option value='${Country.countryId}'
																	>${Country.countryName}</html:option>
															</logic:iterate>
														</html:select>
													</logic:present> 
												</td>

												<td><label>State:</label></td>

												<td>
													<span id="state">
														<select style="width: 193px;">
															<option>Select State:</option>
														</select>
													</span>
												</td>
											</tr>
											<script type="text/javascript">setState(0);</script>
											<tr>
												<td><label>city:</label></td>
												<td><html:text property="city" value="" /> 
												</td>
												<td><label>Email ID:</label></td>
												<td><html:text property="emailId" value="${LogedUser}" readonly="true"/> <span class="mandatory">*</span>
												</td>

											</tr>
											<tr>
												<td><label>Mobile number:</label></td>
												<td><html:text property="mobileNumber" value="" /> 
												</td>

												<td><label>birth date:</label></td>
												<td><html:text property="birthdate" styleId="bdate"
														value="${userdetail.birthdate}" readonly="true" /> <script
														type="text/javascript">
							$(document).ready(function() {										
							$("#bdate").datepicker({dateFormat: 'dd-M-yy',showOn: 'both', buttonImage: 'images/cal.png',changeMonth: true , buttonImageOnly: true,changeYear: true,yearRange: '1950:2021'});										
							});
							</script> <html:hidden property="operation" value="add"></html:hidden> <html:hidden
														property="personalId"></html:hidden> </td>


											</tr>
											<tr>
												<td><label>Telephone No:</label></td>
												<td><html:text property="phoneNumber" value="" />
												</td>

												<td></td>
												<td></td>
											</tr>
										</tbody>

									</table>
								<p style="text-align: center;">
								<button class="btn_green"  onclick="return savePersonal(${userdetail.personalId});">Save</button>
										<!--<html:submit value="Save"
												onclick="return savePersonal(${userdetail.personalId});" styleClass="btn_green"/>-->
									</p>
								</logic:notPresent>
							</html:form>
						</div>
						<!-- INFO ENDS HERE -->
					</div>

					<div class="rt_tabtab">
						<div id="fill_info">
							<h2>Academics</h2>
							<logic:present name="AUsersDetail">
								<table class="display">
									<thead>
										<tr>
											<th scope="col">Qualification</th>
											<th scope="col">University/Board</th>
											<th scope="col">Passing Year</th>
											<th scope="col">Percentage</th>
											<th scope="col">Edit</th>
											<th scope="col">Delete</th>
										</tr>
									</thead>
									<tbody>
										<logic:iterate id='userdetail' name='AUsersDetail'>
											<tr>
												<td>${userdetail.qualification}</td>
												<td>${userdetail.university}</td>
												<td>${userdetail.passingYear}</td>
												<td>${userdetail.percentage}</td>
												<td width="10%"><a href="#"
													onclick="showEditDialog1(${userdetail.academicId},'${userdetail.qualification}','${userdetail.university}','${userdetail.passingYear}','${userdetail.percentage}');">
														<img src="<%=request.getContextPath()%>/images/edit.png"
														title="Edit">
												</a></td>
												<td width="10%"><a href="#" class='basicDelete'
													onclick="return doAcademicDelete(${userdetail.academicId});">
														<img src="<%=request.getContextPath()%>/images/delete.png"
														title="Delete">
												</a></td>
											</tr>
										</logic:iterate>
									</tbody>
								</table>
								<p style="text-align: center;">
								<button class="btn_green" onclick="addacademics();">add more</button>
								</p>
							</logic:present>
							<logic:notPresent name="AUsersDetail"><p class="message invalid">No Record Present.</p> 
         						 <center>
									<button class="btn_green" onclick="addacademics();">
										<span>Add</span>
									</button>
								</center>
							</logic:notPresent>
						</div>
					</div>
					<!-- TAB TABBER 1 ENDS HERE-->

					<div class="rt_tabtab">
						<div id="fill_info">
							<h2>Experience</h2>
							
							<div id="editdialog2" style="display: none;">
							<html:form action="/experienceInfo" styleId="experience">
								<table class="display">
									<tr>
										<td><label>Company Name: </label></td>
										<td><html:text property="companyName" /></td>
										<td><label> Designation: </label></td>
										<td><html:text property="description" /></td>
									</tr>
									<tr>
										<td><label> From Date:</label></td>
										<td><html:text property="fromDate" styleId="fromdate"
												readonly="true" /> <script type="text/javascript">
							$(document).ready(function() {										
							$("#fromdate").datepicker({dateFormat: 'dd-M-yy',showOn: 'both', buttonImage: 'images/cal.png',changeMonth: true , buttonImageOnly: true,changeYear: true,yearRange: '1950:2021',
								maxDate:-0,
								onSelect: function (date) {
					                var date2 = $('#fromdate').datepicker('getDate');
					                date2.setDate(date2.getDate() + 1);
					                $('#todate').datepicker('setDate', date2);
					                //sets minDate to dt1 date + 1
					                $('#todate').datepicker('option', 'minDate', date2);
					            }});										
							});
							</script></td>
										<td><label>To Date:</label></td>
										<td><html:text property="toDate" styleId="todate"
												readonly="true"></html:text> <script
												type="text/javascript">
							$(document).ready(function() {										
							$("#todate").datepicker({dateFormat: 'dd-M-yy',showOn: 'both', buttonImage: 'images/cal.png',changeMonth: true , buttonImageOnly: true,changeYear: true,yearRange: '1950:2021',maxDate:-0,
								onClose: function () {
					                var dt1 = $('#fromdate').datepicker('getDate');
					                var dt2 = $('#todate').datepicker('getDate');
					                var diff = (dt2 - dt1)/1000/60/60/24;
					                if (diff < 0) {
					                    alert("To Date can't be less than From Date");
					                    dt1.setDate(dt1.getDate() + 30);
					                    $('#todate').datepicker('setDate', dt1);
					                }
					            }	
							});										
							});
							</script></td>
									</tr>
									<tr>
										<td colspan="4" align="right"><html:hidden property="operation"></html:hidden> <html:hidden
												property="experienceId"></html:hidden>
										<html:submit value="Save"
												onclick="return validateExperience();" styleClass="btn_green"/></td>
									</tr>
								</table>
							</html:form>
						</div>
							<logic:present name="EUsersDetail">
								<table class="display">
									<thead>
										<tr>
											<th scope="col">Company Name</th>
											<th scope="col">Description</th>
											<th scope="col">From Date</th>
											<th scope="col">To Date</th>
											<th scope="col">Edit</th>
											<th scope="col">Delete</th>

										</tr>
									</thead>
									<tbody>
										<logic:iterate id='userdetail' name='EUsersDetail'>
											<bean:define id="newfromDate" name="userdetail" property="fromDate" />
											<bean:define id="newtoDate" name="userdetail" property="toDate" />
											<tr>
												<td>${userdetail.companyName}</td>
												<td>${userdetail.description}</td>
												<td><%= new SimpleDateFormat("dd-MMM-yyyy").format(newfromDate) %></td>
												<td><%= new SimpleDateFormat("dd-MMM-yyyy").format(newtoDate) %></td>
												<td width="10%"><a href="#"
													onclick="showEditDialog2(${userdetail.experienceId},'${userdetail.companyName}','${userdetail.description}','<%= new SimpleDateFormat("dd-MMM-yyyy").format(newfromDate) %>','<%= new SimpleDateFormat("dd-MMM-yyyy").format(newtoDate) %>');">
														<img src="<%=request.getContextPath()%>/images/edit.png"
														title="Edit">
												</a></td>
												<td width="10%"><a href="#" class='basicDelete'
													onclick="return doExperienceDelete('${userdetail.experienceId}');">
														<img src="<%=request.getContextPath()%>/images/delete.png"
														title="Delete">
												</a></td>
											</tr>
										</logic:iterate>
									</tbody>
								</table>
									<p style="text-align: center;"><button class="btn_green" onclick="addexperience();">Add More</button></p>
							</logic:present>

							<logic:notPresent name="EUsersDetail">
							<p id="info" class="message invalid">No Record Present.</p>
          						<center>
									<button class="btn_green" onclick="addexperience();">
										<span>Add</span>
									</button>
								</center>
							</logic:notPresent>
						</div>
					</div>
					<!-- TAB TABBER 2 ENDS HERE-->

					<!-- TAB TABBER 3 ENDS HERE -->

					
					<!-- TAB TABBER 4 ENDS HERE-->
				</div>
				<!--RT_TABBER SECTION ENDS HERE-->
			</div>
		</div>
</div>
<script>
setOtherOption();
</script>
<script type="text/javascript" charset="utf-8">				
	$(document).ready(function() {			
		Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });			
	} );
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>