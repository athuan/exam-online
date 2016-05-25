<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Subject / Category Listing - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<style>
body {overflow-x:auto;}
</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<table>
				<tr>
					<td>Email</td>
					<td>ID / Name</td>
					<td>Edit</td>
					<td>Reassign Category</td>
					<td>Create Exam</td>
				</tr>
				<form action="updatecategory.jsp" method="post" accept-charset="utf-8">
				<%
				QueryHelper qh = new QueryHelper();
				QueryHelper qh1 = new QueryHelper();
				String categoryName = "";
				String categoryId = "";
				String testid = "";
				String exmURL = "";
				String exmSql = "select et.testid , ets.exmurl " +  
						"from exm_test et , exm_test_topic ett , exm_test_schedule ets " +
						"where et.testid = ett.testid " +
						"and et.testid = ets.testid  " +
						"and et.companyid = 10 " +
						"and ett.subjectid = ?"; 
				try{
					String query =  "select userid, email, es.subjectid, subjectname , count(eq.questionid) as cnt " +
									"from exm_subject es, exm_user eu , exm_question eq " +
									"where es.companyid = eu.companyid  " +
									"and eq.subjectid = es.subjectid " +
									"and eq.companyid = eu.companyid and es.subjectid <=3131 " +
									"group by es.subjectid " +
									"order by upper(email) ";
						
							//"select userid, email, subjectid, subjectname " +
							//"from exm_subject es, exm_user eu " +
							//"where es.companyid = eu.companyid " +
							//" order by upper(subjectname)";
							//"and eu.companyid in (2, 5, 10)";
					ResultSet rs = qh.runQueryStreamResults(query);
					int count = 0;
					while(rs.next()){
						categoryName = StringUtils.trim(rs.getString("subjectname")).replaceAll("[^\\x00-\\x7F]", "").replace("?", "");
						categoryId = rs.getString("subjectid");
						
						qh1.addParam(categoryId);
						ResultSet rs1 = qh1.runQueryStreamResults(exmSql);
						if(rs1.next()) {
							testid = rs1.getString("testid");
							exmURL = rs1.getString("exmurl");
						}
				%>
					<tr>
						<td><%= ++count + ") " + rs.getString("email") %></td>
						<td>[ <%=categoryId %> ] <a href="questionlisting.jsp?sid=<%=rs.getString("subjectid") %>"><%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(categoryName) %></a> (<%= rs.getString("cnt")%>)</td>
						<td><input type="text" name='<%=categoryId %>' size="50" value="<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(categoryName) %>" /></td>
						<td><input type="text" name='<%=categoryId %>_reassign' size="10" value="" /></td>
						<td><input type="text" name='<%=categoryId %>_exam' size="20" value="<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(categoryName) %>" />
							<% if(testid != "") out.println("<br>" + testid + " - " + exmURL); %>
						</td>
					</tr>
					<%	testid = "";
						exmURL = "";
						qh1.clearParams();
					}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					qh.releaseConnection();
					qh1.releaseConnection();
				}%>
			<tr>
				<td colspan="5" style="text-align:center;"><input class="btn_blue_sml" type="submit" value="Change Category Names" /></td>
			</tr>	
			</form>
		</table>
		</div>
	</div>
</body>
</html>