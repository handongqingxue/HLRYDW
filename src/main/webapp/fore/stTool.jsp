<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"
		+request.getServerPort()+request.getContextPath()+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=basePath %>resource/js/jquery-3.3.1.js"></script>
<script>
var path='<%=basePath %>';
$(function(){
	var parentDoc=window.parent.document;
	var bodyHeight=$("body",parentDoc).css("height");
	bodyHeight=bodyHeight.substring(0,bodyHeight.length-2);
	var topDivHeight=$("#top_div",parentDoc).css("height");
	topDivHeight=topDivHeight.substring(0,topDivHeight.length-2);
	var leftPanelHeight=$("#left_panel_div",parentDoc).css("height");
	
	var rightPanelDiv=$("#right_panel_div");
	leftPanelHeight=leftPanelHeight.substring(0,leftPanelHeight.length-2);
});
</script>
<title>Insert title here</title>
<style type="text/css">
.right_panel_div{
	width: 60px;
	height: 380px;
	margin-top:317px;
	right:55px;
	background-color: rgba(29,42,50,0.5);
	border:#3E8654 solid 2px;
	position: fixed;
}
.right_panel_div .img1{
	width: 50px;
	height: 50px;
	margin-top: 15px;
	margin-left: 5px;
}
.right_panel_div .img2{
	width: 50px;
	height: 50px;
	margin-top: 10px;
	margin-left: 5px;
}
.right_panel_div .img3{
	width: 50px;
	height: 50px;
	margin-top: 5px;
	margin-left: 5px;
}
.right_panel_div .img4{
	width: 50px;
	height: 50px;
	margin-left: 5px;
}
.right_panel_div .img5{
	width: 60px;
	height: 60px;
}
.right_panel_div .img6{
	width: 50px;
	height: 77px;
	margin-left: 5px;
}
</style>
</head>
<body>
<div class="right_panel_div" id="right_panel_div">
	<img class="img1" alt="" src="<%=basePath %>resource/image/202111230018.png">
	<img class="img2" alt="" src="<%=basePath %>resource/image/202111230019.png">
	<img class="img3" alt="" src="<%=basePath %>resource/image/202111230020.png">
	<img class="img4" alt="" src="<%=basePath %>resource/image/202111230021.png">
	<img class="img5" alt="" src="<%=basePath %>resource/image/202111230022.png">
	<img class="img6" alt="" src="<%=basePath %>resource/image/202111230023.png">
</div>
</body>
</html>