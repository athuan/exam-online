<link rel="stylesheet" href="<%=request.getContextPath()%>/css/feedback/feedback.css"  type="text/css" media="screen" /> 	
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/feedback/feedback.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/feedback/jquery.browser.min.js?dt=19aug2013"></script>  
<script type="text/javascript">
   $(document).ready(function() {
     Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
   });      
</script>
<!--[if lt IE 9]>
  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->    