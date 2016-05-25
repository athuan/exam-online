<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%
	Calendar c = Calendar.getInstance();
	c.setTime(new Date());
%>
<logic:present name="testStarted"><a href="#">home</a></logic:present>
<logic:notPresent  name="testStarted"><a href="<%= request.getContextPath()%>/jsp/common/UserLogin.jsp">home</a></logic:notPresent></li>
<div class="copy">&copy; Copyright <%=c.get(Calendar.YEAR)%> <a href="http://www.kaldin.com" target="_blank">kaldin.com</a></div>