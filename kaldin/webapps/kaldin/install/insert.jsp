<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@page import="java.util.Properties"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="org.apache.commons.io.*"%>
<%@ page import="com.kaldin.common.security.EncryptionManager"%>
<%@ page errorPage="error.jsp" %> 
<%
	// /////////////////
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
		response.sendRedirect(request.getContextPath() + "/");
		return;
		
	} catch (Exception e) {
	
	} finally {
		qh.releaseConnection();
	
	}
	///////////////////



	String dbname = request.getParameter("dbname");
	String dbuser = request.getParameter("dbuser");
	String dbpassword = request.getParameter("dbpassword");
	String url = "jdbc:mysql://" + request.getParameter("dbstring")	+ "/";
	String userName = request.getParameter("userName");
	String[] parts = userName.split("@");
	String displayName = parts[0];
	String password = EncryptionManager.encryptBlowfish(request
			.getParameter("password"));

	String smtphost = request.getParameter("smtphost");
	String smtpport = request.getParameter("smtpport");
	String smtpuser = request.getParameter("smtpuser");
	String mailfrom = "support@kaldin.com";
	String contype = request.getParameter("smrad");
	String smtpauth = "false";
	if (smtpuser != null && !smtpuser.isEmpty()) {
		smtpauth = "true";
	}
	String smtppassword = request.getParameter("smtppassword");

	Class.forName("com.mysql.jdbc.Driver");
	Connection con;
	PreparedStatement stmt;

	String relativeWebPathInstall = "/install";
	String absoluteDiskPathInstall = application
			.getRealPath(relativeWebPathInstall);
%>


<%
	con = DriverManager.getConnection(url, dbuser, dbpassword);

	if (request.getParameter("rad1").equals("yes")) {

		if (request.getParameter("dbreplace") == null) {
			stmt = con.prepareStatement("CREATE DATABASE " + dbname);
			stmt.execute();
			stmt.close();
		} else {
			stmt = con
					.prepareStatement("CREATE DATABASE IF NOT EXISTS "
							+ dbname);
			stmt.execute();
			stmt.close();
		}

		con.setCatalog(dbname);

		String query = IOUtils.toString(new FileReader(
				absoluteDiskPathInstall + "/kaldin.sql"));
		String queryarr[] = query.split(";");

		for (int i = 0; i < queryarr.length - 1; i++) {
			stmt = con.prepareStatement(queryarr[i]);
			stmt.execute();
			stmt.close();
		}

		String query1 = IOUtils.toString(new FileReader(
				absoluteDiskPathInstall + "/data.sql"));
		String queryarr1[] = query1.split(";\\n");

		for (int i = 0; i < queryarr1.length - 1; i++) {
			stmt = con.prepareStatement(queryarr1[i]);
			stmt.execute();
			stmt.close();
		}
	}
	
	if (request.getParameter("rad1").equals("no")) {

		con.setCatalog(dbname);

		String query = IOUtils.toString(new FileReader(
				absoluteDiskPathInstall + "/upgrade.sql"));
		String queryarr[] = query.split(";");

		for (int i = 0; i < queryarr.length - 1; i++) {
			stmt = con.prepareStatement(queryarr[i]);
			stmt.execute();
			stmt.close();
		}
	}
	
	con.setCatalog(dbname);
	stmt = con.prepareStatement("insert into exm_user (`firstname`,`lastname`,`companyid`,`username`,`password`,`role`,`email`) values ('"
					+ displayName
					+ "','',10,'"
					+ userName
					+ "','"
					+ password + "',1,'" + userName + "')");
	stmt.execute();
	stmt = con.prepareStatement("insert into email_settings values ('"+ smtphost +"','" + smtpport + "','" + mailfrom + "','" + smtpuser + "','" + smtppassword + "','" + smtpauth + "','" + contype + "')");
	stmt.execute();
	stmt = con.prepareStatement("insert into exm_company (`companyid`,`companyname`,`companyurl`,`isactive`,`isdeleted`,`isprofile`) values(10,'localhost','localhost',0,0,1)");
	stmt.execute();
	stmt.close();
	con.close();

	
		/*
		String filePath = request.getRealPath("META-INF") + File.separatorChar + "context.xml";	
		File file = new File(filePath);	
		if (file.exists()){
			file.createNewFile();
		}*/

		String mdbuser = request.getParameter("dbuser");
		String mdbpassword = request.getParameter("dbpassword");
		String mdbmdburl = "jdbc:mysql://"
				+ request.getParameter("dbstring") + "/";
		String mdbname = request.getParameter("dbname");

		File file = new File(System.getProperty("user.home")
				+ File.separatorChar + "kaldin.properties");
		if (!file.exists())
			file.createNewFile();

		FileInputStream input = new FileInputStream(file);

		Properties properties = new Properties();
		properties.load(input);

		try {
			input.close();
		} catch (Exception ex) {
		}

		properties.setProperty("mdbuser", mdbuser);
		properties.setProperty("mdbpassword", mdbpassword);
		properties.setProperty("mdburl", mdbmdburl);
		properties.setProperty("mdbname", mdbname);

		file = new File(System.getProperty("user.home")
				+ File.separatorChar + "kaldin.properties");
		if (!file.exists())
			file.createNewFile();

		FileOutputStream output = new FileOutputStream(file);
		properties.store(output, "Kaldin properties");

		try {
			output.close();
		} catch (Exception ex) {
		}

		/*
		 String writeString = "<?xml version='1.0' encoding='utf-8'?>" + "\n" +
		 "<Context>" + "\n" +
		 "<WatchedResource>WEB-INF/web.xml</WatchedResource>" + "\n" +	
		 "<Resource name=\"jdbc/kaldin\""+
		 " auth=\"Container\"" +
		 " type=\"javax.sql.DataSource\""+
		 " maxActive=\"5\"  maxIdle=\"-1\" maxWait=\"30000\""+
		 " username=\""+ mdbuser + "\" password=\"" + mdbpassword + "\"" +
		 " logAbandoned=\"true\""+
		 " removeAbandoned=\"true\" removeAbandonedTimeout=\"60\"" +
		 " driverClassName=\"com.mysql.jdbc.Driver\""+
		 " url=\""  + mdbstring +""+ mdbname +"?autoReconnect=true\""+
		 " description=\"MySQL Kaldin DB\"/> " +
		 "</Context>" + "\n";
		
		 FileUtils fileUtils = new FileUtils();
		 fileUtils.writeStringToFile(file,writeString);	
		 */

	//} catch (Exception e) {
		//e.printStackTrace();
	//}

	//Thread.sleep(20000);
%>
<html>
<head>
<script>
	function submitForm() {
		document.form.submit();
	}
	function login() {
		var frm = document.forms[0];
		var userName = document.getElementById("adminUserName").value;
		var password = document.getElementById("adminpassword").value;
		alert(userName);
		if (userName == "" || password == "") {
			if (userName == "")
				document.getElementById("adminUserName").focus();
			else
				document.getElementById("adminpassword").focus();
			return false;
		} else {
			document.getElementById("adminOperationId").value = "admin";
			frm.submit();
			return true;
		}
		return false;
	}
</script>
</head>
<body>
	<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
		<form action="<%=request.getContextPath()%>/login.do" styleId="adminForm" onsubmit="javascript:return Login_Form_Validator(document.parameter);"
			method=post>
			<input type="hidden" styleId="adminUserName" name="userName" size="30" value='<%out.print(request.getParameter("userName"));%>' id="adminUserName">
			<input type="hidden" styleId="adminpassword" name="password" size="30" value='<%out.print(request.getParameter("password"));%>' id="adminpassword">
			<input type="hidden" name="operation" id="adminOperationId" value="admin" /> <input type="hidden" name="gid" value=""> <input
				type="hidden" name="fname" value=""> <input type="hidden" name="lname" value="">
		</form>
		redirecting............
	<iframe src ="http://www.kaldin.com/a/tracknalert.jsp?kalemail=<%=userName %>-insertpage&kalver=2.1&rdn=<%=System.currentTimeMillis()%>" style="border:0;height:3px;"></iframe>
		<SCRIPT LANGUAGE="JavaScript">
			document.forms[0].submit();
		</SCRIPT>
	</table>

</body>
</html>
