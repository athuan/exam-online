<%@page import="java.util.TimeZone" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>My Profile - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type='text/javascript' src='js/user/createuser.js'></script>
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
			message(container, "you haven't added your details");
		} else {
			//
			document.getElementById("state").innerHTML =data;
		}
	});
}

  $(document).ready(function() {
    Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
  });  
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Settings");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callAdminProfile.do" class="active">My profile</a></li>
					<li><a href="<%=request.getContextPath()%>/superadminchangepass.do">Change Password</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Message to Displayed on each page below Left side Menu</p></div>
			</div>
		<html:form action="/AdminProfile">
			<div id="main">

				<div class="regilogin_box">
					<logic:present name="CurrentRecord">
						<logic:iterate id='showResult' name='CurrentRecord'>
							<html:hidden property="userId" value="${showResult.userId}"></html:hidden>
							<html:hidden property="role" value="${showResult.role}"></html:hidden>
							<h3>My Profile</h3>
							<hr />
							<logic:present name="message">
								<p class="message success" id="messagep">
									<bean:write name="message" filter="true" />
									<span class="x" onclick="hidemessage();"></span>
								</p>
							</logic:present>
							<div class="edit_pro">
								<p>
									<label>First Name:</label>
									<html:text property="firstName"
											value='${showResult.firstName}'
											onchange="return textFname();" size="34" />
								</p>
								<p>
									<label>Last Name:</label>
									<html:text property="lastName"
											value='${showResult.lastName}' onchange="return textLname();"
											size="34" />
								</p>
								<p>
									<label>Contact No.:</label>
									<html:text property="contactNumber"
											value='${showResult.contactNumber}'
											onchange="return numericCtn();" size="34" />
								</p>
								<tr>
									<label>E-mail:</label>
									<input type="text" value='${showResult.email}'
										size="34" disabled="true" />

								</p>
						<p>
									<label>Address:</label>
									<html:text property="address"
											value='${showResult.address}' onchange="return textAdd();"
											size="34" />
								</p>
								<%--<p>
    	<label>Time Zone :</label>	
        &nbsp;&nbsp;<html:select property="timeZone" styleId="time" value="${showResult.timeZone}">
	  					<html:option value="0">SELECT</html:option>
						<%	String[] sr=TimeZone.getAvailableIDs();
 							List<String> list = Arrays.asList(sr);
							Set<String> set = new HashSet<String>(list);
							String[] result = new String[set.size()];
							set.toArray(result);
						    for(int i=0;i<result.length;i++)
	    					  {%>
	     							<html:option value="<%=result[i]%>" ><%=TimeZone.getTimeZone(result[i]).getDisplayName() %></html:option> 
							<%}%>
						</html:select>
		
    </p>  --%>
								<p>
									<label>Country:</label>
									<logic:present name="CountryList">
											<html:select property="country" value="${showResult.country}"
												onchange="return setState('')" style="width: 248px;">
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
					<p><label></label>
					<button class="btn_green" onclick="return blank();"> Update </button></p>
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
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->	
</body>
</html>