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
	initQYTJDiv();
	initGZSJBarDiv();
	resetDivSize();
});

function initGZSJBarDiv(){
	var chartDom = document.getElementById('bar_div');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
	  title: {
		  text: '工作时间投入比:',
		  textStyle:{
			  fontSize:17
		  }
	  },
	  tooltip: {
	    trigger: 'axis',
	    axisPointer: {
	      type: 'shadow'
	    }
	  },
	  legend: {
	  	textStyle: {
          color: "#393333",
          fontSize: 16,
          fontFamily: "微软雅黑"
        },
        itemGap:120,
		itemWidth:35,
        itemHeight:35,
	    data: ['工作时区长', '休息时区长'],
	    top: 'bottom',
	  },
	  grid:{
		  left: '6%',
		  top:'15%'
	  },
	  color:["#2B5D88","#447FB8"],
	  xAxis: [
	    {
	      type: 'category',
	      axisTick: { show: false },
	      data: ['2021-8-16', '2021-8-18', '2021-8-20', '2021-8-22', '2021-8-24']
	    }
	  ],
	  yAxis: [
	    {
	      type: 'value',
          splitLine: {
              lineStyle: {
                  color:'#F0E8D1'
              }
          }
	    }
	  ],
	  series: [
	    {
	      name: '工作时区长',
	      type: 'bar',
	      barWidth:20,
	      barGap:'20%',/*多个并排柱子设置柱子之间的间距*/
          barCategoryGap:'150%',
	      data: [320, 332, 301, 334, 390]
	    },
	    {
	      name: '休息时区长',
	      type: 'bar',
	      barWidth:20,
	      barGap:'20%',/*多个并排柱子设置柱子之间的间距*/
          barCategoryGap:'150%',
	      data: [220, 182, 191, 234, 290]
	    }
	  ]
	};

	option && myChart.setOption(option);
}

//https://jshare.com.cn/demos/hhhhiG?hc-theme=sand-signika
function initQYTJDiv(){
	var colorArr=['#4C87B9','#73BA44','#D35A28','#7DCDD7','#136728','#8883D7'];
	var seriesDataList=[];
	seriesDataList.push({name:'工作区',y:45.0});
	seriesDataList.push({name:'水处理工作区',y:26.8});
	seriesDataList.push({name:'房一工作区',y:12.8});
	seriesDataList.push({name:'房二工作区',y:8.5});
	seriesDataList.push({name:'房三工作区',y:6.2});
	seriesDataList.push({name:'房四工作区',y:3.7});
	
	initQYPieDiv(colorArr,seriesDataList);
	initPieLegendDiv(colorArr,seriesDataList);
	
}

function initQYPieDiv(colorArr,seriesDataList){
	var chart = Highcharts.chart('pie_div', {
		chart: {
			type: 'pie',
			width:1300,
			height:300,
			options3d: {
				enabled: true,
				alpha: 60,
				beta: 0
			}
		},
		title: {
			text: "<span style=\"font-weight:bold;\">各区域总时长:</span><span style=\"color:#0F83E5;font-weight:bold;\">29天6小时10分20秒</span>",
			align:"left"
		},
		/*
		tooltip: {
			pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		*/
		exporting: {//去除右上角图标
            enabled:false
        },
		credits:{//去除右下角highchart.com
			enabled:false
		},
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

function initPieLegendDiv(colorArr,seriesDataList){
	var pieLegendDiv=$("#pie_legend_div")
	//pieLegendDiv.empty();
	var appendStr="";
	for(var i=0;i<colorArr.length;i++){
		if(i==4)
			break;
		appendStr="<div class=\"item_div\">"
						+"<div class=\"ysfk_div\" style=\"background-color:"+colorArr[i]+"\"></div>"
						+"<span class=\"name_span\">"+seriesDataList[i].name+"</span>"
					+"</div>";
		pieLegendDiv.append(appendStr);
	}
	appendStr="<div class=\"syy_but_div\"></div>"
			+"<div class=\"syy_but_bg_div\" onclick=\"alert(1)\"></div>"
			+"<span class=\"ym_span\">1/2</span>"
			+"<div class=\"xyy_but_div\"></div>"
			+"<div class=\"xyy_but_bg_div\" onclick=\"alert(2)\"></div>";
	pieLegendDiv.append(appendStr);

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
	width: 1300px;
	height: 300px;
	margin-top: 10px;
	margin-left: 10px;
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div{
	width: 200px;
	height: 163px;
	margin-top: -230px;
	margin-left:68px; 
	/*
	background-color: #0f0;
	*/
	position: absolute;
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div .item_div{
	width: 100%;
	height: 30px;
	/*
	background-color: #00f;
	*/
	padding: 1px;
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div .item_div .ysfk_div{
	width: 15px;
	height: 15px;
	margin-top:7px; 
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div .item_div .name_span{
	margin-top:-18px;
	margin-left: 20px;
	font-size:14px; 
	font-weight:bold;
	position: absolute;
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div .syy_but_div{
    width: 0px;
    height: 0px;
	border-style: solid;
    border-width: 10px 10px 15px 10px;
    border-color: transparent transparent #CCCBCC transparent;
    cursor: pointer;
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div .syy_but_bg_div{
	width: 20px;
    height: 15px;
    margin-top:-15px;
    cursor: pointer;
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div .ym_span{
	margin-top:-18px;
	margin-left:25px;
	font-weight:bold;
	position: absolute;
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div .xyy_but_div{
    width: 0px;
    height: 0px;
    margin-top:-15px;
    margin-left:60px;
	border-style: solid;
    border-width: 15px 10px 10px 10px;
    border-color: #D35A28 transparent transparent transparent;
}
.cbsgl_div .tj_info_div .echarts_div .pie_legend_div .xyy_but_bg_div{
	width: 20px;
    height: 15px;
    margin-top:-25px;
    margin-left:60px;
    cursor: pointer;
}
.cbsgl_div .tj_info_div .echarts_div .bar_div{
	width: 1400px;
	height: 300px;
	margin-top: 10px;
	margin-left: 15px;
}
.cbsgl_div .tj_info_div .echarts_div .gzsjtrb_span{
	margin-top: -300px;
	margin-left: 150px;
	color:#0F83E5;
	font-size:20px;
	font-weight:bold;
	position: absolute;
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
			<div class="pie_legend_div" id="pie_legend_div">
			</div>
			<div class="bar_div" id="bar_div"></div>
			<span class="gzsjtrb_span">67%</span>
		</div>
	</div>
</div>
</body>
</html>