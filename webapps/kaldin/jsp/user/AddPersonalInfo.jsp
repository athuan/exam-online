<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Personal Details - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript">
	function hidemessage() {
		document.getElementById("messagep").style.display = "none";
	}
	function checkEmpty(object) {
		if (object.value == "") {
			return true;
		}
		return false;
	}
	function isAlpha(object) {
		var Alphabet = "^[a-zA-Z]+$";
		var name = object.value;
		if (name.search(Alphabet) != 0) {
			return true;
		}
		return false;
	}
	function isNumeric(object) {
		if (isNaN(object.value)) {
			return true;
		} else
			return false;
	}
	function validEmail(object) {
		var emailRegEx = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
		if (object.value.match(emailRegEx)) {
			return false;
		} else {
			return true;
		}
	}
	function validate() {
		if(checkEmpty(document.PersonalInfoForm.firstName) || document.PersonalInfoForm.firstName.value.trim() == '') {
			alert("First name must be valid.");
			document.PersonalInfoForm.firstName.focus();
			return false;
		}else if(checkEmpty(document.PersonalInfoForm.lastName)|| document.PersonalInfoForm.lastName.value.trim() == '') {
			alert("Last name must be valid.");
			document.PersonalInfoForm.lastName.focus();
			return false;
		}else if(checkEmpty(document.PersonalInfoForm.emailId) || validEmail(document.PersonalInfoForm.emailId)) {
			alert("Please enter valid email.");
			document.PersonalInfoForm.emailId.focus();
			return false;
		}
		/* else if (isAlpha(document.PersonalInfoForm.city)) {
			alert("City name must be valid");
			document.PersonalInfoForm.city.focus();
			return false;
		} else if (document.PersonalInfoForm.state.value.toString() == "0") {
			alert("Select your state");
			document.PersonalInfoForm.state.focus();
			return false;
		} else if (isNumeric(document.PersonalInfoForm.mobileNumber)
				|| isNumeric(document.PersonalInfoForm.phoneNumber)) {
			alert("Phone number & mobile number must be valid");
			document.PersonalInfoForm.mobileNumber.focus();
			return false;
		} else if (document.PersonalInfoForm.mobileNumber.value.length < 10) {
			alert("Mobile number must be valid");
			document.PersonalInfoForm.mobileNumber.focus();
			return false;
		}*/

		else {
			document.PersonalInfoForm.submit();
		}
	}
	function setState(stateId) {
		var frm = document.forms["PersonalInfoForm"];
		var countryId = frm.country.value;

		$.post("showstate.do", {
			companyId : countryId,
			stateId : stateId
		}, function(data) {
			if (data == null) {
				message(container, "States Not Found");
			} else {
				//
				document.getElementById("state").innerHTML = data;
			}
		});
	}
</script>
</head>
<body>
	<div id="wrapper">
		<div id="header">
		    <h1><a><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a></h1>
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
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li>Given Exams</li>
					<li>Schedule Exams</li>
					<li>Change Password</li>
					<li>My Profile</li>
				</ul>
				<div class="sidebar_note message note"><p>You may add, edit/update your Personal details for your profile.</p></div>
			</div>
			<div id="main">
				<div id="fill_info">
					<logic:present name="msg">
						<p class="message success" id="messagep">
							<bean:write name="msg" filter="true"></bean:write>
							<span class="x" onclick="hidemessage();">X</span>
						</p>
					</logic:present>
						<p class="message info">Please complete your profile before giving the Exam</p>
					<html:form action="/personalInfo">
						<html:hidden property="operation" value="add"></html:hidden>
						<table class="display" style="clear: none;">
							<thead>
								<tr>
									<th colspan="4" scope="col">Personal Details</th>
									<!--<th scope="col">Page Actions</th>-->
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><label>Name:</label></td>
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
									<td><label>Address 1:</label></td>
									<td><html:text property="address1"></html:text> </td>
									<td><label>Address 2:</label></td>
									<td><html:text property="address2"></html:text></td>
								</tr>
								<tr>
									<td><label>Country:</label></td>
									<td><logic:present name="CountryList">
											<html:select property="country" value="0"
												onchange="setState('')">
												<logic:iterate id="Country" name="CountryList">
													<html:option value='${Country.countryId}'
														style="width : 156px">${Country.countryName}</html:option>
												</logic:iterate>
											</html:select>
										</logic:present></td>

									<td><label>state:</label></td>

									<td>
										<div id="state" style="float: left;">
											<select>
												<option style="width: 156px">Select State:</option>
											</select>
										</div>
									</td>

								</tr>
								<script type="text/javascript">
									setState(0);
								</script>
								<tr>
									<td><label>City:</label></td>
									<td><html:text property="city"></html:text></td>
									<td><label>Email Id:</label></td>
									<td><html:text property="emailId" value='${LogedUser}' readonly="true"></html:text><span
										class="mandatory">*</span></td>
								</tr>
								<tr>

									<td><label>Mobile No:</label></td>
									<td><html:text property="mobileNumber" value=""></html:text></td>

									<td nowrap="nowrap"><label>Birth Date:</label></td>
									<td><html:text property="birthdate" styleId="bdate"
											readonly="true" /> <script type="text/javascript">
											$(document).ready(function() {
												$("#bdate").datepicker({
													dateFormat : 'dd-M-yy',
													showOn : 'both',
													buttonImage : 'images/calendar.gif',
													changeMonth : true,
													buttonImageOnly : true,
													changeYear : true,
													yearRange : '1950:2021'
												});
											});
											</script></td>
								</tr>
								<tr>
									<td><label>Telephone No:</label></td>
									<td><html:text property="phoneNumber" value=""></html:text>
									</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
						<p class="align">
							<button class="btn_green" onclick="return validate();">Next</button>
						</p>
					</html:form>
				</div>
			</div>
		</div>
		<%@ include file="/jsp/common/footer.jsp"%>
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>