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
<script type="text/javascript" src="<%=basePath %>resource/js/echarts.min.js"></script>
<script type="text/javascript" src="<%=basePath%>resource/js/calendar/calendar.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/calendar/WdatePicker.js"></script>
<script type="text/javascript" src="<%=basePath %>resource/js/Cesium.js"></script>
<link rel="stylesheet" href="<%=basePath %>resource/css/widgets.css">
<script>
var path='<%=basePath %>';
$(function(){
	//initViewer();
	//loadTileset();
	initGlxBarDiv()
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
	
	var znhkhDiv=$("#znhkh_div");
	znhkhDiv.css("width",(bodyWidth-leftPanelWidth-50)+"px");
	znhkhDiv.css("height",(leftPanelHeight-80)+"px");
	znhkhDiv.css("margin-top",-(leftPanelHeight-25)+"px");
	znhkhDiv.css("margin-left",(leftPanelWidth+25)+"px");
	
	var znhkhHeight=znhkhDiv.css("height");
	znhkhHeight=parseInt(znhkhHeight.substring(0,znhkhHeight.length-2));

	var znhkhTitleDiv=$("#znhkh_div #title_div");
	var znhkhTitleHeight=znhkhTitleDiv.css("height");
	znhkhTitleHeight=parseInt(znhkhTitleHeight.substring(0,znhkhTitleHeight.length-2));

	var znhkhTjInfoDiv=$("#znhkh_div #tj_info_div");
	znhkhTjInfoDiv.css("height",(znhkhHeight-znhkhTitleHeight-2)+"px");

	///
	var znhkhToolDiv=$("#znhkh_div #tool_div");
	var znhkhToolHeight=znhkhToolDiv.css("height");
	znhkhToolHeight=parseInt(znhkhToolHeight.substring(0,znhkhToolHeight.length-2));
	
	var echartsDiv=$("#znhkh_div #echarts_div");
	echartsDiv.css("height",(znhkhHeight-znhkhTitleHeight-znhkhToolHeight-50)+"px");
}

function initGlxBarDiv(){
	var chartDom = document.getElementById('glx_bar_div');
	var myChart = echarts.init(chartDom);
	var option;
	option = {
	  title: {
		  text: '各路线巡更情况',
		  textStyle:{
			  fontSize:14
		  }
	  },
	  grid:{
		  left: '4%',
		  top:'15%'
	  },
	  xAxis: {
	    type: 'category',
	    axisLine:{
            lineStyle:{
                width:1.5
            }
        },
        axisLabel: {
            //fontSize:zhxzzh,
            interval:0,
            rotate:45
        },
	    data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
	  },
	  yAxis: {
	    type: 'value',
	    axisLabel: {
            show: true,
            interval: 'auto',
            formatter: '{value}%'
        },
        splitLine: {
            lineStyle: {
                type: 'dashed'
            }
        },
      	show: true
	  },
	  series: [
	    {
	      data: [20, 40, 50, 80, 70, 11, 13],
	      type: 'bar',
	      barWidth:25,
	      barGap:'150%',/*多个并排柱子设置柱子之间的间距*/
          barCategoryGap:'150%',
	      showBackground: true,
	      backgroundStyle: {
	        color: 'rgba(180, 180, 180, 0.2)'
	      }
	    }
	  ]
	};
	option && myChart.setOption(option);
}
</script>
<title>智能化考核</title>
<style type="text/css">
.znhkh_div{
	background-color: rgba(39,42,49,0.5);
	border:1px solid rgba(39,42,49,0.5);
	position: fixed;
	border-radius:8px; 
}
.znhkh_div .title_div{
	width: 100%;
	height: 60px;
}
.znhkh_div .title_div .icon_img{
	width: 40px;
	height: 40px;
	margin-top: 10px;
	margin-left: 10px;
}
.znhkh_div .title_div .znhkh_text_span{
	margin-top: 15px;
	margin-left:30px;
	color: #fff;
	font-size:25px; 
	position: absolute;
}
.znhkh_div .title_div .but_div{
	width: 495px;
	height: 60px;
	margin-right: 50px;
	/*
	background-color: #0f0;
	*/
	float: right;
}
.znhkh_div .title_div .but_div .but_style1_div{
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
.znhkh_div .title_div .but_div .jr_but_div{
	margin-top:10px; 
}
.znhkh_div .title_div .but_div .zr_but_div{
	margin-left: 120px;
	margin-top: -42px;
}
.znhkh_div .title_div .but_div .but_style2_div{
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
.znhkh_div .title_div .but_div .zjyz_but_div{
	margin-left: 238px;
	margin-top: -41px;
}
.znhkh_div .title_div .but_div .dcexcel_but_div{
	margin-left: 373px;
	margin-top: -40px;
}
.znhkh_div .tj_info_div{
	width: 100%;
	background-color: #EFF3F6;
	padding: 1px;
}
.znhkh_div .tj_info_div .tool_div{
	width: 98%;
	height: 60px;
	margin:10px auto 0;
	background-color: #fff;
}
.znhkh_div .tj_info_div .tool_div .bm_span{
	margin-top: 15px;
	margin-left:20px; 
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .bm_sel{
	width: 100px;
	margin-top: 15px;
	margin-left: 80px;
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .ry_span{
	margin-top: 15px;
	margin-left:220px; 
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .ry_sel{
	width: 100px;
	margin-top: 15px;
	margin-left: 280px;
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .sj_span{
	margin-top: 15px;
	margin-left:420px; 
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .kssj_wp{
	width: 150px;
	margin-top: 15px;
	margin-left: 470px;
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .zhi_span{
	margin-top: 15px;
	margin-left:640px; 
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .jssj_wp{
	width: 150px;
	margin-top: 15px;
	margin-left: 670px;
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .cx_but_div{
	width: 100px;
	height: 40px;
	line-height: 40px;
	margin-top: 10px;
	margin-left:850px; 
	color: #fff;
	font-size: 18px;
	text-align: center;
	background-color: #5A61F7;
	position: absolute;
	cursor: pointer;
	border-radius: 5px;
}
.znhkh_div .tj_info_div .echarts_div{
	width: 98%;
	height: 300px;
	margin:20px auto 0;
	background-color: #fff;
	padding: 1px;
}
.znhkh_div .tj_info_div .echarts_div .bfb_div{
	width: 100%;
	height: 80px;
	margin:5px auto 0;
	/*
	background-color: #0f0;
	*/
}
.znhkh_div .tj_info_div .echarts_div .bfb_div .item_div{
	width: 32%;
	height: 80px;
}
.znhkh_div .tj_info_div .echarts_div .bfb_div .dbts_item_div{
	margin-left: 1%;
	background-color: #5BBE20;
}
.znhkh_div .tj_info_div .echarts_div .bfb_div .xglxdbl_item_div{
	margin-top: -80px;
	margin-left: 34%;
	background-color: #6B77B9;
}
.znhkh_div .tj_info_div .echarts_div .bfb_div .xgqydbl_item_div{
	margin-top: -80px;
	margin-left: 67%;
	background-color: #578ECB;
}
.znhkh_div .tj_info_div .echarts_div .bfb_div .item_div .icon_img{
	margin-top: 12px;
	margin-left: 12px;
}
.znhkh_div .tj_info_div .echarts_div .bfb_div .item_div .dbts_count_span,
.znhkh_div .tj_info_div .echarts_div .bfb_div .item_div .bfbsz_count_span{
	margin-top: 10px;
	margin-left: 10px;
	color: #fff;
	font-size: 30px;
	position: absolute;
}
.znhkh_div .tj_info_div .echarts_div .bfb_div .item_div .zts_count_span{
	margin-top: 25px;
	margin-left: 35px;
	color: #A9DAC1;
	position: absolute;
}
.znhkh_div .tj_info_div .echarts_div .bfb_div .item_div .name_span{
	margin-top: 45px;
	margin-left: 5px;
	color: #fff;
	font-size: 15px;
	position: absolute;
}
</style>
</head>
<body>
<div id="cesiumContainer" style="width: 100%;height: 952px;background-image: url('<%=basePath %>resource/image/202111230026.png');"></div>
<%@include file="inc/top.jsp"%>
<%@include file="inc/left.jsp"%>
<div class="znhkh_div" id="znhkh_div">
	<div class="title_div" id="title_div">
		<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230024.png">
		<span class="znhkh_text_span">智能化考核</span>
		<div class="but_div">
			<div class="but_style1_div jr_but_div">今日</div>
			<div class="but_style1_div zr_but_div">昨日</div>
			<div class="but_style2_div zjyz_but_div">最近7日</div>
			<div class="but_style2_div dcexcel_but_div">导出Excel</div>
		</div>
	</div>
	<div class="tj_info_div" id="tj_info_div">
		<div class="tool_div" id="tool_div">
			<span class="bm_span">部门</span>
			<select class="bm_sel">
				<option>请选择</option>
				<option>aaaa</option>
				<option>bbbb</option>
			</select>
			<span class="ry_span">人员</span>
			<select class="ry_sel">
				<option>全部</option>
				<option>李铁玉</option>
				<option>于祥海</option>
			</select>
			<span class="sj_span">时间</span>
			<input type="text"  class="Wdate kssj_wp" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" readonly="readonly"/>
			<span class="zhi_span">至</span>
			<input type="text"  class="Wdate jssj_wp" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" readonly="readonly"/>
			<div class="cx_but_div">查询</div>
		</div>
		<div class="echarts_div" id="echarts_div">
			<div class="bfb_div">
				<div class="item_div dbts_item_div">
					<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230029.png">
					<span class="dbts_count_span">0</span>
					<span class="zts_count_span">/7</span>
					<span class="name_span">达标天数</span>
				</div>
				<div class="item_div xglxdbl_item_div">
					<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230030.png">
					<span class="bfbsz_count_span">36%</span>
					<span class="name_span">巡更路线达标率</span>
				</div>
				<div class="item_div xgqydbl_item_div">
					<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230031.png">
					<span class="bfbsz_count_span">70%</span>
					<span class="name_span">巡更区域达标率</span>
				</div>
			</div>
			<div id="glx_bar_div" style="width: 1200px;height: 300px;margin-left: 10px;margin-top: 20px;"></div>
		</div>
	</div>
</div>
</body>
</html>