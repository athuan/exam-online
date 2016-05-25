<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Subjectwise Question Listing - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<table>
				<tr>
					<td>Question ID</td>
					<td>Question Description</td>
					<td colspan="7">Question Options</td>
					<td>Question Hint</td>
				</tr>
				<%
				String subjectId = request.getParameter("sid");
				QueryHelper qh = new QueryHelper();
				try{
					String query = "select eq.questionid, eq.question, eq.questionhint, optionA, optionB, optionC, optionD, optionE, optionF, optionG " +
						   "from exm_question eq , exm_answers ea " +
						   "where eq.questionid = ea.questionid " + 
						   " and subjectid = ? " ;
					qh.addParam(subjectId);
					qh.setMaxRows(5000);
					ResultSet rs = qh.runQueryStreamResults(query);
					while(rs.next()){
				%>
					<tr>
						<td><%=rs.getString("questionid") %></td>
						<td><%=rs.getString("question") %></td>
						<td><%=rs.getString("optionA") %></td>
						<td><%=rs.getString("optionB") %></td>
						<td><%=rs.getString("optionC") %></td>
						<td><%=rs.getString("optionD") %></td>
						<td><%=rs.getString("optionE") %></td>
						<td><%=rs.getString("optionF") %></td>
						<td><%=rs.getString("optionG") %></td>
						<td><%=rs.getString("questionhint") %></td>
					</tr>
				<%	}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					qh.releaseConnection();
				}%>
			<tr>
				<td colspan="10" style="text-align:center;">&nbsp;</td>
			</tr>	
		</table>
		</div>
	</div>
</body>
</html>