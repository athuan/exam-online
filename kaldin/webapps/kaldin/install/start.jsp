<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page errorPage="error.jsp" %>
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
			response.sendRedirect(request.getContextPath() + "/");
			
		} catch (Exception e) {
		} finally {
			qh.releaseConnection();

		}
	}
%>
<html>
<head>
<meta charset="utf-8">
<title>Kaldin | Open Source Web-based online examination software</title>
<meta name="description" content="Comprehensive examination software for conducting any type of exam including online exam, 
pre-screening for colleges, universities and companies" />
<meta name="keywords" content="open source examination software, pre-screening tests, test software, practice exams, Examinations, Evaluations, Exam Reports, Online free exams, Online exam software free, 
Software for online exam Online education and assessment software, Online Tests, 
About online examination, Free online examination, Exam test online, Online testing exam,
 Open source examination tool" />
<link type="image/x-icon" href="<%= request.getContextPath() %>/images/favicon.ico" rel="shortcut icon">
<link href="frame/style.css" rel="stylesheet" type="text/css">
<link href="<%= request.getContextPath() %>/css/style_blue.css" rel="stylesheet" type="text/css">
<style>
/* Steps */
#main { overflow: visible !important;width:100%;}
#steps {
	float: left;
	width: 100%;
	margin: 10px 0;
	padding: 5px;
	background: url(http://www.kaldin.com/wp-content/uploads/2012/08/steps_bg3.png) 0 bottom no-repeat;
}

#steps li {
	display: inline;
	float: left;
	padding: 20px 20px 0px 20px;
	margin: 10px 10px 0 0;
	width: 260px;
}
label {font-weight: normal !important; float: none;}
</style>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/feedback/feedback.css" type="text/css" media="screen">
<meta charset=utf-8>
<script type="text/javascript">
	function show() {
		document.getElementById('dbreplace').style.display = '';
	}
	function hide() { 
		document.getElementById('tb1').style.display = '';
		document.getElementById('dbreplace').style.display = 'none';
	}
	function man() { 
		document.getElementById('tb1').style.display = '';
		document.getElementById('dbreplace').style.display = 'none';
		}

	function validateForm()
		{
		var mail=document.forms["install"]["userName"].value;
		var atpos=mail.indexOf("@");
		var dotpos=mail.lastIndexOf(".");
		if (atpos<1 || dotpos<atpos+2 || dotpos+2>=mail.length)
 		{
  			alert("Please enter valid e-mail address");
  			return false;
  		}
		var tbox=document.forms["install"]["password"].value;
		if (tbox==null || tbox=="")
 		{
  			alert("Please enter password");
  			return false;
  		}
	}

</script>

</head>

<BODY style="font-size: 13px;">

		<div id="dialog" align="center" style="display: none;">
		     <img alt="" src="<%=request.getContextPath()%>/images/loging.gif">
		</div>
<div id="wrapper">
  <div id="header">
    <h1><a href="<%=request.getContextPath()%>/sitemap.do"><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a></h1>
   </div>

  <div id="content" style="float: none;"> 

<div class="container" style="width: 100%;">

<div id="infoframe" style="float: left; width: 60%;">
	<div id="header_outer"> </div>
<div id="main_outer" style="height: 840px;overflow: scroll;">
  <div id="main">
    <ul id="steps">
      <h2>How it works</h2>
      <li>
        <h2>Questions</h2>
        <p>Use existing hundreds of questions or add new multiple choice questions in multiple categories.</p>
      </li>
      <li>
        <h2>Exam</h2>
        <p>Invite group of users or email link of Exam to be given on scheduled date and time.</p>
      </li>
      <li>
        <h2>Results</h2>
        <p> Real-time notifications, analysis by user, exam and category with ability yo download certificates.</p>
      </li>
    </ul>
    <!-- steps end -->
    
    <div id="features">
      <ul>
        <li> <img src="frame/readymade_questions.jpg" alt="" class="img_lft">
          <h2>Readymade Questions</h2>
          <p> Use existing questions in categories including Analytical 
Skills, General Apptitude, English Language, Technology and continously 
growing set of questions.</p>
        </li>
        <li> <img src="frame/customizable_questions.jpg" alt="" class="img_rgt">
          <h2>Customizable questions</h2>
          <p>Mutiple or single choice, two2 or more options, define complexity and specify correct answer.</p>
        </li>
        <li> <img src="frame/question_categories.jpg" alt="" class="img_lft">
          <h2>Question Categories</h2>
          <p>Easier management of questions by categories and sub categories.</p>
        </li>
        <li> <img src="frame/question_paper.jpg" alt="" class="img_rgt">
          <h2>Question Paper</h2>
          <p> Set one using combination of different complexity questions, passing marks, negative marking.</p>
        </li>
        <li> <img src="frame/schedule_exam.jpg" alt="" class="img_lft">
          <h2>Schedule Exam</h2>
          <p>Specify the exam date, invite users and annouce exam by email.</p>
        </li>
        <li> <img src="frame/manage_users.jpg" alt="" class="img_rgt">
          <h2>Manage Users</h2>
          <p> Manage users in groups like classes or departments. Import them from file or add then individually.</p>
        </li>
        <li class="no_sep"> <img src="frame/reports.jpg" alt="" class="img_lft">
          <h2>Reports</h2>
          <p> Instant real-time results and notifications after exam completion. Export results with passing marks.</p>
        </li>
      </ul>
    </div>
    <!-- features end --> 
    
  </div>
  <!-- main end --> 
</div>
<!-- main outer end -->
</div>

<div id="formframe" style="float: right; width: 40%;">
<FORM action="insert.jsp" method="post" name="install"  onsubmit="return validateForm();">
<font size="+1"  color="black"><br/>One Time Setup</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font size="-2" color="black"><a href="http://help.kaldin.com/questions/1/installation" target="http://help.kaldin.com/installation">Need Help? </a></font>
 <p align="right" ></p>

<font size="+1" color="blue"><br/>MySQL Details</font><br/> <br/>
        <INPUT TYPE=RADIO NAME="rad1" onclick="show()" VALUE="yes" checked="checked"/>Create new database for Kaldin<br/><br/>
        <INPUT TYPE=RADIO NAME="rad1" VALUE="no" onclick="hide()"/>Upgrade database from previous version<br/><br/>
<TABLE id=tb1 style="background-color: #ECE5B6;text-align: center;" WIDTH="100%">
<TR>
	<td><label>Database Name</label></td>
	<td><input TYPE="text" style="height: 30px;" NAME="dbname" value="kaldin" /><br/> <font size=1px style="position: relative;right: 58px;" id="dbreplace"> <input style="position: relative; top: 3px;" type="checkbox" name="dbreplace" value="yes"> Override exiting data if old data exists  </input></font></td>
</tr>

<tr>
	<td><label>Host/Port</label></td>
	<td><input TYPE="text" NAME="dbstring" style="height: 30px;" value="localhost:3306"></td>
</tr>

<tr>
	<td><label>User Name</label></td>
	<td><input TYPE="text" NAME="dbuser" style="height: 30px;" value="root"></td>
</tr>

<tr>
	<td><label>Password</label></td>
	<td><input TYPE="password" style="height: 30px;" NAME="dbpassword"></td>
</tr>
</table>

<font size="+1" color="blue"><br/>SMTP Details</font>

        <INPUT TYPE=RADIO NAME="smrad" VALUE="plain" checked="checked"/> Plain
        <INPUT TYPE=RADIO NAME="smrad" VALUE="tls" onclick="hide()"/> STARTTLS
        <INPUT TYPE=RADIO NAME="smrad" VALUE="ssl" onclick="hide()"/> SSL </br></br>

<TABLE id=tb1 style="background-color: #ECE5B6;text-align: center;" WIDTH="100%">
<tr>
	<td><label>Host</label></td>
	<td><input TYPE="text" NAME="smtphost" style="height: 30px;" value="localhost"></td>
</tr>

<tr>
	<td><label>port</label></td>
	<td><input TYPE="text" NAME="smtpport" style="height: 30px;" value=25></td>
</tr>

<tr>
	<td><label>User Name</label></td>
	<td><input TYPE="text" NAME="smtpuser" style="height: 30px;" value=""></td>
</tr>

<tr>
	<td><label>Password</label></td>
	<td><input TYPE="password" style="height: 30px;" NAME="smtppassword"></td>
</tr>
</table>

<font size="+1" color="blue"><br/>Admin Login</font>

<TABLE style="background-color: #ECE5B6;text-align:center;" WIDTH="100%" >
<tr>
	<td><label>Email</label></td>
	<td><input TYPE="text" style="height: 30px;" NAME="userName"></td>
</tr>

<tr>
	<td><label>New Password</label></td>
	<td><input TYPE="password" style="height: 30px;" NAME="password" ></td>
	<input type="hidden" name="operation" id="adminOperationId" value="" />
</tr>
<tr>
	<td></td>
	<td>
		<button type="submit" class="btn_green" VALUE="I Agree">I Agree & continue</button>
	</td>
</tr>
</table>
</form>

<iframe src ="http://www.kaldin.com/a/tracknalert.jsp?kalemail=StartPage(exe)&kalver=2.1&rdn=<%=System.currentTimeMillis()%>&javav=<%= System.getProperty("java.version")%>&tomv=<%= application.getServerInfo() %>" style="border:0;height:300px;"></iframe>
</div>
</body>
</html>
