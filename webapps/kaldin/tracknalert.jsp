<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@ page import = "java.util.*" %>

<%
String headers = "";
Enumeration headerNames = request.getHeaderNames();
while(headerNames.hasMoreElements()) {
  String headerName = (String)headerNames.nextElement();
  headers = headers + " <br/> " + headerName + " : " +  request.getHeader(headerName);   
}

String email= request.getParameter("kalemail");
String version = request.getParameter("kalver");
String referrer = request.getHeader("referer")==null?"":request.getHeader("referer");
String ipaddress = request.getRemoteAddr();
String browser = request.getHeader("user-agent");


QueryHelper qh = new QueryHelper();
try{
	String sql = "insert into livetracking (email,ip,version,useragent,referrer,dateadded,headers) values(?,?,?,?,?,now(),?) ";
	qh.addParam(email);
	qh.addParam(ipaddress);
	qh.addParam(version);
	qh.addParam(browser);
	qh.addParam(referrer);
	qh.addParam(headers);
	qh.runQuery(sql);
	
}catch (Exception e){
	e.printStackTrace();
}finally{
	qh.releaseConnection();
}


%>

