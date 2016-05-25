<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Experience - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript">
	function hidemessage() {
		document.getElementById("messagep").style.display = "none";
	}
	function doSubmit() {
		document.forms[0].operation.value = "skip";
		document.forms[0].submit();
	}
	function addToDB() {
		document.forms[0].operation.value = "addToDB";
		document.forms[0].submit();
	}
	function validate() {
		document.forms[0].operation.value = "";
		if (checkEmpty(document.ExperienceInfoForm.companyName)
				|| checkEmpty(document.ExperienceInfoForm.description)
				|| checkEmpty(document.ExperienceInfoForm.fromDate)
				|| checkEmpty(document.ExperienceInfoForm.toDate)) {
			alert("Mandatory fields must not be empty");
			document.ExperienceInfoForm.companyName.focus();
			return false;
		} /*else if (isAlpha(document.ExperienceInfoForm.companyName)) {
			alert("Company name must be valid");
			document.ExperienceInfoForm.companyName.focus();
			return false;
		} else if (isAlpha(document.ExperienceInfoForm.description)) {
			alert("Designation must be valid");
			document.ExperienceInfoForm.description.focus();
			return false;
		}*/

		else {
			addToDB();
			//document.getElementById("skip").value="Next";
		}
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
		name.trim();
		if (name.search(Alphabet) != 0) {
			return true;
		}
		return false;
	}

	$(document).ready(function() {			
		Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });			
	} );
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
	</div>
	<div id="content">
		<div id="sidebar">
			<ul class="sidebar_nav">
				<li>Given Exams</li>
				<li>Schedule Exams</li>
				<li>Change Password</li>
				<li>My Profile</li>
			</ul>
			<div class="sidebar_note message note"><p>You may add, edit/update your Experience details for your profile.</p></div>
		</div>
		<div id="main">
			<div id="fill_info">
				<logic:present name="msg">
					<p class="message success" id="messagep">
						<bean:write name="msg" filter="true"></bean:write>
						<span class="x" onclick="hidemessage();"></span>
					</p>
				</logic:present>
				<html:form action="/experienceInfo">
					<table class="display" style="clear: none;">
						<thead>
							<tr>
								<th colspan="4" scope="col">Experience Details</th>
								<!--<th scope="col">Page Actions</th>-->
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="label">Company Name:</td>
								<td><html:text property="companyName"></html:text><span
									class="mandatory">*</span></td>
								<td class="label">Designation:</td>
								<td><html:text property="description"></html:text><span
									class="mandatory">*</span></td>
							</tr>
							<tr>
								<td class="label" nowrap="nowrap">From Date:</td>
								<td><html:text property="fromDate" styleId="fromDate"
										readonly="true"></html:text><span class="mandatory">*</span> <script
										type="text/javascript">
											$(document)
													.ready(
															function() {
																$("#fromDate")
																		.datepicker(
																				{
																					dateFormat: 'dd-M-yy',
																					showOn : 'both',
																					buttonImage : 'images/calendar.gif',
																					changeMonth : true,
																					buttonImageOnly : true,
																					changeYear : true,
																					yearRange : '1950:2021',
																					maxDate:-0,
																					onSelect: function (date) {
																		                var date2 = $('#fromDate').datepicker('getDate');
																		                date2.setDate(date2.getDate() + 1);
																		                $('#toDate').datepicker('setDate', date2);
																		                //sets minDate to dt1 date + 1
																		                $('#toDate').datepicker('option', 'minDate', date2);
																		            }
																				});
															});
										</script></td>
								<td class="label" nowrap="nowrap">To Date:</td>
								<td><html:text property="toDate" styleId="toDate"
										readonly="true"></html:text><span class="mandatory">*</span> <script
										type="text/javascript">
											$(document)
													.ready(
															function() {
																$("#toDate")
																		.datepicker(
																				{
																					dateFormat: 'dd-M-yy',
																					showOn : 'both',
																					buttonImage : 'images/calendar.gif',
																					changeMonth : true,
																					buttonImageOnly : true,
																					changeYear : true,
																					yearRange : '1950:2021',
																					maxDate:-0,
																					onClose: function () {
																		                var dt1 = $('#fromDate').datepicker('getDate');
																		                var dt2 = $('#toDate').datepicker('getDate');
																		                var diff = (dt2 - dt1)/1000/60/60/24;;
																		                if (diff < 0) {
																		                    alert("To Date can't be less than From Date");
																		                    dt1.setDate(dt1.getDate() + 30);
																		                    $('#toDate').datepicker('setDate', dt1);
																		                }
																		            }
																				});
															});
										</script><input type="hidden" name="operation" /></td>
							</tr>
						</tbody>
					</table>
					<logic:present name="CandExpList">
						<table class="display" style="clear: none;">
							<tr>
								<th>Company Name</th>
								<th>Designation</th>
								<th>From Date</th>
								<th>To Date</th>
							</tr>
							<logic:iterate id="CandRecord" name="CandExpList">
								<bean:define id="newfromDate" name="CandRecord" property="fromDate" />
								<bean:define id="newtoDate" name="CandRecord" property="toDate" />
								<tr>
									<td>${CandRecord.companyName}</td>
									<td>${CandRecord.description}</td>
									<td><%= new java.text.SimpleDateFormat("dd-MMM-yyyy").format(newfromDate) %></td>
									<td><%= new java.text.SimpleDateFormat("dd-MMM-yyyy").format(newtoDate) %></td>
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
		</div>	
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
