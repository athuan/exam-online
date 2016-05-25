<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<title>Report page</title>
</head>
<body>

<table width='100%' id="example" class="display">
	<logic:present name="TopicList">
	   <thead>
	           <tr height="30px">
	               <th colspan="6" align="left">
	                    Report Date: <logic:present name="Date">
	                        	<bean:write name="Date"  filter="true"/>
	                       </logic:present>
	               </th>
	           </tr>
		       <tr style="padding-left: 5px;">
					<th>Qid</th>
					<th>Question</th>
					<th>Given Answer</th>
					<th>Answer</th>
					<th>Mark</th>
					<th>Remark</th>
				</tr>
		</thead>
		  <tbody style="overflow-y: auto; vertical-align: top; solid rgb(255, 255, 255);"> 
			<logic:iterate id="Topic" name="TopicList">
			<tr>
				<td colspan="2" style="background-color: white;"><b>Exam Name:</b> 
				<logic:present name="examName"><bean:write name="examName" filter="true"/></logic:present>
				</td>
				<td colspan="4" style="background-color: white;"><b>Total Questions:</b> <bean:write name="Topic"
					property="questionCount" filter="true" /></td>
			</tr>    
			<logic:present name="DetailResult">
				
				<logic:iterate id="Result" name="DetailResult">
					<logic:equal name="Result" value="${Topic.topicid}"
						property="topicid">
						<tr>
							<td>Q. <bean:write name="Result" property="questionid" filter="true" /></td>
							<td nowrap="nowrap">
								<bean:define id="qDesc" name="Result" property="question" type="java.lang.String"/>
								<%
								qDesc= qDesc.replaceAll("<!--.*?-->", "").replaceAll("<[^>]+>", "").replaceAll("\\<.*?\\>", "");								
				                qDesc = (qDesc.length()> 80) ? (qDesc.substring(0,80) + "...") : (qDesc);
								out.print(qDesc);
								%> 
							</td>
							<td><bean:write name="Result" property="givenAnswer" filter="true" /></td>
							<td><bean:write name="Result" property="correctAnswer" filter="true" /></td>
							<td><logic:equal value="Correct" name="Result"
								property="remark">
								<bean:write name="Result" property="markperquestion" filter="true" />
							</logic:equal><logic:equal value="Wrong" name="Result" property="remark">
								<bean:write name="Result" property="negativemark" filter="true" />
							</logic:equal></td>
							<td><logic:equal value="Correct" name="Result"
								property="remark">
								<font color="Green"><bean:write name="Result"
									property="remark" filter="true" /></font>
							</logic:equal><logic:equal value="Wrong" name="Result" property="remark">
								<font color="Red"><bean:write name="Result"
									property="remark" filter="true" /></font>
							</logic:equal></td>
						</tr>
					</logic:equal>

				</logic:iterate>
			</logic:present>
			</logic:iterate>
			</tbody>
	</logic:present>
</table>
<%@ include file="/jsp/common/feedback.jsp" %>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
