<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Additional Exam Info - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn-complete.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn._MediaElementProto.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.HTMLYouTubeVideoElement.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.code.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.HTMLSoundCloudAudioElement.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/popcorn.HTMLVimeoVideoElement.js"></script>

<style> pre { width: 100%; font-family: 'Quando', sans-serif; white-space: pre-wrap; word-wrap: break-word; }</style>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
		<!--HEADER ENDS HERE-->
		<div id="content">
			<div id="sidebar">
	    	</div>
			<div id="main">
				<h3>Additional Exam Information</h3>
				<hr />
				<div id="test" style="padding-bottom: 25px;">
					<logic:present name="comments">
						<pre><bean:write name="comments" filter="false"/></pre>
					</logic:present><br><br>
					<logic:present name="examInfoFile">
						<logic:notEmpty name="examInfoFile">
							<a href='<%=request.getContextPath()%>/uploads/examinfo/<bean:write name="examInfoFile"/>' target="_new">View Exam Information Document</a>
						</logic:notEmpty>
					</logic:present><br><br>
					<logic:present name="videoURL">
						<logic:notEmpty name="videoURL">
							<div id="video" style="color:#fff;height:350px; width:600px;"></div>
						</logic:notEmpty>
					</logic:present>
				</div>
				<div>
					<a href="<%=request.getContextPath()%>/executetest.do?testid=<bean:write name="testid" filter="true"/>&examid=<bean:write name="examid" filter="true"/>" class="btn_green">
						Start Exam </a>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/jsp/common/feedback.jsp" %>
<%@ include file="/jsp/common/analytics.jsp"%>

<logic:present name="videoURL">
	<logic:notEmpty name="videoURL">
			<script type="text/javascript">
				var videoSrc = "${videoURL}";
				jQuery(document).ready(function() {
					var wrapper = '';
					//wrapper = Popcorn.smart('#video',videoSrc);
					if (videoSrc.indexOf("youtube.com") > -1 || videoSrc.indexOf("youtu.be") > -1) {
						wrapper = Popcorn.HTMLYouTubeVideoElement('#video');
						wrapper.src = videoSrc;
					} else {
						wrapper = Popcorn.smart('#video', videoSrc);
						//wrapper = Popcorn.HTMLVimeoVideoElement("#video");
						//wrapper.src = videoSrc;
					}
					var pop = Popcorn(wrapper);
					pop.play();
				});
			</script>
		</logic:notEmpty>
</logic:present>
</body>
</html>