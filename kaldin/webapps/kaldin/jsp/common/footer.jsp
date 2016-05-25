<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%
	Calendar c = Calendar.getInstance();
	c.setTime(new Date());
%>
<div class="copy">&copy; Copyright <%=c.get(Calendar.YEAR)%> <a href="http://www.kaldin.com" target="_blank">kaldin.com</a> | <a href="<%=request.getContextPath()%>/jsp/common/terms.jsp">Terms &amp; Conditions</a></div>