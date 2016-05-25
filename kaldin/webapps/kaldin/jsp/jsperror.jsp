<%@page import="com.kaldin.exception.ErrorLogDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@page isELIgnored="false"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Something Went Wrong - Kaldin</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
</head>
<body>
	<div id="wrapper">
	   <div id="header">
	    <h1><a href="<%=request.getContextPath()%>/sitemap.do"><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a></h1>
	   </div>
		<div id="content">
			<div id="regilogin">
				<div id="signin_menu">
							<h4>Something Went Wrong</h4>
							<p><html:errors /></p>
				</div>
			</div>
		</div>
	</div>
<img height="1" width="1" src="/log/hit.php?pageName=jsperror&sessionId=<%=session.getId()%>&uid=<%=session.getAttribute("userid")%>&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>" />	
</body>
</html>
<%
new ErrorLogDAO().insertErrorLog("JSP",pageContext.getErrorData().getRequestURI(), exception.toString() , org.apache.commons.lang.exception.ExceptionUtils.getStackTrace(exception), (Integer) request.getSession().getAttribute("UserId") == null ? 0 : (Integer) request.getSession()
		.getAttribute("UserId"));
%>