<%@ include file="/jsp/common/includetags.jsp" %>
<%@ include file="/jsp/common/feedback.jsp"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>My Profile - Kaldin Online Exam to Evaluate Knowledge</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type='text/javascript' src='js/user/createuser.js?dt=19aug2013'></script>
<script type="text/javascript">
function hidemessage(){
	document.getElementById("messagep").style.display="none";
}

function setState(stateId){
	var frm = document.forms[0]; 
	var countryId = frm.country.value;
	$.post("showstate.do", {
		companyId : countryId,
		stateId  : stateId
	}, function(data) {
		if (data == null) {
			message(container, "You haven't added your details");
		} else {
			//
			document.getElementById("state").innerHTML =data;
		}
	});
}
function dosubmit(){
	var frm = document.forms[0]; 
	if(frm.firstName.value==''){
		alert('Enter your Name!');
		frm.firstName.focus();
		return false;
	}else if(frm.contactNumber.value==''){
		alert('Enter your Phone!');
		frm.contactNumber.focus();
		return false;
	}else if(frm.address.value==''){
		alert('Enter your Address!');
		frm.address.focus();
		return false;
	}else if(frm.city.value==''){
		alert('Enter your City!');
		frm.city.focus();	
		return false;
	}else{
		frm.submit();
	}
}
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Settings");
	%>

	<div id="wrapper">
	<%if(request.getSession().getAttribute("SuperAdmin") == null){ %>
		<%@ include file="/jsp/common/header.jsp"%>
	<%}else{ %>
		<%@ include file="/jsp/common/adminHeader.jsp"%>
	<%} %>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callAdminProfile.do" class="active">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/calladminchangepass.do">Change Password</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">You may edit/update your profile information.</p></div>
			</div>
			<html:form action="/AdminProfile">
				<div id="main">

					<div class="regilogin_box">
						<logic:present name="CurrentRecord">
							<logic:iterate id='showResult' name='CurrentRecord'>
								<html:hidden property="userId" value="${showResult.userId}"></html:hidden>
								<html:hidden property="role" value="${showResult.role}"></html:hidden>
								<h3>Edit Profile</h3>
								<hr />
								<logic:present name="message">
									<p class="message success" id="messagep">
										<bean:write name="message" filter="true"/>
										<span class="x" onclick="hidemessage();"></span>
									</p>
								</logic:present>
								<div class="profile">
									<p>
										<label>First Name:</label>
										<html:text property="firstName" value='${showResult.firstName}' size="34" />
									</p>
									<p>
										<label>Last Name:</label>
										<html:text property="lastName" value='${showResult.lastName}' size="34" />
									</p>
									<p>
										<label>Phone:</label>
										<html:text property="contactNumber" value='${showResult.contactNumber}' size="34" />
									</p>
									<p>
										<label>E-mail:</label>
										<input type="text" value='${showResult.email}' size="34" disabled="true" />

									</p>
									<p>
										<label>Address:</label>
										<html:text property="address" value='${showResult.address}' size="34" />
									</p>
									<p>
										<label>City:</label>
										<html:text property="city" value='${showResult.city}' size="34" />
									</p>
									<p>
										<label>Country:</label>
										<logic:present name="CountryList">
											<html:select property="country" value="${showResult.country}"
												onchange="return setState('')" style="width: 255px;margin-left: 2px;">
												<logic:iterate id="Country" name="CountryList">
													<html:option value='${Country.countryId}'>${Country.countryName}</html:option>
												</logic:iterate>
											</html:select>
										</logic:present>
									</p>
									<p>
										<label>State:</label>
										<span id='state'>
												<select id='topicpopup'>
													<option>Select state:</option>
												</select>
										</span> 
										<script type="text/javascript">setState(${showResult.state});</script>
									</p>
									<p>
										<label></label>
										<button class="btn_green" type="button" onclick="dosubmit();">Update</button>
									</p>
								</div>
								<html:hidden property="email" value='${showResult.email}'></html:hidden>
								<html:hidden property="userName" value='${showResult.userName}'></html:hidden>
								<html:hidden property="operation" value='Update'></html:hidden>
							</logic:iterate>
						</logic:present>
					</div>
						
				</div>
			</html:form>
			</div>
</div>
<script type="text/javascript">
   $(document).ready(function() {
     Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
   });      
</script>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->
<%@ include file="/jsp/common/analytics.jsp" %>
</body>
</html>