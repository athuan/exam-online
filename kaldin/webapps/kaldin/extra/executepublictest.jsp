<%@page import="net.tanesha.recaptcha.ReCaptchaImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
<%@page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title><bean:write name="Question" property="question" filter='false' /></title>
<meta name="keywords" content="${questionoption }"/>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<style>
.captcha{ margin: 20px 0 0 0; }
.captcha td{ border: none; }
label{ white-space: normal;text-transform: none; }
#sidebar{ padding:0;margin:0;width:300px;text-align: center; }
iframe { min-height: 5px; }
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">var switchTo5x=true;</script>
<script type="text/javascript" src="https://ws.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">stLight.options({publisher: "ur-21d7f439-1347-b43c-a9a6-63908d32a07a", doNotHash: true, doNotCopy: true, hashAddressBar: false});</script>
<script>
function PrevSubmit() {
	var frm = document.forms[0]; frm.operation.value = "prev"; frm.submit();
}
function NextSubmit() {
	var frm = document.forms[0]; frm.operation.value = "next"; frm.submit();
}
function checkRecaptcha(){
	var captchaField = document.getElementById("recaptcha_challenge_field").value;
	var captchaResField = document.getElementById("recaptcha_response_field").value;
	if(captchaResField != ''){
	$.post("<%=request.getContextPath()%>/extra/checkCaptcha.jsp",
		{recaptcha_challenge_field: captchaField,recaptcha_response_field:captchaResField,positionkey:${Question.questionid}},
		function(data){
		var res = eval("(" + data + ")");
		if(res){
			if(res.captchaResult){
				if(res.result){
					document.getElementById("correctAnswer").innerHTML = "Answer: " + res.answer; 
				}
			}else{
				alert("Invalid Code");
			}
		}
	})
	}else{
		alert("Please Enter Code");
		document.getElementById("recaptcha_response_field").focus();
	}
}
</script>
</head>
<body>
<div id="wrapper">
<%@ include file="/jsp/common/practiceheader.jsp"%>
<div id="content">
		<div id="sidebar">
		<%@ include file="/extra/ads.jsp"%>
		</div>
			<div id="main">
					<h3>
						<logic:present name="TestName">
							<bean:write name="TestName" filter="true" />
						</logic:present>
					</h3>
					<hr />
				<div id="test_start">
					
					<logic:present name="Question">
							<div id="mainquestdiv">
								<div class="q">
								<table>
								<tr>
								<logic:present name="index">
									<td valign="top" style="border:0;important!" width="20px;"><SPAN><bean:write name="index" />)</SPAN></td>
								</logic:present>
								<td valign="top" style="border:0;important!"><bean:write name="Question" property="question" filter='false' /></td>
								</tr>
								</table>
								</div>
								
								
								<form action="practice-exam/${testurl }">
									<input type="hidden" name="position" value="">
								<logic:notPresent name="Subjective">
								<ul class="ans">
									<li>
										
										<logic:notPresent name="MultiSelect">
											
											<p class="custom-radio">
											<table>
												<tr>
													<td width="20px;" valign="top" style="border:0;important!">
													A)
													</td>
													<td valign="top" style="border:0;important!"> 
													<label for="optionA" class="" style="text-align: left;"><bean:write name='Question' property='optionA' filter="false"/></label>
													</td>
												</tr>
											</table>
											
											</p>
										</logic:notPresent>
										<logic:present name="MultiSelect">
											<p class="custom-checkbox">
											<table>
												<tr>
													<td width="20px;" valign="top" style="border:0;important!">
													A)
													</td>
													<td valign="top" style="border:0;important!">
													<label for="mltchA" class="" style="text-align: left;"><bean:write name='Question' property='optionA' filter="false"/></label>
													</td>
												</tr>
											</table>
											
											</p>
										</logic:present></li>

									<li>
										<logic:notPresent name="MultiSelect">
											<p class="custom-radio">
											<table>
												<tr>
													<td width="20px;" valign="top" style="border:0;important!">
													B)
													</td>
													<td valign="top" style="border:0;important!">
													<label for="optionB" class="" style="text-align: left;"><bean:write name='Question' property='optionB' filter="false"/></label>
													</td>
												</tr>
											</table>
											
											</p>
										</logic:notPresent>
										<logic:present name="MultiSelect">
											<p class="custom-checkbox">
											<table>
												<tr>
													<td width="20px;" valign="top" style="border:0;important!">
													B)
													</td>
													<td valign="top" style="border:0;important!">
													<label for="mltchB" class="" style="text-align: left;"><bean:write name='Question' property='optionB' filter="false"/></label>
													</td>
												</tr>
											</table>
											</p>
										</logic:present>
									<logic:notEmpty name="Question" property="optionC">


									<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">
														C) 
														</td>
														<td valign="top" style="border:0;important!">
														<label for="optionC" class="" style="text-align: left;"><bean:write name='Question' property='optionC' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent>
											<logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">
														C) 
														</td>
														<td valign="top" style="border:0;important!">
														<label for="mltchC" class="" style="text-align: left;"><bean:write name='Question' property='optionC' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:present>
									</li>

									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionC">
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionD">

										<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">D)</td>
														<td valign="top" style="border:0;important!"> 
														<label for="optionD" class="" style="text-align: left;"><bean:write name='Question' property='optionD' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent>
											<logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">D)</td>
														<td valign="top" style="border:0;important!">  
														<label for="mltchD" class="" style="text-align: left;"><bean:write name='Question' property='optionD' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:present></li>

									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionD">
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionE">

									<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">E)</td>
														<td valign="top" style="border:0;important!">  
														<label for="optionE" class="" style="text-align: left;"><bean:write name='Question' property='optionE' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent>
											<logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">E)</td>
														<td valign="top" style="border:0;important!">
														<label for="mltchE" class="" style="text-align: left;"><bean:write name='Question' property='optionE' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:present>
									</li>
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionE">
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionF">
										<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">F)</td>
														<td valign="top" style="border:0;important!">
														<label for="optionF" class="" style="text-align: left;"><bean:write name='Question' property='optionF' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent> 
											<logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">F)</td>
														<td valign="top" style="border:0;important!">
														<label for="mltchF" class="" style="text-align: left;"><bean:write name='Question' property='optionF' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:present>
										</li>
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionF">
									</logic:notEmpty>
									<logic:notEmpty name="Question" property="optionG">

										<li>
											<logic:notPresent name="MultiSelect">
												<p class="custom-radio">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">G)</td>
														<td valign="top" style="border:0;important!">
														<label for="optionG" class="" style="text-align: left;"><bean:write name='Question' property='optionG' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:notPresent> <logic:present name="MultiSelect">
												<p class="custom-checkbox">
												<table>
													<tr>
														<td width="20px;" valign="top" style="border:0;important!">G)</td>
														<td valign="top" style="border:0;important!">
														<label for="mltchG" class="" style="text-align: left;"><bean:write name='Question' property='optionG' filter="false"/></label>
														</td>
													</tr>
												</table>
												</p>
											</logic:present></li>
									</logic:notEmpty>									
								</ul>
								</logic:notPresent>
									
								<logic:present name="Subjective">
									<table>
										<tr>
											<td width="20px;" valign="top" style="border:0;important!">Answer</td>
											<td valign="top" style="border:0;important!">
											</td>
										</tr>
									</table>
								</logic:present>
								
								<logic:notEmpty name="Question" property="optionG">
								</logic:notEmpty>
								<logic:notEmpty name="Question" property="questionHint">
						         <p class="message info" style="float:left; width: 100%;"><bean:write name="Question"
						           property="questionHint" filter="false" /></p>
						        </logic:notEmpty>

								<input type="hidden" name="operation" value=""/>
								<input type="hidden" name="questid" value="${Question.questionid}"/>
								
								<%-- <html:hidden property="operation" />
								<html:hidden property="currentime" />
								<html:hidden property="questid" value="${Question.questionid}" /> --%>
								
								</form>
							</div>
					</logic:present>
				</div>
				<!--TEST START ENDS HERE-->
				
				<div class="test_btns">
					<logic:present name="Back">
						<a href="#" onclick="SaveSubmit()" class="btn_green">Save</a>
					</logic:present>
					<logic:present name="prevstatus">
						<logic:equal value="prev" name="prevstatus">
								<a href="<%=request.getContextPath()%>${preLink }" class="btn_blue">Previous</a>
						</logic:equal>
					</logic:present>
					<logic:present name="nextstatus">
						<logic:equal value="finish" name="nextstatus">
							<button onclick="FinishSubmit()" class="btn_red" type="button"> Finish</button>
						</logic:equal>
						
						<logic:equal value="next" name="nextstatus">
								<a href="<%=request.getContextPath()%>${nextLink }" class="btn_green"> Next</a>
						</logic:equal>
					</logic:present>

					<span class='st_twitter_large' displayText='Tweet'></span>
					<span class='st_googleplus_large' displayText='Google +'></span>
					<span class='st_facebook_large' displayText='Facebook'></span>
					<span class='st_pinterest_large' displayText='Pinterest'></span>
					<span class='st_linkedin_large' displayText='LinkedIn'></span>
					<span class='st_sharethis_large' displayText='ShareThis'></span>

				</div>
								
				<div class="test_btns">
				<form action="javascript: checkRecaptcha();">
					<table class="captcha">
						<tr>
							<td>
							Show Answer:
							<%
					          ReCaptcha c = ReCaptchaFactory.newSecureReCaptcha("6LeOD9wSAAAAAASuUJQvQLohEv3ePYzIILHZrF-E", "6LeOD9wSAAAAAOLliYRFcYsXCbVObOUE3KTCEa1E", false);
							  ((ReCaptchaImpl) c).setRecaptchaServer("https://www.google.com/recaptcha/api");  
							  out.print(c.createRecaptchaHtml(null, null));
					        %>
							</td>
						</tr>
						<tr>
							<td><div id="correctAnswer"></div></td>
						</tr>
						<tr>
							<td><a onclick="checkRecaptcha();" class="btn_blue_sml" style="cursor: pointer;">Show Answer</a></td>
						</tr>
						
					</table>
				</form>
				</div>
				<hr />
				<div class="test_btns">
					<div id="disqus_thread"></div>
				</div>
				<hr />
				<%
					ArrayList<String> nextPreQuestion = (ArrayList)request.getAttribute("nextprequestion");
					ArrayList<String> nextPreLinks = (ArrayList)request.getAttribute("nextprelinks");
				%>
				<div class="test_btns">
					<table class="captcha">
						<tr>
							<td>More Question</td>
							
						</tr>
						<%for(int i=0;i<nextPreQuestion.size();i++){ %>
						<tr>
							<td><a href="<%=request.getContextPath()%><%=nextPreLinks.get(i)%>"><%=nextPreQuestion.get(i) %></td>
						</tr>
						<%} %>
					</table>
				</div>
			</div>
		</div>	
	</div>		  
    <!--<div id="disqus_thread"></div> -->
    <script type="text/javascript">
        /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
        var disqus_shortname = 'kaldin'; // required: replace example with your forum shortname

        /* * * DON'T EDIT BELOW THIS LINE * * */
        (function() {
            var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
            dsq.src = 'https://' + disqus_shortname + '.disqus.com/embed.js';
            (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
        })();
    </script>
    <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
    <!-- <a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a> -->
    
<%@ include file="/jsp/common/analytics.jsp"%>			
</body>
</html>