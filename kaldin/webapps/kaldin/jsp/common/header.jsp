<div id="header">
    <logic:notPresent name="logo">
    <h1><a href="<%=request.getContextPath()%>/sitemap.do"><img src="<%=request.getContextPath()%>/uploads/logos/logo-blue.png" alt="kaldin" /></a></h1>
    </logic:notPresent>
    <logic:present name="logo">
    <h1><a href="<%=request.getContextPath()%>/sitemap.do"><img id="clogo" src="<%=request.getContextPath()%>/uploads/logos/<bean:write name="logo"/>" alt="kaldin" /></a></h1>
    </logic:present>
  	<% String adminHeader=""; %>
    <logic:present name="Admin" property="firstName">
        <% adminHeader ="SignUp";%>
    </logic:present>
  <%
  if("SignUp".equals(adminHeader)){ %>
      <logic:present name="Admin" property="firstName">
        
      </logic:present>
      <logic:notPresent name="Admin" property="firstName">
        <jsp:forward page="/jsp/common/index.jsp">
          <jsp:param value="admin" name="user"/>
        </jsp:forward>
      </logic:notPresent>
  <!-- top nav end -->
  <ul id="topnav">
  <li <logic:equal name="menu" value="Settings">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/callAdminProfile.do" id="settingsId"><bean:write name="Admin" property="firstName" /></a></li>
      <li <logic:equal name="menu" value="">class="active"</logic:equal>><a href="logout.do" title="Logout"><bean:message key="jsp.common.header.page.link.logout"/></a></li>
    </ul>
    <!-- topnav end -->
    
  <ul id="nav">
      <li <logic:equal name="menu" value="home">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/sitemap.do" id="homeId"><bean:message key="jsp.common.header.page.link.dashboard"/></a></li>
      <li <logic:equal name="menu" value="QuestionBank">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/callshowQuestion.do?click='true'" id="questionBankId"><bean:message key="jsp.common.header.page.link.questions"/></a></li>
      <li <logic:equal name="menu" value="Test">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do" id="testId"><bean:message key="jsp.common.header.page.link.exams"/></a></li>
      <li <logic:equal name="menu" value="Users">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/group.do" id="usersId"><bean:message key="jsp.common.header.page.link.users"/></a></li>
      <li <logic:equal name="menu" value="certificate">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/certificatetemplate.do" id="certId"><bean:message key="jsp.common.header.page.link.certificate"/></a></li>
     <li <logic:equal name="menu" value="Setting">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/emailtemplate.do" id="usersId"><bean:message key="jsp.common.header.page.link.setting"/></a></li>
      <li <logic:equal name="menu" value="Reports">class="active"</logic:equal>><a href="<%=request.getContextPath()%>/callTestWiseResult.do" id="reportsId"><bean:message key="jsp.common.header.page.link.results"/></a></li>
      </ul>
  <!-- nav end -->
  <% } else { %>
  <!-- Not logged in -->
	<ul id="nav"><li><a href="<%=request.getContextPath()%>/"><bean:message key="jsp.common.header.page.link.login"/></a></li></ul>
  <% } %>
</div>
  <!-- header end -->