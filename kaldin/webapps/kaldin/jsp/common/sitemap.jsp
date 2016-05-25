<%@ include file="/jsp/common/includetags.jsp"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:message key="jsp.common.sitemap.page.title"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<style>.steps {margin-left: auto;margin-right: auto;width: 73em;}</style>
</head>
<body>
	<%
		request.setAttribute("menu", "home");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="middle_section">
				<h3><bean:message key="jsp.common.sitemap.page.header"/></h3>
				<hr />
				<div class="box_outer">
					<ul class="steps">
						<li><a href="<%=request.getContextPath()%>/callshowQuestion.do?click='true'" class="questions">
							<div class="questimg"></div><div class="stepstext">Questions</div></a>
							<p><a href="<%=request.getContextPath()%>/callshowQuestion.do?click='true'"><bean:message key="jsp.common.sitemap.page.common.add"/></a>&nbsp;/&nbsp;
								<a href="<%=request.getContextPath()%>/callqueimport.do">Import</a>
								<bean:message key="jsp.common.sitemap.page.link.questions"/></a>,
								<a href="<%=request.getContextPath()%>/Subject.do"><bean:message key="jsp.common.sitemap.page.link.categories"/></a>,
								<a href="<%=request.getContextPath()%>/Topic.do"><bean:message key="jsp.common.sitemap.page.link.subcategories"/></a>,
								<a href="<%=request.getContextPath()%>/Level.do"><bean:message key="jsp.common.sitemap.page.link.complexity"/></a>
							</p></li>
						<li><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do" class="exams">
							<div class="examsimg"></div><div class="stepstext">Exams</div></a>
							<p> <bean:message key="jsp.common.sitemap.page.common.add"/> 
								<a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do"><bean:message key="jsp.common.sitemap.page.link.questionpapers"/></a> <bean:message key="jsp.common.sitemap.page.common.and"/> 
								<a href="<%=request.getContextPath()%>/schdultestlist.do"><bean:message key="jsp.common.sitemap.page.link.scheduleexam"/></a>
							</p></li>
						<li><a href="<%=request.getContextPath()%>/ViewUser.do" class="users">
							<div class="usersimg"></div><div class="stepstext">Users</div></a>
							<p>
								<a href="<%=request.getContextPath()%>/CreateUser.do"><bean:message key="jsp.common.sitemap.page.common.add"/></a>&nbsp;/&nbsp;
								<a href="<%=request.getContextPath()%>/importUser.do">Import</a>&nbsp;<bean:message key="jsp.common.sitemap.page.link.users"/>&nbsp;<bean:message key="jsp.common.sitemap.page.common.by"/>
								<a href="<%=request.getContextPath()%>/group.do"><bean:message key="jsp.common.sitemap.page.link.group"/></a>
							</p></li>
						<li><a href="<%=request.getContextPath()%>/certificatetemplate.do" class="certificates">
							<div class="certiimg"></div><div class="stepstext">Certificates</div></a>
							<p><a href="<%=request.getContextPath()%>/certificatetemplate.do">Add / Manage your certificates</a></p>
						</li>
					</ul>
				</div>
			</div>
			<div class="clr"></div>

			<table>
				<tr>
					<td width="20%" style="border:0px;height:300px;">
						<iframe frameBorder="0" src ="http://www.kaldin.com/a/tracknalert.jsp?kalemail=<bean:write name="Admin" property="userName" />&kalver=2.2&rdn=<%=System.currentTimeMillis()%>" style="border:0;height:300px;"></iframe>
					</td>
					<td width="*%" style="border:0px;padding: 5px;text-align: left;!important;">
						<table class="dash_half" style="width:100%;!important;">
							<thead>
								<tr>
									<th></th>
									<th><bean:message key="jsp.common.sitemap.page.today"/></th>
									<th><bean:message key="jsp.common.sitemap.page.thisweek"/></th>
									<th><bean:message key="jsp.common.sitemap.page.thismonth"/></th>
									<th><bean:message key="jsp.common.sitemap.page.tilldate"/></th>
								</tr>
							</thead>
							<tbody>
								<tr class="odd">
									<td><bean:message key="jsp.common.sitemap.page.totalexam"/></td>
									<td><bean:write name="todayTotalExamCount" filter="true" /></td>
									<td><bean:write name="weekTotalExamCount" filter="true" /></td>
									<td><bean:write name="monthTotalExamCount" filter="true" /></td>
									<td><bean:write name="totalExamCount" filter="true" /></td>
								</tr>
								<tr class="even">
									<td><bean:message key="jsp.common.sitemap.page.schedulecandidates"/></td>
									<td><bean:write name="todayTotalCandidateScheduleForExamCount" filter="true" /></td>
									<td><bean:write name="weekTotalCandidateScheduleForExamCount" filter="true" /></td>
									<td><bean:write name="monthTotalCandidateScheduleForExamCount" filter="true" /></td>
									<td><bean:write name="totalCandidateScheduleForExamCount" filter="true" /></td>
								</tr>
								<tr class="odd">
									<td><bean:message key="jsp.common.sitemap.page.givencandidates"/></td>
									<td><bean:write name="todayTotalCandidatesGiventheExamCount" filter="true" /></td>
									<td><bean:write name="weekTotalCandidatesGiventheExamCount" filter="true" /></td>
									<td><bean:write name="monthTotalCandidatesGiventheExamCount" filter="true" /></td>
									<td><bean:write name="totalCandidatesGiventheExamCount" filter="true" /></td>
								</tr>
								<tr class="even">
									<td><bean:message key="jsp.common.sitemap.page.passcandidates"/></td>
									<td><bean:write name="todayTotalCandidatesPassedtheExamCount" filter="true" /></td>
									<td><bean:write name="weekTotalCandidatesPassedtheExamCount" filter="true" /></td>
									<td><bean:write name="monthTotalCandidatesPassedtheExamCount" filter="true" /></td>
									<td><bean:write name="totalCandidatesPassedtheExamCount" filter="true" /></td>
								</tr>
							</tbody>
						</table>
					</td>
					<td width="20%" style="border:0px;">&nbsp;</td>
				</tr>
			</table>
		</div>
	</div>
	<%@ include file="/jsp/common/feedback.jsp"%>
	<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
