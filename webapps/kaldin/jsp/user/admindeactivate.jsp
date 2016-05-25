<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Admin Deactivate - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/test/scheduletest.js?dt=19aug2013"></script>
<script>
	function selectAll() {
		frm = document.forms["ActivationForm"];
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

	function doSubmit() {

		var flag = 0;
		<logic:present name="ActivatedAdminList">
		<logic:iterate id="admin" name="ActivatedAdminList">
		var str = document.getElementById("${admin.userId}");
		if (str.checked == true) {
			flag = 1;
		}
		</logic:iterate>
		</logic:present>
		if (flag == 0) {
			alert("Please Select at least one admin for activation.");
			return false;
		} else {
			frm = document.forms["ActivationForm"];
			frm.operation.value = "deactivate";
			frm.submit();
		}
	}
	function getAdminDetails() {
		var frm = document.forms[0];
		frm.operation.value = "SEARCH";
		frm.submit();
	}

	$(document).ready(function() {		
		  Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
	});	
</script>
</head>
<style type="text/css">
#q_bank td {
	color: #666666;
	padding: 10px;
	text-align: left;
}
</style>
<body>
	<%
		request.setAttribute("menu", "Admin Settings");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/activateAdmin.do?action=activation">Activate</a></li>
					<li><a href="<%=request.getContextPath()%>/activateAdmin.do?action=deactivation" class="active">Deactivate</a></li>
				</ul>
				<div class="sidebar_note message note"><p>Message to Displayed on each page below Left side Menu</p></div>
			</div>
		<div id="main">
			<h3>Deactivate Admin</h3>
			<hr />
			<div id="contentTable">
				<div id="q_bank">
					<logic:present name="AdminActivationMessage">
						<center>
							<b><bean:write name="AdminActivationMessage" filter="true" /></b>
						</center>
					</logic:present>
					<div>
						<html:form action="/Activate?action=deactivation">
							<table class="display" style="clear: none;">
								<tr>
									<th><input type="checkbox" onclick='selectAll();' id="chkselectAll"> 
									Activated Admin List</th>
									<th>Deactivated Admins</th>
								</tr>
								<tr>
									<td style="vertical-align: top;">
									<logic:present name="ActivatedAdminList">
											<table style="width: 100%;">
												<tr>
													<td><logic:present name="activatedUsers">
															<b>Total Activated: <bean:write name="activatedUsers" /></b>
														</logic:present></td>
												</tr>
												<logic:iterate id="admin" name="ActivatedAdminList"
													indexId="idx">
													<%
														request.setAttribute("idv", idx.intValue() % 3);
													%>
													<tr>
														<logic:equal value="0" name="idv">

															<td><html:checkbox property="userId"
																	value="${admin.userId}" styleId="${admin.userId}">&nbsp;&nbsp;&nbsp;&nbsp;	<bean:write
																		name="admin" property="email" />
																</html:checkbox></td>
														</logic:equal>
														<logic:notEqual value="0" name="idv">
															<td><html:checkbox property="userId"
																	value="${admin.userId}" styleId="${admin.userId}">&nbsp;&nbsp;&nbsp;&nbsp;	<bean:write
																		name="admin" property="email" />
																</html:checkbox></td>

															<%
																request.setAttribute("idvv", idx.intValue() % 3);
															%>
															<logic:equal value="2" name="idvv">

															</logic:equal>
														</logic:notEqual>
													</tr>
												</logic:iterate>
											</table>
										</logic:present> <logic:present name="message">
											<table style="text-decoration: none;">
												<tr>
													<td colspan="2" style="border-bottom: none;">
														<h3>All Admin are Deactivated</h3>
													</td>
												</tr>
											</table>
										</logic:present></td>
									<td style="vertical-align: top;"><logic:present
											name="AdminList">
											<table>
												<tr>
													<td><logic:present name="deactivatedUsers">
															<b>Total Deactivated: <bean:write
																	name="deactivatedUsers" /></b>
														</logic:present></td>
												</tr>
												<logic:iterate id="email" name="AdminList" indexId="idx">
													<tr>
														<td><bean:write name="email" property="email" /></td>
													</tr>
												</logic:iterate>
											</table>
										</logic:present></td>
								</tr>
								<tr>
									<td colspan="3" align="center"><html:hidden property="operation"></html:hidden></td>
								</tr>
							</table>
							<button class="btn_green" onclick="doSubmit();return false;"> Deactivate </button>
						</html:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>