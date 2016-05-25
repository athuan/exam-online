<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.kaldin.setting.university.dao.impl.UniversityInfoImplementor"%>
<%
	Calendar cal = Calendar.getInstance();
	cal.setTime(new Date());
%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Academics - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript">
	function hidemessage() {
		document.getElementById("messagep").style.display = "none";
	}
	function doSubmit() {
		document.forms[0].operation.value = "next";
		document.forms[0].submit();
	}
	function addToDB() {
		document.forms[0].operation.value = "addToDB";
		document.forms[0].submit();
	}
	function validate() {
		if (checkEmpty(document.AcademicInfoForm.percentage)) {
			alert("Manaditory fields must not be empty");
			document.AcademicInfoForm.percentage.focus();
			return false;
		} else if (document.AcademicInfoForm.qualification.value.toString() == "0") {
			alert("Select your qualification");
			document.AcademicInfoForm.qualification.focus();
			return false;
		} else if (document.AcademicInfoForm.university.value.toString() == "0") {
			alert("Select University/Board");
			document.AcademicInfoForm.university.focus();
			return false;
		} else if (document.AcademicInfoForm.passingYear.value.toString() == "0") {
			alert("Select passing year");
			document.AcademicInfoForm.passingYear.focus();
			return false;
		} else if (isNumeric(document.AcademicInfoForm.percentage)) {
			alert("Please Enter valid Percentage");
			document.AcademicInfoForm.percentage.focus();
			return false;
		} else if (document.AcademicInfoForm.percentage.value > 100) {
			alert("Please Enter valid Percentage");
			document.AcademicInfoForm.percentage.focus();
			return false;
		} else
			addToDB();
	}
	function checkEmpty(object) {
		if (object.value.trim() == "") {
			return true;
		}
		return false;
	}
	function isNumeric(object) {
		if (isNaN(object.value.trim())) {
			return true;
		} else
			return false;
	}
</script>
</head>
<body>
	<%
		UniversityInfoImplementor uniInfoImplementor = new UniversityInfoImplementor();
		List<?> uniList = (List<?>) uniInfoImplementor.getUniversityList();
		session.setAttribute("universityList", uniList);
	%>
	<div id="wrapper">
		<div id="header">
		    <h1><a href="#"><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a></h1>
				<ul id="nav">
					<li><logic:present name="LogedUser">
						</logic:present> 
						<logic:notPresent name="LogedUser">
							<jsp:forward page="/jsp/common/index.jsp"></jsp:forward>
						</logic:notPresent>
					</li>
					<li><a href="logout.do" title="Logout">Logout</a></li>
				</ul>
		</div>
		<!--HEADER ENDS HERE-->
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li>Given Exams</li>
					<li>Schedule Exams</li>
					<li>Change Password</li>
					<li>My Profile</li>
				</ul>
				<div class="sidebar_note message note"><p>You may add, edit/update your Academics details for your profile.</p></div>
			</div>
			<div id="main">
				<div id="fill_info">
					<logic:present name="msg">
						<p class="message success" id="messagep">
							<bean:write name="msg" filter="true"></bean:write>
							<span class="x" onclick="hidemessage();"></span>
						</p>
					</logic:present>
					<html:form action="/academicInfo">
						<table class="display" style="clear: none;">
							<thead>
								<tr>
									<th colspan="4" scope="col">Academic Details</th>
									<!--<th scope="col">Page Actions</th>-->
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="label">Qualification:</td>
									<td><html:select property="qualification"
											styleId="qualificationId">
											<%@ include file="/jsp/common/course.jsp"%>
										</html:select><span class="mandatory">*</span></td>
									<td class="label">University/Board:</td>
									<td><html:select property="university">
											<html:option value="0">Select</html:option>

											<logic:iterate id="unilist" name="universityList">
												<html:option value="${unilist.universityName}">${unilist.universityName}</html:option>
											</logic:iterate>

											<html:option value="Other">Other</html:option>
										</html:select><span class="mandatory">*</span></td>

								</tr>
								<tr>
									<td class="label">Passing Year:</td>
									<td><html:select property="passingYear">
											<html:option value="0">Year</html:option>
											<%
												for (int iterator = 1970; iterator <= cal.get(Calendar.YEAR) ; iterator++) {
											%>
											<html:option value="<%= String.valueOf(iterator) %>">
												<%=iterator%>
											</html:option>
											<%
												}
											%>
										</html:select><span class="mandatory">*</span></td>
									<td class="label">Percentage:</td>
									<td><html:text property="percentage"></html:text><span
										class="mandatory">*</span><input type="hidden" name="operation" /></td>
								</tr>
							</tbody>
						</table>
						<logic:present name="CandAcList">
							<table class="display" style="clear: none;">
								<tr>
									<th>Qualification</th>
									<th>University</th>
									<th>Passing Year</th>
									<th>Percentage</th>
								</tr>
								<logic:iterate id="CandRecord" name="CandAcList">
									<tr>
										<td>${CandRecord.qualification}</td>
										<td>${CandRecord.university}</td>
										<td>${CandRecord.passingYear}</td>
										<td>${CandRecord.percentage}</td>

									</tr>
								</logic:iterate>
							</table>
						</logic:present>
						<p class="align">
							<button class="btn_green" onclick=" return validate();">Add</button>
							<button class="btn_green" onclick="doSubmit();">Next</button>
						</p>
					</html:form>
				</div>
				<!--TEST ENDS HERE-->
			</div>
		</div>
	</div>
<%@ include file="/jsp/common/feedback.jsp" %>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
