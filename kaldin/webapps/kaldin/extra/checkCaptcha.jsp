<%@page import="com.kaldin.test.executetest.dto.QuestAnsDTO"%>
<%@page import="com.kaldin.test.executetest.common.UtilTest"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="org.json.JSONObject"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse" %>
<%
boolean captchResult= false;
JSONObject resJSON = new JSONObject();
String remoteAddr = request.getRemoteAddr();
ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
reCaptcha.setPrivateKey("6LeOD9wSAAAAAOLliYRFcYsXCbVObOUE3KTCEa1E");

String challenge = request.getParameter("recaptcha_challenge_field");
String uresponse = request.getParameter("recaptcha_response_field");

String positionkey = request.getParameter("positionkey"); 

if(StringUtils.isNotEmpty(challenge) && StringUtils.isNotEmpty(uresponse)){
	ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
	
	if (reCaptchaResponse.isValid()) {
		captchResult = true;
		
		if(StringUtils.isNotEmpty(positionkey)){
			UtilTest utilTest = (UtilTest) request.getSession(false).getAttribute("utilTestObj");
			
			//String positionkey = String.valueOf(tqForm.getQuestid());
			QuestAnsDTO questAns = (QuestAnsDTO) utilTest.mapAns.get(positionkey);
			resJSON.put("result", true);
			resJSON.put("answer", questAns.getCorrectAnswer());
		}else{
			resJSON.put("result", false);
		}
		
	}
}

resJSON.put("captchaResult", captchResult);
out.print(resJSON.toString());
%>