<%@page import="java.util.Random"%>
<%@page import="com.kaldin.test.settest.dao.TestDAO"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.kaldin.test.scheduletest.form.ScheduleTestForm"%>
<%@page import="com.kaldin.test.scheduletest.dao.ExamDAO"%>
<%@page import="com.kaldin.test.settest.Hibernate.QuestionPaperHibernate"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.kaldin.common.db.QueryHelper"%>
<%@page import="java.util.Enumeration"%>
<%@ include file="/jsp/common/includetags.jsp"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	String subjectId = "";
	String subjectName = "";
	Enumeration<?> enum1 = request.getParameterNames();
	QueryHelper qh = new QueryHelper();
	
	String categoryNameSql = "update exm_subject set subjectname = ? where subjectid = ?";
	String reassignCategorySql = "update exm_question set subjectid = ? where subjectid = ?";
	String createExmTestSql = "insert into exm_test (testid, companyid, testname, noofquestions , duration , passingmarks, totalmarks, negativemarks , perquestionmarks, levelid, exmurl) values (?, 10, ?, ?, ?, ?, ?, 0, 1, 0, ?)";
	String createExmTestTopicSql = "insert into exm_test_topic (testid, topicid, countofquestion, subjectid, levelid) values (?, 0, ?, ? , 0)";
	String getCategoryQuestCountSql = "select count(questionid) as cnt from exm_question where subjectid = ?";
	String exmExistsSql = "select et.testid , ets.exmurl from exm_test et , exm_test_topic ett , exm_test_schedule ets where et.testid = ett.testid and et.testid = ets.testid  and et.companyid = 10 and ett.subjectid = ?"; 
	
	int questionCount = 0;
	String examURL = "";
	String testID = "";
	boolean result = false;
	try {
		for (; enum1.hasMoreElements();) {
			// Get the name of the request parameter
			subjectId = (String) enum1.nextElement();

			// Get the value of the request parameter
			subjectName = request.getParameter(subjectId);

			//System.out.println(subjectId + "-->" + subjectName);

			// Need to check if subjectId contains exam or reassign
			// if any then perform action per that
			if (subjectId.contains("_reassign")) {
				String oldSubjectId = subjectId.substring(0, subjectId.indexOf("_reassign"));
				if ((subjectName == "" || subjectName.equals(""))) {
					//Do nothing
				} else {
					// Need to Update all the Questions for this category with new category
					qh.addParam(subjectName);
					qh.addParam(oldSubjectId);
					qh.runQuery(reassignCategorySql);
					qh.clearParams();
				}
			} else if (subjectId.contains("_exam")) {
				String oldSubjectId = subjectId.substring(0, subjectId.indexOf("_exam"));
				String categoryName = request.getParameter(oldSubjectId);
					// Check if Exam already created for Category
					qh.addParam(oldSubjectId);
					ResultSet rs = qh.runQueryStreamResults(exmExistsSql);
					if(rs.next())
						result = true;
					qh.clearParams();
					
					if(!result){
						// Create the New Exam
						qh.addParam(oldSubjectId);
						ResultSet rs1 = qh.runQueryStreamResults(getCategoryQuestCountSql);
						if(rs1.next())
							questionCount = rs1.getInt("cnt");
						qh.clearParams();
						
						if(questionCount > 0) {
							// Insert record into exm_test
							//examURL = subjectName.replaceAll("\\p{P}\\p{S}", " ").toLowerCase().replaceAll(" ", "-");
							examURL = StringUtils.trim(subjectName).toLowerCase().replaceAll("[:()/>\\s&.,'|]", "-").replaceAll("\\-+", "-");
							subjectName = StringUtils.trim((subjectName.replaceAll("[:()/>\\s&.,'|]", " ").replaceAll("\\s+", " ")));
							if(TestDAO.checkExamURL(examURL, 10)){
								Random randomGenerator = new Random();
								examURL += randomGenerator.nextInt(100); 
							}
							//out.println(oldSubjectId + "-->" + subjectName + "-->" + examURL + "<br>");
							
							QuestionPaperHibernate qph = new QuestionPaperHibernate();
							testID = qph.getNewTestId();
							
							qh.addParam(testID);             	  // TestID
							qh.addParam(subjectName);             // Test Name 
							qh.addParam(questionCount);           // No of Questions
							qh.addParam(questionCount);           // Duration - 1 min / Question
							qh.addParam(questionCount/2);         // Passing Marks - 50%
							qh.addParam(questionCount);           // Total Marks - 1 / Question 
							qh.addParam(examURL);                 // Exam URL 
							qh.runQuery(createExmTestSql);
							qh.clearParams();
							
							// Insert record into exm_test_topic 
							
							qh.addParam(testID);             	  // TestID
							qh.addParam(questionCount);           // Count of Question
							qh.addParam(oldSubjectId);            // Subject Id
							qh.runQuery(createExmTestTopicSql);
							qh.clearParams();
							
							// Save the Exam
							DateFormat df = new SimpleDateFormat("dd-MMM-yyyy");
							Date d1 = new Date();
							Calendar c = Calendar.getInstance();
							c.setTime(d1);
							c.add(Calendar.DATE, 30);
							
							ExamDAO exmDAO = new ExamDAO();
							ScheduleTestForm stForm = new ScheduleTestForm();
							stForm.setTestId(testID);
							stForm.setExamName(subjectName);
							stForm.setStartDate(df.format(d1));
							stForm.setEndDate(df.format(c.getTime()));
							stForm.setPublicURL(examURL);
							stForm.setQuesSequence("1");
							
							exmDAO.saveScheduleTest(10, stForm);
						}
					}
					result = false;
			} else {
				qh.addParam(subjectName);
				qh.addParam(subjectId);
				qh.runQuery(categoryNameSql);
				qh.clearParams();
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		qh.releaseConnection();
	}
	response.sendRedirect("categorylisting.jsp");
%>