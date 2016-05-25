<div id="header">
<h1><a href="<%=request.getContextPath()%>/superadmin.do"><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a></h1>
	<logic:present name="SuperAdmin">
		
	</logic:present> 
	<logic:notPresent name="SuperAdmin">
		<jsp:forward page="/jsp/common/index.jsp"></jsp:forward>
	</logic:notPresent>
  <ul id="topnav">
        <li <logic:equal name="menu" value="Settings">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/callAdminProfile.do" id="profileId"><bean:write name="Admin" property="firstName" /></a></li>
        <li><a href="<%=request.getContextPath()%>/logout.do" title="Logout">Logout</a></li>
    </ul>
    <!-- topnav end -->
    <ul id="nav">
    	<li <logic:equal name="menu" value="SuHome">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/superadmin.do" id="homeId">Dashboard</a></li>
        <li <logic:equal name="menu" value="Admin Settings">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/activateAdmin.do?action=activation" id="adminId">Admin Settings</a></li>
        <li <logic:equal name="menu" value="Reports">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/callAdminWiseQuestion.do" id="reportsId">Reports</a></li>
        <li <logic:equal name="menu" value="emailtemp">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/emailtemplate.do" id="emailId">Email Templates</a></li>
        <li <logic:equal name="menu" value="analytics">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/analytics.do" id="analytics">Analytics</a></li>
        <li <logic:equal name="menu" value="plan">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/plans.do" id="plan">Plans</a></li>
        <li <logic:equal name="menu" value="errors">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/errors.do" id="errors">Errors</a></li>
    </ul>
  </div>