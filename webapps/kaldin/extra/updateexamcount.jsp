<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Update Exam Pass Fail Counts - Kaldin</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<table class="display" id="example">
				<tr>
					<th>Company ID</th>
					<th>Pass Count</th>
					<th>Fail Count</th>
				</tr>
				<%
				QueryHelper qh = new QueryHelper();
				QueryHelper qh1 = new QueryHelper();
				QueryHelper qh2 = new QueryHelper();
				
				String passQuery = "UPDATE exm_exam_count AS eec " 
						+ " INNER JOIN " 
						+ " ( " 
						+ " 	SELECT etg.testdate AS td, COUNT(ets.userid) AS cnt  FROM exm_test_schedule ets,exm_result ee ,exm_test_given etg WHERE ee.examid = ets.examid AND "  
						+ " 	ets.testid = ee.testid AND ets.userid = ee.userid AND etg.examid = ets.examid AND ets.testid = etg.testid AND ets.userid = etg.userid AND ee.remark='PASS' "  
						+ " 	AND ets.companyid = ? GROUP BY etg.testdate " 
						+ " ) AS counter ON eec.companyid = ? " 
						+ " SET eec.passcount = counter.cnt " 
						+ " WHERE eec.inputdate = counter.td";
				
				String failQuery = "UPDATE exm_exam_count AS eec " 
						+ " INNER JOIN " 
						+ " ( " 
						+ " 	SELECT etg.testdate AS td, COUNT(ets.userid) AS cnt  FROM exm_test_schedule ets,exm_result ee ,exm_test_given etg WHERE ee.examid = ets.examid AND "  
						+ " 	ets.testid = ee.testid AND ets.userid = ee.userid AND etg.examid = ets.examid AND ets.testid = etg.testid AND ets.userid = etg.userid AND ee.remark='FAIL' "  
						+ " 	AND ets.companyid = ? GROUP BY etg.testdate " 
						+ " ) AS counter ON eec.companyid = ? " 
						+ " SET eec.failcount = counter.cnt " 
						+ " WHERE eec.inputdate = counter.td";						
				try{
					String query = "SELECT DISTINCT(companyid) as cid FROM exm_exam_count " ;
					ResultSet rs = qh.runQueryStreamResults(query);
					int passCount = 0;
					int failCount = 0;
					while(rs.next()){
						int compid = rs.getInt("cid");
						
						qh1.addParam(compid);
						qh1.addParam(compid);
						qh1.runQuery(passQuery);
						passCount = qh1.getNumRecordsUpdated();
						qh1.clearParams();

						qh2.addParam(compid);
						qh2.addParam(compid);
						qh2.runQuery(failQuery);
						failCount = qh2.getNumRecordsUpdated();
						qh2.clearParams();
				%>
					<tr>
						<td><%= compid %></td>
						<td><%= passCount %></td>
						<td><%= failCount %></td>
					</tr>
				<%	}
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					qh.releaseConnection();
					qh1.releaseConnection();
					qh2.releaseConnection();
				}%>
		</table>
		</div>
	</div>
</body>
</html>