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
<script type="text/javascript" src="<%=basePath%>resource/js/calendar/calendar.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/Cesium.js"></script>
<link rel="stylesheet" href="<%=basePath %>resource/css/widgets.css">
<script>
var path='<%=basePath %>';
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
	
	var lsgjDiv=$("#lsgj_div");
	lsgjDiv.css("width",(bodyWidth-leftPanelWidth-50)+"px");
	lsgjDiv.css("height",(leftPanelHeight-80)+"px");
	lsgjDiv.css("margin-top",-(leftPanelHeight-25)+"px");
	lsgjDiv.css("margin-left",(leftPanelWidth+25)+"px");
	
	var lsgjHeight=lsgjDiv.css("height");
	lsgjHeight=parseInt(lsgjHeight.substring(0,lsgjHeight.length-2));
	
	var lsgjTitleDiv=$("#lsgj_div #title_div");
	var lsgjTitleHeight=lsgjTitleDiv.css("height");
	lsgjTitleHeight=parseInt(lsgjTitleHeight.substring(0,lsgjTitleHeight.length-2));
	
	var lsgjToolDiv=$("#lsgj_div #tool_div");
	var lsgjToolHeight=lsgjToolDiv.css("height");
	lsgjToolHeight=parseInt(lsgjToolHeight.substring(0,lsgjToolHeight.length-2));
	
	var lsgjSpaceDiv=$("#lsgj_div #space_div");
	var lsgjSpaceHeight=lsgjSpaceDiv.css("height");
	lsgjSpaceHeight=parseInt(lsgjSpaceHeight.substring(0,lsgjSpaceHeight.length-2));
	
	var lsgjMapDiv=$("#lsgj_div #map_div");
	var lsgjMapHeight=lsgjMapDiv.css("height",(lsgjHeight-lsgjTitleHeight-lsgjToolHeight-lsgjSpaceHeight)+"px");
}
</script>
<title>Insert title here</title>
<style type="text/css">
.lsgj_div{
	background-color: rgba(39,42,49,0.5);
	border:1px solid rgba(39,42,49,0.5);
	position: fixed;
	border-radius:8px;
}
.lsgj_div .title_div{
	width: 100%;
	height: 60px;
}
.lsgj_div .title_div .icon_img{
	width: 40px;
	height: 40px;
	margin-top: 10px;
	margin-left: 10px;
}
.lsgj_div .title_div .lsgj_text_span{
	margin-top: 15px;
	margin-left:30px;
	color: #fff;
	font-size:25px; 
	position: absolute;
}
.lsgj_div .tool_div{
	width: 100%;
	height: 60px;
	background-color: #EFF3F6;
}
.lsgj_div .tool_div .xzdt_span{
	margin-top: 15px;
	margin-left:20px; 
	position: absolute;
}
.lsgj_div .tool_div .xzdt_sel{
	width: 100px;
	margin-top: 15px;
	margin-left: 100px;
	position: absolute;
}
.lsgj_div .tool_div .ry_span{
	margin-top: 15px;
	margin-left:245px; 
	position: absolute;
}
.lsgj_div .tool_div .ry_inp{
	width: 100px;
	margin-top: 15px;
	margin-left: 300px;
	position: absolute;
}
.lsgj_div .tool_div .sj_span{
	margin-top: 15px;
	margin-left:450px; 
	position: absolute;
}
.lsgj_div .tool_div .rq_wp{
	width: 100px;
	margin-top: 15px;
	margin-left: 500px;
	position: absolute;
}
.lsgj_div .tool_div .kssj_wp{
	width: 100px;
	margin-top: 15px;
	margin-left: 620px;
	position: absolute;
}
.lsgj_div .tool_div .zhi_span{
	margin-top: 15px;
	margin-left:740px; 
	position: absolute;
}
.lsgj_div .tool_div .jssj_wp{
	width: 100px;
	margin-top: 15px;
	margin-left: 775px;
	position: absolute;
}
.lsgj_div .tool_div .cx_but_div{
	width: 100px;
	height: 40px;
	line-height: 40px;
	margin-top: 10px;
	margin-left:910px; 
	color: #fff;
	font-size: 18px;
	text-align: center;
	background-color: #5A61F7;
	position: absolute;
	cursor: pointer;
	border-radius: 5px;
}
.lsgj_div .space_div{
	width: 100%;
	height: 40px;
	background-color: #264476;
}
</style>
</head>
<body>
<div id="cesiumContainer" style="width: 100%;height: 952px;background-image: url('<%=basePath %>resource/image/202111230026.png');"></div>
<%@include file="inc/top.jsp"%>
<%@include file="inc/left.jsp"%>
<div class="lsgj_div" id="lsgj_div">
	<div class="title_div" id="title_div">
		<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230027.jpg">
		<span class="lsgj_text_span">历史轨迹</span>
	</div>
	<div class="tool_div" id="tool_div">
		<span class="xzdt_span">选择地图</span>
		<select class="xzdt_sel">
			<option>请选择</option>
			<option>一层</option>
			<option>二层</option>
		</select>
		<span class="ry_span">人员</span>
		<input class="ry_inp" type="text"/>
		<span class="sj_span">时间</span>
		<input type="text"  class="Wdate rq_wp" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly"/>
		<input type="text"  class="Wdate kssj_wp" onclick="WdatePicker({ dateFmt: 'HH:mm:ss' })" readonly="readonly"/>
		<span class="zhi_span">至</span>
		<input type="text"  class="Wdate jssj_wp" onclick="WdatePicker({ dateFmt: 'HH:mm:ss' })" readonly="readonly"/>
		<div class="cx_but_div">查询</div>
	</div>
	<div class="space_div" id="space_div"></div>
	<div class="map_div" id="map_div" style="width: 100%;background-color: #fff;"></div>
</div>
</body>
</html>