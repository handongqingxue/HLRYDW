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
<script type="text/javascript" src="<%=basePath %>resource/js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/highcharts/highcharts-3d.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/highcharts/exporting.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/highcharts/highcharts-zh_CN.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/calendar/calendar.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/Cesium.js"></script>
<link rel="stylesheet" href="<%=basePath %>resource/css/widgets.css">
<script>
var path='<%=basePath %>';
$(function(){
	initQYPie();
	resetDivSize();
});

//https://jshare.com.cn/demos/hhhhiG?hc-theme=sand-signika
function initQYPie(){
	var colorArr=['#4C87B9','#73BA44','#D35A28','#7DCDD7','#136728','#2D83D7'];
	var seriesDataList=[];
	seriesDataList.push({name:'工作区',y:45.0});
	seriesDataList.push({name:'水处理工作区',y:26.8});
	//seriesDataList.push([name:'房一工作区',y:12.8]);
	//seriesDataList.push([name:'房二工作区',y:8.5]);
	//seriesDataList.push([name:'房三工作区',y:6.2]);
	//seriesDataList.push([name:'房四工作区',y:0.7]);
	
	var chart = Highcharts.chart('pie_div', {
		chart: {
			type: 'pie',
			options3d: {
				enabled: true,
				alpha: 45,
				beta: 0
			}
		},
		title: {
			text: "各区域总时长:</span><span style=\"color:#0F83E5;font-weight:bold;\">29天6小时10分20秒</span>",
			align:"left"
		},
		/*
		tooltip: {
			pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		*/
		colors:colorArr,
		plotOptions: {
			pie: {
				allowPointSelect: true,
				cursor: 'pointer',
				depth: 35,
				dataLabels: {
					enabled: true,
					format: '{point.name}:{point.percentage:.1f}%'
				}
			}
		},
		series: [{
			type: 'pie',
			//name: '浏览器占比',
			/*
			data: [
				['工作区',45.0],
				['水处理工作区',26.8],
				['房一工作区',12.8],
				['房二工作区',8.5],
				['房三工作区',6.2],
				['房四工作区',0.7]
			]
			*/
			data:seriesDataList
		}]
	});
}

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
	
	var cbsglDiv=$("#cbsgl_div");
	cbsglDiv.css("width",(bodyWidth-leftPanelWidth-50)+"px");
	cbsglDiv.css("height",(leftPanelHeight-80)+"px");
	cbsglDiv.css("margin-top",-(leftPanelHeight-25)+"px");
	cbsglDiv.css("margin-left",(leftPanelWidth+25)+"px");
	
	var cbsglHeight=cbsglDiv.css("height");
	cbsglHeight=parseInt(cbsglHeight.substring(0,cbsglHeight.length-2));

	var znhkhTitleDiv=$("#cbsgl_div #title_div");
	var znhkhTitleHeight=znhkhTitleDiv.css("height");
	znhkhTitleHeight=parseInt(znhkhTitleHeight.substring(0,znhkhTitleHeight.length-2));

	var znhkhTjInfoDiv=$("#cbsgl_div #tj_info_div");
	znhkhTjInfoDiv.css("height",(cbsglHeight-znhkhTitleHeight-2)+"px");

	var znhkhToolDiv=$("#cbsgl_div #tool_div");
	var znhkhToolHeight=znhkhToolDiv.css("height");
	znhkhToolHeight=parseInt(znhkhToolHeight.substring(0,znhkhToolHeight.length-2));
	
	var echartsDiv=$("#cbsgl_div #echarts_div");
	echartsDiv.css("height",(cbsglHeight-znhkhTitleHeight-znhkhToolHeight-50)+"px");
}
</script>
<title>Insert title here</title>
<style type="text/css">
.cbsgl_div{
	background-color: rgba(39,42,49,0.5);
	border:1px solid rgba(39,42,49,0.5);
	position: fixed;
	border-radius:8px; 
}
.cbsgl_div .title_div{
	width: 100%;
	height: 60px;
}
.cbsgl_div .title_div .icon_img{
	width: 40px;
	height: 40px;
	margin-top: 10px;
	margin-left: 10px;
}
.cbsgl_div .title_div .cbsgl_text_span{
	margin-top: 15px;
	margin-left:30px;
	color: #fff;
	font-size:25px; 
	position: absolute;
}
.cbsgl_div .title_div .but_div{
	width: 495px;
	height: 60px;
	margin-right: 50px;
	/*
	background-color: #0f0;
	*/
	float: right;
}
.cbsgl_div .title_div .but_div .but_style1_div{
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
.cbsgl_div .title_div .but_div .jr_but_div{
	margin-top:10px; 
}
.cbsgl_div .title_div .but_div .zr_but_div{
	margin-left: 120px;
	margin-top: -42px;
}
.cbsgl_div .title_div .but_div .but_style2_div{
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
.cbsgl_div .title_div .but_div .zjyz_but_div{
	margin-left: 238px;
	margin-top: -41px;
}
.cbsgl_div .title_div .but_div .dcexcel_but_div{
	margin-left: 373px;
	margin-top: -40px;
}
.cbsgl_div .tj_info_div{
	width: 100%;
	background-color: #EFF3F6;
	padding: 1px;
}
.cbsgl_div .tj_info_div .tool_div{
	width: 98%;
	height: 60px;
	margin:10px auto 0;
	background-color: #fff;
}
.cbsgl_div .tj_info_div .tool_div .cbs_span{
	margin-top: 15px;
	margin-left:20px; 
	position: absolute;
}
.cbsgl_div .tj_info_div .tool_div .cbs_sel{
	width: 160px;
	height:30px;
	margin-top: 12px;
	margin-left: 90px;
	color: #3B3B3B;
	background-color: #fff;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.cbsgl_div .tj_info_div .tool_div .sj_span{
	margin-top: 15px;
	margin-left:280px; 
	position: absolute;
}
.cbsgl_div .tj_info_div .tool_div .kssj_wp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 330px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.cbsgl_div .tj_info_div .tool_div .zhi_span{
	margin-top: 15px;
	margin-left:500px; 
	position: absolute;
}
.cbsgl_div .tj_info_div .tool_div .jssj_wp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 530px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.cbsgl_div .tj_info_div .tool_div .cx_but_div{
	width: 110px;
	height: 35px;
	line-height: 35px;
	margin-top: 12px;
	margin-left:730px; 
	color: #fff;
	font-size: 16px;
	background-color: #5DC0FF;
	position: absolute;
	cursor: pointer;
	border-radius: 12px;
}
.cbsgl_div .tj_info_div .tool_div .cx_but_div .text_span{
	margin-left: 20px;
}
.cbsgl_div .tj_info_div .tool_div .cx_but_div img{
	margin-top: 5px;
	margin-right: 15px;
	float: right;
}
.cbsgl_div .tj_info_div .echarts_div{
	width: 98%;
	margin:20px auto 0;
	background-color: #fff;
	padding: 1px;
}
.cbsgl_div .tj_info_div .echarts_div .pie_div{
	width: 1400px;
	height: 250px;
	margin-top: 10px;
	margin-left: 15px;
}
.cbsgl_div .tj_info_div .echarts_div .name_list_div{
	width: 200px;
	height: 200px;
	margin-top: -200px;
	margin-left:80px; 
	background-color: #0f0;
	position: absolute;
}
.cbsgl_div .tj_info_div .echarts_div .name_list_div .item_div{
	width: 100%;
	height: 30px;
	background-color: #00f;
}
</style>
</head>
<body>
<div id="cesiumContainer" style="width: 100%;height: 952px;background-image: url('<%=basePath %>resource/image/202111230026.png');"></div>
<%@include file="inc/top.jsp"%>
<%@include file="inc/left.jsp"%>
<div class="cbsgl_div" id="cbsgl_div">
	<div class="title_div" id="title_div">
		<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230024.png">
		<span class="cbsgl_text_span">外来承包商管理</span>
		<div class="but_div">
			<div class="but_style1_div jr_but_div">今日</div>
			<div class="but_style1_div zr_but_div">昨日</div>
			<div class="but_style2_div zjyz_but_div">最近7日</div>
			<div class="but_style2_div dcexcel_but_div">导出Excel</div>
		</div>
	</div>
	<div class="tj_info_div" id="tj_info_div">
		<div class="tool_div" id="tool_div">
			<span class="cbs_span">承包商</span>
			<select class="cbs_sel">
				<option>请选择</option>
				<option>aaaa</option>
				<option>bbbb</option>
			</select>
			<span class="sj_span">时间</span>
			<input type="text"  class="Wdate kssj_wp" placeholder="请选择开始日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" readonly="readonly"/>
			<span class="zhi_span">至</span>
			<input type="text"  class="Wdate jssj_wp" placeholder="请选择结束日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" readonly="readonly"/>
			<div class="cx_but_div">
				<span class="text_span">查询</span>
				<img alt="" src="<%=basePath %>resource/image/202111230032.png">
			</div>
		</div>
		<div class="echarts_div" id="echarts_div">
			<div class="pie_div" id="pie_div"></div>
			<div class="name_list_div">
				<div class="item_div"></div>
			</div>
		</div>
	</div>
</div>
</body>
</html>