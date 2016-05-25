<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@page import="java.sql.ResultSet"%>

<table border="1" style=" border-collapse: collapse; ">
<tr>
	<td>Sr. No.</td>
	<td>Admin User</td>
	<td>Exam ID</td>
	<td>Exam Name</td>
	<td>Candidates Given the Exam</td>
	<td>Total Count</td>
</tr>
<%
	QueryHelper qh = new QueryHelper();
	QueryHelper qh2 = new QueryHelper();
	QueryHelper qh3 = new QueryHelper();
	QueryHelper qh4 = new QueryHelper();
	
	String userQuery = "select userid, companyid, username from exm_user order by userid desc ";
	String examQuery = "select examid, examname from exm_exam where companyid = ? ";
	String testQuery = "select testid, testname from exm_test where companyid = ? ";
	String candidateCountQuery = "select count(test_givenid) as cnt from exm_test_given where testid = ? ";
	
	String userid = "";
	String companyid = "";
	String username = "";
	String examid = "";
	String examname = "";
	String testid = "";
	String testname = "";
	int cnt = 0;
	int srNo = 1;
	int totalCount = 0;
	try {
		ResultSet rs = qh.runQueryStreamResults(userQuery);

		while (rs.next()) {
			userid = rs.getString("userid");
			companyid = rs.getString("companyid");
			username = rs.getString("username");
%>
			<tr>
				<td><%=srNo %></td>
				<td><%=username %></td>
				<td colspan="3">
					<table border="1" width="100%" style=" border-collapse: collapse; ">
<%
			/* qh2.addParam(companyid);
			ResultSet rs2 = qh2.runQueryStreamResults(examQuery);
			while(rs2.next()){
				examid = rs2.getString("examid");
				examname = rs2.getString("examname");
			} */
			qh3.addParam(companyid);
			ResultSet rs3 = qh3.runQueryStreamResults(testQuery);
			while(rs3.next()){
				testid = rs3.getString("testid");
				testname = rs3.getString("testname");
%>
						<tr>
							<td><%=testid %></td>
							<td><%=testname %></td>
<%				qh4.addParam(testid);
				ResultSet rs4 = qh4.runQueryStreamResults(candidateCountQuery);
				if(rs4.next()){
					cnt = rs4.getInt("cnt");
					totalCount += cnt;
				}
%>
							<td><%=cnt %></td>					
<%				
			}
			srNo++;
%>							
						</tr>
					</table>
				</td>
				<td align="center"><%=totalCount %></td>
			</tr>
<%			
			totalCount = 0;
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		qh.releaseConnection();
		qh2.releaseConnection();
		qh3.releaseConnection();
		qh4.releaseConnection();
	}
%>
</table>