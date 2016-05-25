<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.kaldin.test.scheduletest.dao.ExamDAO"%>
<%@page import="com.kaldin.test.scheduletest.dto.ExamListDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<% int pageNo = request.getParameter("pageNo") == null || request.getParameter("pageNo").equals("")  ? 0 : Integer.parseInt(request.getParameter("pageNo")) ; %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Public Exams - <%= pageNo + 1 %> | Kaldin</title>
<meta name="description" content="Open source examination software for conducting any type of exam including online exam, 
pre-screening for colleges, universities and companies" />
<meta name="keywords" content="open source examination software,pre-screening tests,test software,practice exams,Examinations,
Evaluations,Exam Reports,Online free exams,Online exam software free,Software for online exam Online education and assessment software,
Online Tests,About online examination,Free online examination,Exam test online,Online testing exam,Open source examination tool" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<style>
div.container {
	margin: 20px auto;
	width: 100%;
}
ul.column {
	float: left;
	padding: 0;
	list-style: none;
	width: 100%;
}
ul.column li {
	background: #fff;
	float: left;
	margin: 25px 0 0 25px;
	display: block;
	width: 25%;
	padding:20px;
	border-radius: 2px 2px 2px 2px;
	-webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;

}
ul.column li.box13 {
	-webkit-box-shadow:0 0 10px rgba(0, 0, 0, 0.5);
	-moz-box-shadow:0 0 10px rgba(0, 0, 0, 0.5);
	box-shadow:0 0 10px rgba(0, 0, 0, 0.5);
	min-height: 300px;
}
ul.column li .title {
	min-height: 60px;
	width:90%;
}
ul.column li .description {
	padding-top: 10px;
}
ul.column li .keywords {
	padding-top: 15px;
}
ul.column li .total {
	padding-top: 15px;
	text-align:center;
}
ul.column li .buttons {
	text-align:center;
}

/* Clear Float */
.column:after, .box-collection:after, .clearfix:after, div.project-info:after {
	clear: both;
	content: ' ';
	display: block;
	font-size: 0;
	line-height: 0;
	visibility: hidden;
	width: 0;
	height: 0;
} 

.wrapper {
  background: white;
  border-radius: 10px;
  -webkit-box-shadow: 0px 0px 8px rgba(0,0,0,0.3);
  -moz-box-shadow:    0px 0px 8px rgba(0,0,0,0.3);
  box-shadow:         0px 0px 8px rgba(0,0,0,0.3);
  position: relative;
  z-index: 90;
}
.ribbon-wrapper-green {
  width: 85px;
  height: 88px;
  overflow: hidden;
  position: absolute;
  top: -20px;
  right: -20px;
}

.ribbon-green {
  font: bold 15px Sans-Serif;
  color: #333;
  text-align: center;
  text-shadow: rgba(255,255,255,0.5) 0px 1px 0px;
  -webkit-transform: rotate(45deg);
  -moz-transform:    rotate(45deg);
  -ms-transform:     rotate(45deg);
  -o-transform:      rotate(45deg);
  position: relative;
  padding: 7px 0;
  left: -5px;
  top: 15px;
  width: 120px;
  background-color: #BFDC7A;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#BFDC7A), to(#8EBF45)); 
  background-image: -webkit-linear-gradient(top, #BFDC7A, #8EBF45); 
  background-image:    -moz-linear-gradient(top, #BFDC7A, #8EBF45); 
  background-image:     -ms-linear-gradient(top, #BFDC7A, #8EBF45); 
  background-image:      -o-linear-gradient(top, #BFDC7A, #8EBF45); 
  color: #6a6340;
  -webkit-box-shadow: 0px 0px 3px rgba(0,0,0,0.3);
  -moz-box-shadow:    0px 0px 3px rgba(0,0,0,0.3);
  box-shadow:         0px 0px 3px rgba(0,0,0,0.3);
}

.ribbon-green:before, .ribbon-green:after {
  content: "";
  border-top:   3px solid #6e8900;   
  border-left:  3px solid transparent;
  border-right: 3px solid transparent;
  position:absolute;
  bottom: -3px;
}

.ribbon-green:before {
  left: 0;
}
.ribbon-green:after {
  right: 0;
}
.col1{float: left; width: 46%; padding:5px;}
.col2{float: left; width: 46%; padding:5px;}
</style>
</head>
<body>
<div id="wrapper">
	<%@ include file="/jsp/common/header.jsp"%>

	<div id="content">
		<div id="sidebar"></div>
			<div id="main">
			<form action="<%=request.getContextPath()%>/practice-exam" name="pageForm" method="post">
				<input type="hidden" name="pageNo" value="">
			</form>
			<div class="container">
			  <div class="box-collection">
				<ul class="column">
<%

QueryHelper qh = new QueryHelper();
int count = 0;
int size = 9;

try{
	 
	//String query = "SELECT DISTINCT et.testid,et.testname,ee.examid,ee.examname FROM exm_test_given etg,exm_test et, exm_exam ee WHERE "+ 
		//			"etg.testid = et.testid AND etg.examid=ee.examid ORDER BY ee.examname ASC";
	
	
	String query = "SELECT ee.examid, ee.examname, IFNULL(ee.description,'') AS description, ets.testid,ets.exmurl , t.testname , "
			+ " (SELECT COUNT(test_givenid) AS totalcnt FROM exm_test_given WHERE testid = ets.testid AND  examid = ets.examid ) AS totalgiven ,"
			+ " (SELECT  COUNT(resultid) FROM exm_result WHERE testid = ets.testid AND  examid = ets.examid AND remark = 'PASS') AS totalpassed "   
			+ " FROM exm_test_schedule ets, exm_exam ee , exm_test t "
			+ " WHERE ets.companyid = 10 AND ets.examid= ee.examid AND "
			+ " ets.testid = t.testid GROUP BY ee.examid ORDER BY   ee.examname ASC";
	
	if(pageNo > 0){
		query += " limit " +  size * pageNo + "," + size;
	}else{
		query += " limit 0," + size;
	}
	
	ResultSet rs = qh.runQueryStreamResults(query);
	while(rs.next()){
		count++;
%>		
				<li class="box13">
					<div class="wrapper"><div class="ribbon-wrapper-green"><div class="ribbon-green">FREE</div></div></div>
					<div class="title"><h3><a rel="bookmark" target="_blank" title="" href="<%=request.getContextPath()%>/practice-exam/<%= rs.getString("exmurl") %>/start-test"><%=rs.getString("examname") %></a></h3></div>
					<div class="description"><%=rs.getString("description") %></div>
					<div class="keywords"></div>
					<div class="total">
						<div style="color:green;"><b>Exam Statistics</b></div>
						<div class="col1">Exams Given</div>
						<div class="col2">Exams Passed</div>
						<div class="col1"><b><%=rs.getString("totalgiven") %></b></div>
						<div class="col2"><b><%=rs.getString("totalpassed") %></b></div>
					</div>
					<hr><div class="buttons"><a target="_blank" title="Start <%=rs.getString("testname") %>" href="<%=request.getContextPath()%>/exam/<%= rs.getString("exmurl") %>" class="btn_green_sml">Start Exam</a>
					&nbsp;&nbsp;&nbsp;<a target="_blank" title="Start <%=rs.getString("testname") %>" href="<%=request.getContextPath()%>/practice-exam/<%= rs.getString("exmurl") %>/start-test" class="btn_green_sml">Browse</a>
					</div>
				</li>
	
<%	}
}catch(Exception e){
	e.printStackTrace();
}finally{
	qh.releaseConnection();
}%>
				<div>
			</div>
		</div>
		<div style="padding-bottom:15px;" id="">
			<div style="width: 49%;float: left;margin: 20px 0;text-align: right;">
			<%if(pageNo > 0){ %>
				<a href="<%=request.getContextPath()%>/practice-exam?pageNo=<%=pageNo-1%>" class="btn_blue" style="cursor: pointer;">Previous</a>
			<%} %>	
			</div>
			<div style="width: 49%;float: left; margin: 20px 0;">
			<%if(count == 9){%>
				<a href="<%=request.getContextPath()%>/practice-exam?pageNo=<%=pageNo+1%>" class="btn_blue" style="cursor: pointer;">Next</a>
			<%} %>
			</div>
		</div>
	</div>
</div>
<%@ include file="/jsp/common/footer.jsp"%>
</div>
<script>
	function goPage(pageNo){
		document.pageForm.pageNo.value = pageNo;
		document.pageForm.submit();
	}
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>