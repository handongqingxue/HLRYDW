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
}
</script>  
<title>Insert title here</title>
<style type="text/css">
.left_panel_div{
	width: 325px;
	height: 500px;
	background-color: rgba(0,255,0,0.2);
	position: fixed;
}
.left_panel_div .gj_div{
	width: 100%;
	height: 150px;
	border-bottom: #646445 solid 1px;
}
.left_panel_div .gj_div img{
	width: 150px;
	height: 156px;
	margin-left: 20px;
}
.left_panel_div .gj_div .gjdj_span{
	margin-top: 50px;
	color: #F54407;
	position: absolute;
}
.left_panel_div .gj_div .yjqr_but_div{
	width: 100px;
	height: 40px;
	line-height: 40px;
	margin-left: 170px;
	margin-top:-70px; 
	color:#898F9B;
	text-align:center;
	background-color: #00f;
}
.left_panel_div .menu_list_div{
	width: 100%;height: auto;color: #96D9E9;
}
.left_panel_div .menu_list_div .item_div{
	width: 100%;
	height: 40px;
	line-height: 40px;
	font-size:15px;
	/*
	background-color: #00f;
	*/
}
.left_panel_div .menu_list_div .item_div .ssdw_img{
	width: 40px;
	height: 40px;
	margin-left: 20px;
}
.left_panel_div .menu_list_div .item_div .gjxx_img{
	width: 30px;
	height: 30px;
	margin-top: 5px;
	margin-left: 25px;
}
.left_panel_div .menu_list_div .item_div .sjfx_img,
.left_panel_div .menu_list_div .item_div .dzwl_img,
.left_panel_div .menu_list_div .item_div .znxj_img,
.left_panel_div .menu_list_div .item_div .gysgl_img{
	width: 20px;
	height: 20px;
	margin-top: 10px;
	margin-left: 30px;
}
.left_panel_div .menu_list_div .item_div .ssdw_name_span{
	position: absolute;
}
.left_panel_div .menu_list_div .item_div .gjxx_name_span{
	margin-left: 5px;
	position: absolute;
}
.left_panel_div .menu_list_div .item_div .sjfx_name_span,
.left_panel_div .menu_list_div .item_div .dzwl_name_span,
.left_panel_div .menu_list_div .item_div .znxj_name_span,
.left_panel_div .menu_list_div .item_div .gysgl_name_span{
	margin-left: 10px;
	position: absolute;
}
.left_panel_div .menu_list_div .item_div .rs_span{
	margin-left:100px; 
	position: absolute;
}
.left_panel_div .menu_list_div .item_div .pointer_img{
	width: 30px;
	height: 30px;
	margin-top: 5px;
	margin-right: 20px;
	float: right;
}
.left_panel_div .menu_list_div .child_item_list_div{
	width: 100%;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div{
	width: 180px;
	height: 30px;
	line-height: 30px;
	margin:auto;
	font-size:13px;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div .child_name_div{
	width: 100px;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div .child_rs_div{
	margin-top: -30px;
	margin-left:100px;
}
</style>
</head>
<body>
<div id="cesiumContainer" style="width: 100%;height: 952px;"></div>
<%@include file="inc/top.jsp"%>
<div class="left_panel_div" id="left_panel_div">
	<div class="gj_div">
		<img alt="" src="<%=basePath %>resource/image/202111230006.png">
		<span class="gjdj_span">告警等级：低</span>
		<div class="yjqr_but_div">一键确认</div>
	</div>
	<div class="menu_list_div">
		<div class="item_div">
			<img class="ssdw_img" alt="" src="<%=basePath %>resource/image/202111230010.jpg">
			<span class="ssdw_name_span">实时定位</span>
			<span class="rs_span">人数：200</span>
			<img class="pointer_img" alt="" src="<%=basePath %>resource/image/202111230011.png">
		</div>
		<div class="child_item_list_div">
			<div class="child_item_div">
				<div class="child_name_div">一车间一楼</div>
				<div class="child_rs_div">人数：200</div>
			</div>
			<div class="child_item_div">
				<div class="child_name_div">2号仓库</div>
				<div class="child_rs_div">人数：15</div>
			</div>
		</div>
		<div class="item_div">
			<img class="gjxx_img" alt="" src="<%=basePath %>resource/image/202111230013.png">
			<span class="gjxx_name_span">告警信息</span>
		</div>
		<div class="item_div">
			<img class="sjfx_img" alt="" src="<%=basePath %>resource/image/202111230014.png">
			<span class="sjfx_name_span">数据分析</span>
			<img class="pointer_img" alt="" src="<%=basePath %>resource/image/202111230011.png">
		</div>
		<div class="child_item_list_div">
			<div class="child_item_div">
				<div class="child_name_div">历史轨迹</div>
			</div>
			<div class="child_item_div">
				<div class="child_name_div">位置追踪</div>
			</div>
			<div class="child_item_div">
				<div class="child_name_div">人员点名</div>
			</div>
			<div class="child_item_div">
				<div class="child_name_div">定位进出</div>
			</div>
		</div>
		<div class="item_div">
			<img class="dzwl_img" alt="" src="<%=basePath %>resource/image/202111230015.png">
			<span class="dzwl_name_span">电子围栏</span>
		</div>
		<div class="item_div">
			<img class="znxj_img" alt="" src="<%=basePath %>resource/image/202111230016.png">
			<span class="znxj_name_span">智能巡检</span>
		</div>
		<div class="item_div">
			<img class="gysgl_img" alt="" src="<%=basePath %>resource/image/202111230017.png">
			<span class="gysgl_name_span">供应商管理</span>
		</div>
	</div>
</div>
</body>
</html>