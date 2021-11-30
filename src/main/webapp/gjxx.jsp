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
$(function(){
	//initViewer();
	//loadTileset();
	resetDivSize();
});

function resetDivSize(){
	var bodyWidth=$("body").css("width");
	var bodyHeight=$("body").css("height");
	bodyWidth=bodyWidth.substring(0,bodyWidth.length-2);
	bodyHeight=parseInt(bodyHeight.substring(0,bodyHeight.length-2));
	
	var cesiumContainerDiv=$("#cesiumContainer");
	cesiumContainerDiv.css("width",bodyWidth+"px");
	cesiumContainerDiv.css("height",bodyHeight+"px");
	
	var topDiv=$("#top_div");
	topDiv.css("margin-top",-bodyHeight+"px");

	var topDivHeight=$("#top_div").css("height");
	topDivHeight=parseInt(topDivHeight.substring(0,topDivHeight.length-2));
	
	var panelMarginTop=-(bodyHeight-topDivHeight);
	var leftPanelDiv=$("#left_panel_div");
	leftPanelDiv.css("margin-top",panelMarginTop+"px");
	leftPanelDiv.css("height",(bodyHeight-topDivHeight)+"px");

	var leftPanelDiv=$("#left_panel_div");
	var leftPanelWidth=leftPanelDiv.css("width");
	leftPanelWidth=parseInt(leftPanelWidth.substring(0,leftPanelWidth.length-2));
	var leftPanelHeight=leftPanelDiv.css("height");
	leftPanelHeight=parseInt(leftPanelHeight.substring(0,leftPanelHeight.length-2));
	
	var gjglListDiv=$("#gjgl_list_div");
	gjglListDiv.css("width",(bodyWidth-leftPanelWidth-50)+"px");
	gjglListDiv.css("height",(leftPanelHeight-80)+"px");
	gjglListDiv.css("margin-top",-(leftPanelHeight-25)+"px");
	gjglListDiv.css("margin-left",(leftPanelWidth+25)+"px");
}
</script>
<title>Insert title here</title>
<style type="text/css">
.gjgl_list_div{
	/*
	background-color: red;
	*/
	position: fixed;
}
.gjgl_list_div .title_div{
	width: 100%;
	height: 60px;
	background-color: rgba(79,80,81,0.5);
}
.gjgl_list_div .title_div .icon_img{
	width: 40px;
	height: 40px;
	margin-top: 10px;
	margin-left: 10px;
}
.gjgl_list_div .title_div .gjgl_text_span{
	margin-top: 15px;
	margin-left:30px;
	color: #fff;
	font-size:25px; 
	position: absolute;
}
.gjgl_list_div .title_div .but_div{
	width: 765px;
	height: 60px;
	margin-right: 50px;
	/*
	background-color: #0f0;
	*/
	float: right;
}
.gjgl_list_div .title_div .but_div .but_style1_div{
	width: 100px;
	height: 40px;
	line-height: 40px;
	color:#fff;
	font-size:18px; 
	text-align:center;
	background-color: rgba(75,79,109,0.5);
	cursor:pointer;
	border:#71683F solid 1px;
	border-radius:5px;
}
.gjgl_list_div .title_div .but_div .jr_but_div{
	margin-top:10px; 
}
.gjgl_list_div .title_div .but_div .zr_but_div{
	margin-left: 120px;
	margin-top: -42px;
}
.gjgl_list_div .title_div .but_div .but_style2_div{
	width: 120px;
	height: 40px;
	line-height: 40px;
	color:#fff;
	font-size:18px;
	text-align:center;
	background-color: #5A61F7;
	cursor:pointer;
	border-radius:5px;
}
.gjgl_list_div .title_div .but_div .zjyz_but_div{
	margin-left: 238px;
	margin-top: -41px;
}
.gjgl_list_div .title_div .but_div .dcexcel_but_div{
	margin-left: 373px;
	margin-top: -40px;
}
.gjgl_list_div .title_div .but_div .plcl_but_div{
	margin-left: 508px;
	margin-top: -40px;
}
.gjgl_list_div .title_div .but_div .yjcl_but_div{
	margin-left: 643px;
	margin-top: -40px;
}
.gjgl_list_div .tool_div{
	width: 100%;
	height: 60px;
	background-color: #EFF3F6;
}
.gjgl_list_div .tool_div .lx_span{
	margin-top: 15px;
	margin-left:20px; 
	position: absolute;
}
.gjgl_list_div .tool_div .zt_span{
	margin-top: 15px;
	margin-left:220px; 
	position: absolute;
}
</style>
</head>
<body>
<div id="cesiumContainer" style="width: 100%;height: 952px;"></div>
<%@include file="inc/top.jsp"%>
<%@include file="inc/left.jsp"%>
<div class="gjgl_list_div" id="gjgl_list_div">
	<div class="title_div">
		<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230024.png">
		<span class="gjgl_text_span">告警管理</span>
		<div class="but_div">
			<div class="but_style1_div jr_but_div">今日</div>
			<div class="but_style1_div zr_but_div">昨日</div>
			<div class="but_style2_div zjyz_but_div">最近7日</div>
			<div class="but_style2_div dcexcel_but_div">导出Excel</div>
			<div class="but_style2_div plcl_but_div">批量处理</div>
			<div class="but_style2_div yjcl_but_div">一键处理</div>
		</div>
	</div>
	<div class="tool_div">
		<span class="lx_span">类型</span>
		<span class="zt_span">状态</span>
	</div>
</div>
</body>
</html>