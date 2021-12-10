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
	initGlxBarDiv()
	initGqyBarDiv()
	resetDivSize();
});

function resetDivSize(){
	var parentDoc=window.parent.document;
	
	var rightIframe=$("#right_iframe",parentDoc);
	var rightIframeWidth=rightIframe.css("width");
	var rightIframeHeight=rightIframe.css("height");
	
	var znhkhDiv=$("#znhkh_div");
	znhkhDiv.css("width",rightIframeWidth);
	znhkhDiv.css("height",rightIframeHeight);
	
	var znhkhHeight=znhkhDiv.css("height");
	znhkhHeight=parseInt(znhkhHeight.substring(0,znhkhHeight.length-2));

	var znhkhTitleDiv=$("#znhkh_div #title_div");
	var znhkhTitleHeight=znhkhTitleDiv.css("height");
	znhkhTitleHeight=parseInt(znhkhTitleHeight.substring(0,znhkhTitleHeight.length-2));

	var znhkhTjInfoDiv=$("#znhkh_div #tj_info_div");
	znhkhTjInfoDiv.css("height",(znhkhHeight-znhkhTitleHeight-2)+"px");

	var znhkhToolDiv=$("#znhkh_div #tool_div");
	var znhkhToolHeight=znhkhToolDiv.css("height");
	znhkhToolHeight=parseInt(znhkhToolHeight.substring(0,znhkhToolHeight.length-2));
	
	var echartsDiv=$("#znhkh_div #echarts_div");
	echartsDiv.css("height",(znhkhHeight-znhkhTitleHeight-znhkhToolHeight-50)+"px");
}

function initGqyBarDiv(){
	var chartDom = document.getElementById('gqy_bar_div');
	var myChart = echarts.init(chartDom);
	var option;
	option = {
	  title: {
		  text: '各区域巡更情况',
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
	    data: [
	    	'aaaaaa', 
	    	'bbbbbb', 
	    	'cccccc', 
	    	'ddddddd', 
	    	'eeeeeeeee', 
	    	'ffffffff', 
	    	'ggggggggg',
	    	'hhhhhhhh',
	    	'iiiiiiiii',
	    	'jjjjjjj',
	    	'kkkkkkkkk',
	    	'llllllllll',
	    	'mmmmmmmmm',
	    ]
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
	      data: [20, 40, 50, 80, 70, 11, 13, 80, 70, 11, 13, 21, 18],
	      type: 'bar',
	      itemStyle: {
             normal: {
　　　　　　　　         //这里是重点
                color: function(params) {
                    return "#4492CE";
                }
             }
          },
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
	width: 570px;
	height: 60px;
	margin-right: 0px;
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
.znhkh_div .title_div .but_div .gbmb_but_img{
	width: 35px;
	height:35px; 
	margin-top: -50px;
	float: right;
	cursor:pointer;
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
	width: 160px;
	height:30px;
	margin-top: 12px;
	margin-left: 80px;
	color: #3B3B3B;
	background-color: #fff;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.znhkh_div .tj_info_div .tool_div .ry_span{
	margin-top: 15px;
	margin-left:280px; 
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .ry_sel{
	width: 100px;
	height:30px;
	margin-top: 12px;
	margin-left: 340px;
	color: #3B3B3B;
	background-color: #fff;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.znhkh_div .tj_info_div .tool_div .sj_span{
	margin-top: 15px;
	margin-left:500px; 
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .kssj_wp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 550px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.znhkh_div .tj_info_div .tool_div .zhi_span{
	margin-top: 15px;
	margin-left:720px; 
	position: absolute;
}
.znhkh_div .tj_info_div .tool_div .jssj_wp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 750px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.znhkh_div .tj_info_div .tool_div .cx_but_div{
	width: 110px;
	height: 35px;
	line-height: 35px;
	margin-top: 12px;
	margin-left:950px; 
	color: #fff;
	font-size: 16px;
	background-color: #5DC0FF;
	position: absolute;
	cursor: pointer;
	border-radius: 12px;
}
.znhkh_div .tj_info_div .tool_div .cx_but_div .text_span{
	margin-left: 20px;
}
.znhkh_div .tj_info_div .tool_div .cx_but_div img{
	margin-top: 5px;
	margin-right: 15px;
	float: right;
}
.znhkh_div .tj_info_div .echarts_div{
	width: 98%;
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
	margin-top: 48px;
	margin-left: 5px;
	color: #fff;
	font-size: 15px;
	position: absolute;
}
.znhkh_div .tj_info_div .echarts_div .glx_bar_div{
	width: 1200px;
	height: 250px;
	margin-top: 20px;
	margin-left: 10px;
}
.znhkh_div .tj_info_div .echarts_div .gqy_bar_div{
	width: 1500px;
	height: 250px;
	margin-top: 10px;
	margin-left: 10px;
}
</style>
</head>
<body>
<div class="znhkh_div" id="znhkh_div">
	<div class="title_div" id="title_div">
		<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230024.png">
		<span class="znhkh_text_span">智能化考核</span>
		<div class="but_div">
			<div class="but_style1_div jr_but_div">今日</div>
			<div class="but_style1_div zr_but_div">昨日</div>
			<div class="but_style2_div zjyz_but_div">最近7日</div>
			<div class="but_style2_div dcexcel_but_div">导出Excel</div>
			<img class="gbmb_but_img" alt="" src="<%=basePath %>resource/image/202111230033.png" onclick="$('#znhkh_div').css('display','none');">
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
			<input type="text"  class="Wdate kssj_wp" placeholder="请选择开始日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" readonly="readonly"/>
			<span class="zhi_span">至</span>
			<input type="text"  class="Wdate jssj_wp" placeholder="请选择结束日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" readonly="readonly"/>
			<div class="cx_but_div">
				<span class="text_span">查询</span>
				<img alt="" src="<%=basePath %>resource/image/202111230032.png">
			</div>
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
			<div class="glx_bar_div" id="glx_bar_div"></div>
			<div class="gqy_bar_div" id="gqy_bar_div"></div>
		</div>
	</div>
</div>
</body>
</html>