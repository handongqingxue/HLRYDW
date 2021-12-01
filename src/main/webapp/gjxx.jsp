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
	background-color: #EFF3F6;
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
.gjgl_list_div .tool_div .sj_span{
	margin-top: 15px;
	margin-left:420px; 
	position: absolute;
}
.gjgl_list_div .tool_div .zhi_span{
	margin-top: 15px;
	margin-left:620px; 
	position: absolute;
}
.gjgl_list_div .tool_div .kh_span{
	margin-top: 15px;
	margin-left:820px; 
	position: absolute;
}
.gjgl_list_div .tool_div .cx_but_div{
	width: 100px;
	height: 40px;
	line-height: 40px;
	margin-top: 10px;
	margin-left:1020px; 
	color: #fff;
	font-size: 18px;
	text-align: center;
	background-color: #5A61F7;
	position: absolute;
	cursor: pointer;
	border-radius: 5px;
}
.gjgl_list_div .list_title_div{
	width: 100%;
	height: 40px;
	background-color: #264476;
}
.gjgl_list_div .list_title_div .all_sel_cb{
	margin-top: 12px;
	margin-left: 15px;
}
.gjgl_list_div .list_title_div .col_div{
	height: 40px;
	line-height: 40px;
	color:#fff;
	text-align: center;
}
.gjgl_list_div .list_title_div .kh_col_div{
	width: 150px;
	margin-top:-29px;
	margin-left:50px;
}
.gjgl_list_div .list_title_div .bjr_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:200px;
}
.gjgl_list_div .list_title_div .bjlx_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:300px;
}
.gjgl_list_div .list_title_div .fsqy_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:400px;
}
.gjgl_list_div .list_title_div .bmdw_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:500px;
}
.gjgl_list_div .list_title_div .kssj_col_div{
	width: 200px;
	margin-top:-40px;
	margin-left:600px;
}
.gjgl_list_div .list_title_div .jssj_col_div{
	width: 200px;
	margin-top:-40px;
	margin-left:800px;
}
.gjgl_list_div .list_title_div .clzt_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:1000px;
}
.gjgl_list_div .list_title_div .clr_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:1100px;
}
.gjgl_list_div .list_title_div .clsj_col_div{
	width: 200px;
	margin-top:-40px;
	margin-left:1200px;
}
.gjgl_list_div .list_title_div .cz_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:1400px;
}
.gjgl_list_div .list_div{
	width: 100%;
	height: auto;
}
.gjgl_list_div .list_div .item_div{
	width: 100%;
	height: 60px;
	background-color: #00f;
}
.gjgl_list_div .list_div .item_div .sel_cb{
	margin-top: 22px;
	margin-left: 15px;
}
.gjgl_list_div .list_div .item_div .col_div{
	height: 60px;
	line-height: 60px;
	text-align: center;
}
.gjgl_list_div .list_div .item_div .kh_col_div{
	width: 150px;
	margin-top:-39px;
	margin-left:50px;
	color:#262626;
}
.gjgl_list_div .list_div .item_div .bjr_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:200px;
	color:#262626;
}
.gjgl_list_div .list_div .item_div .bjlx_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:300px;
	color:#262626;
	background-color: #0f0;
}
.gjgl_list_div .list_div .item_div .fsqy_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:400px;
	background-color: #f00;
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
		<span class="sj_span">时间</span>
		<span class="zhi_span">至</span>
		<span class="kh_span">卡号</span>
		<div class="cx_but_div">查询</div>
	</div>
	<div class="list_title_div">
		<input class="all_sel_cb" type="checkbox"/>
		<div class="col_div kh_col_div">卡号</div>
		<div class="col_div bjr_col_div">报警人</div>
		<div class="col_div bjlx_col_div">报警类型</div>
		<div class="col_div fsqy_col_div">发生区域</div>
		<div class="col_div bmdw_col_div">部门/单位</div>
		<div class="col_div kssj_col_div">开始时间</div>
		<div class="col_div jssj_col_div">结束时间</div>
		<div class="col_div clzt_col_div">处理状态</div>
		<div class="col_div clr_col_div">处理人</div>
		<div class="col_div clsj_col_div">处理时间</div>
		<div class="col_div cz_col_div">操作</div>
	</div>
	<div class="list_div">
		<div class="item_div">
			<input class="sel_cb" type="checkbox"/>
			<div class="col_div kh_col_div">123456</div>
			<div class="col_div bjr_col_div">李铁玉</div>
			<div class="col_div bjlx_col_div">滞留报警</div>
			<div class="col_div fsqy_col_div">一车间</div>
		</div>
	</div>
</div>
</body>
</html>