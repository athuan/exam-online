<%@page import="java.util.Properties"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.io.*"%>
<%
	if (session.getAttribute("setupCheckDone") == null) {
		QueryHelper qh = new QueryHelper();
		String categoryName = "";
		String categoryId = "";
		try {
			String query = "select username from exm_user limit 1";

			ResultSet rs = qh.runQueryStreamResults(query);

			while (rs.next()) {
				categoryName = rs.getString("username");
				//out.print(categoryName);
			}
			session.setAttribute("setupCheckDone", "1");

		} catch (Exception e) {
			// REDIRECT TO SETUP PAGE IF UNABLE TO CONNECT TO DATABASE
			File f = new File(System.getProperty("user.home") + File.separatorChar + "kaldin.properties");
			if (!f.exists()) {
				response.sendRedirect(request.getContextPath() + "/install/start.jsp");
				return;
			}
		} finally {
			qh.releaseConnection();

		}
	}
%>
