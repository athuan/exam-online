<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Technology - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js?dt=19aug2013"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/tabber.js?dt=19aug2013"
	type="text/javascript"></script>
<script type="text/javascript">
	function hidemessage() {
		document.getElementById("messagep").style.display = "none";
	}
	function doSubmit() {
		document.forms[0].operation.value = "next";
		document.forms[0].submit();
	}
	function validate() {

		if (document.TechInfoForm.technology.value.toString() == "0") {
			alert("Select Technology");
			document.TechInfoForm.technology.focus();
			return false;
		} else if (checkEmpty(document.TechInfoForm.skills)) {
			if (isAlpha(document.TechInfoForm.skills)) {
				alert("Enter valid skills");
				document.TechInfoForm.skills.focus();
				return false;
			}
		}

		else
			addToDB();
	}
	function addToDB() {
		document.forms[0].operation.value = "addDB";
		document.forms[0].submit();
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
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
	<div id="content">
		<div id="sidebar">
			<ul class="sidebar_nav">
				<li><a href="#">Home</a></li>
				<li><a href="#">Given Exams</a></li>
				<li><a href="#">Schedule Exams</a></li>
				<li><a href="#">Change Password</a></li>
				<li><a href="#">My Profile</a></li>
			</ul>
		</div>
		<div id="main">
			<div id="fill_info">
				<logic:present name="msg">
					<p class="message success" id="messagep">
						<bean:write name="msg" filter="true"></bean:write>
						<span class="x" onclick="hidemessage();"></span>
					</p>
				</logic:present>
				<html:form action="/techInfo">
					<table class="display" style="clear: none;">
						<thead>
							<tr>
								<th colspan="4" scope="col">Technology Details</th>
								<!--<th scope="col">Page Actions</th>-->
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="label">Technology:</td>
								<td><html:select property="technology">
										<html:option value="0">Select Technology</html:option>
										<logic:present name="TechList">
											<logic:iterate id="tech" name="TechList">
												<option value="${tech.technology}">${tech.technology}</option>
											</logic:iterate>
										</logic:present>
									</html:select><span class="mandatory">*</span></td>
								<td class="label">Skills/Certification:</td>
								<td><html:select property="skills">
										<option value="Select">Select</option>
										<option value="Basic">Basic</option>
										<option value="Intermediate">Intermediate</option>
										<option value="Expert">Expert</option>
									</html:select></td>
							</tr>
						</tbody>
					</table>
					<logic:present name="CandTestList">
						<table class="display" style="clear: none;">
							<tr>
								<th>Technology</th>
								<th>Skills</th>
							</tr>
							<logic:iterate id="CandRecord" name="CandTestList">
								<tr>
									<td>${CandRecord.technology}</td>
									<td>${CandRecord.skills}</td>

								</tr>
							</logic:iterate>
						</table>
					</logic:present>
					<p class="align">
						<input type="hidden" name="operation" />
						<button class="btn_green" onclick="return validate();">Add</button>
						<button class="btn_green" onclick="doSubmit();">Finish</button>
					</p>
				</html:form>
			</div>
		</div></div>
	<%@ include file="/jsp/common/footer.jsp"%>
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>