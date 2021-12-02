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
<script type="text/javascript" src="<%=basePath %>resource/js/Cesium.js"></script>
<link rel="stylesheet" href="<%=basePath %>resource/css/widgets.css">
<!-- 
<script src="https://cesiumjs.org/releases/1.56.1/Build/Cesium/Cesium.js"></script>  
<link href="https://cesiumjs.org/releases/1.56.1/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
 -->
<script>  
var path='<%=basePath %>';
//http://localhost:8080/HLRYDW/
//颜色渐变:https://www.cnblogs.com/kyshu/p/9076849.html
var lpbdMarginLeft;
var lpbdMarginLeftTimer;
var lpbdRight;
var lpbdRightTimer;
$(function(){
	//initViewer();
	//loadTileset();
	resetDivSize();
	initCQZXRSTJListPie();
	initGJJCPie();
	initRyfbtjBarDiv();
	initRyfbtjPieDiv();
});

//https://echarts.apache.org/examples/zh/editor.html?c=bar-polar-label-tangential
function initCQZXRSTJListPie(){
	initCQZXRSTJItemPie('qyyg_pie_div',"#19CDFF",2000,"#FF3950",800,"企业员工");
	initCQZXRSTJItemPie('cbs_pie_div',"#19CDFF",2000,"#57A0FC",700,"承包商");
	initCQZXRSTJItemPie('wlfk_pie_div',"#19CDFF",2000,"#FA8E0B",500,"外来访客");
	//initCQZXRSTJBarCircle();
}	

/*
//https://blog.csdn.net/a727911438/article/details/70329228/
function initCQZXRSTJBarCircle(){
	var bldWidth=$(".bar_list_div").css("width");
	bldWidth=bldWidth.substring(0,bldWidth.length-2);
	var bldItemLength=$(".bar_list_div .item_div").length;
	var bldItemWidth=bldWidth/bldItemLength;
	var bldItemBarWidth=$(".bar_list_div .item_div .bar_div").css("width");
	bldItemBarWidth=bldItemBarWidth.substring(0,bldItemBarWidth.length-2);
	
	barRadius=bldItemBarWidth/2;
	var barAngle=800*360/2000;
	//alert(Math.sin(60))
}
*/
		
function initCQZXRSTJItemPie(pieDivName,maxBgColor,maxValue,currentBgColor,currentValue,pieText){
	var chartDom = document.getElementById(pieDivName);
	var myChart = echarts.init(chartDom);
	var option;

	/*
	option = {
	  title: [
	    {
	      text: currentValue,
	      x: 'center',
	      y: 'center',
	      textStyle: {
	        color:'#0FDDCE',
	        fontSize: 20,
	        fontStyle: 'normal',
	        fontWeight: 'normal'
	      }
	    }
	  ],
	  polar: {
	    radius: [40, '60%']
	  },
	  angleAxis: {
	    max: maxValue,
	    startAngle: -90,
	    splitLine: {
	      show: false
	    },
	    axisLabel: {
	      //周围刻度线的数字
	      show: false
	    },
	    axisLine: {
	      //外环的线
	      show: false
	    },
	    axisTick: {
	      //一个一个的小刻度
	      show: false
	    }
	  },
	  radiusAxis: {
	    type: 'category'
	  },
	  tooltip: {},
	  series: {
	    type: 'bar',
	    data: [currentValue],
	    roundCap: true,
	    itemStyle: {
	      color: function (params) {
	        var colorArr = ['#5091FF', '#0FDDCE'];
	        var index = params.dataIndex;
	        return new echarts.graphic.LinearGradient(0, 0, 0, 1, [
	          {
	            offset: 0,
	            color: colorArr[0]
	          },
	          {
	            offset: 1,
	            color: colorArr[1]
	          }
	        ]);
	      }
	    },
	    coordinateSystem: 'polar'
	  }
	};
	*/
	option = {
	  color:[currentBgColor,maxBgColor],
	  series: [
	    {
	      type: 'pie',
	      radius: [25, 40],
	      center: ['50%', '50%'],
	      label:{
	    	normal:{
	    	   show:true,
		        position: 'center',
		        color:currentBgColor,
		        formatter: currentValue.toString()
	    	}
	      },
	      data: [
	        { value: currentValue},
	        { value: maxValue-currentValue}
	      ]
	    }
	  ]
	};

	option && myChart.setOption(option);
	
	$("#"+pieDivName).parent().find(".tit_div .pointer_div").css("background-color",currentBgColor);
	$("#"+pieDivName).parent().find(".tit_div .text_div").text(pieText);
}

//https://www.jianshu.com/p/4f459d16e8b4
function initRyfbtjPieDiv(){
	var chartDom = document.getElementById('ryfbtj_pie_div');
	var myChart = echarts.init(chartDom);
	var option;
	option = {
	  /*
	  toolbox: {
	    show: true,
	    feature: {
	      mark: { show: true },
	      dataView: { show: true, readOnly: false },
	      restore: { show: true },
	      saveAsImage: { show: true }
	    }
	  },
	  */
	  series: [
	    {
	      name: 'Nightingale Chart',
	      type: 'pie',
	      radius: [50, 80],
	      center: ['50%', '50%'],
	      //roseType: 'area',
	      itemStyle: {
	    	  "normal": {
		    	  "borderWidth": 5, // 间距的宽度
		    	  "borderColor": 'rgba(35,118,190,0.5)', //背景色
	    	  }
	    	 },
	      data: [
	        {value: 30, name: '废水处理区',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                        offset: 0,
                        color: '#F1DD21'
                    }, {
                        offset: 1,
                        color: '#FB8509'
                    }])
	        	}
	        }},
	        {value: 40, name: '化盐池',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                        offset: 0,
                        color: '#3E94FF'
                    }, {
                        offset: 1,
                        color: '#7A46FF'
                    }])
	        	}
	        }},
	        {value: 10, name: '二车间',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                        offset: 0,
                        color: '#60A5FB'
                    }, {
                        offset: 1,
                        color: '#519DFC'
                    }])
	        	}
	        }},
	        {value: 60, name: '一车间',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                        offset: 0,
                        color: '#FF995E'
                    }, {
                        offset: 1,
                        color: '#FF2C4E'
                    }])
	        	}
	        }},
	        {value: 6, name: '仓库A',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                        offset: 0,
                        color: '#29C0F8'
                    }, {
                        offset: 1,
                        color: '#2AF0E4'
                    }])
	        	}
	        }},
	        {value: 8, name: '变电所',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
                        offset: 0,
                        color: '#22BCFF'
                    }, {
                        offset: 1,
                        color: '#0BE8FF'
                    }])
	        	}
	        }}
	      ],
	      label: {
	        color: 'rgb(255, 255, 255)',
	        textStyle : {
	           fontWeight : 'normal',
	           fontSize : 15
	        },
	        formatter: function (params) {
	        	//console.log(params)
                return params.name + " " + params.value + "人";
            }
	      }
	    }
	  ]
	};
	option && myChart.setOption(option);
}

//https://blog.csdn.net/weixin_44217525/article/details/108279831
function initRyfbtjBarDiv(){
	var chartDom = document.getElementById('ryfbtj_bar_div');
	var myChart = echarts.init(chartDom);
	var option;
	option = {
	  xAxis: {
	    type: 'category',
	    axisLine:{
            lineStyle:{
                color:"#fff",
                width:0.5
            }
        },
        axisLabel: {
            //fontSize:zhxzzh,
            interval:0,
            rotate:45
        },
	    data: ['一车间', '仓库A', '变电所', '二车间', '废水处理区', '化盐池']
	  },
	    yAxis: [
	        {
	        	type:'value',
                minInterval: 1,
                axisLine:{
                    lineStyle:{
                        color:"#fff",
                        width:0.5
                    }
                },
                axisLabel:{
                    fontSize:9
                },
	        }
	    ],
	  series: [
	    {
	      data: [120, 200, 150, 80, 70, 110],
	      type: 'bar',
	      barWidth:25,
	      itemStyle:{
	    	  color: function(params){
	    		  var colorList = [
	    			  ["#FF995E","#FF2C4E"],
	    			  ["#60A5FB","#519DFC"],
	    			  ["#22BCFF","#0BE8FF"],
	    			  ["#3E94FF","#7A46FF"],
	    			  ["#F1DD21","#FB8509"],
	    			  ["#29C0F8","#2AF0E4"],
	    		  ];
	    		  var index = params.dataIndex;
	    		  return new echarts.graphic.LinearGradient(0, 0, 0, 1, [
	    			  {
	                    offset: 0,
	                    color: colorList[index][0]
	                  }, 
	                  {
	                    offset: 1,
	                    color: colorList[index][1]
	                  }
	              ])
	    	  }
	      }
	    }
	  ]
	};
	option && myChart.setOption(option);
}

function initGJJCPie(){
	var chartDom = document.getElementById('gjjc_pie_div');
	var myChart = echarts.init(chartDom);
	var option;

	option = {
	  /*
	  legend: {
		icon: "circle",
		width:300,
		itemWidth: 20,  // 设置宽度
	　　 itemHeight: 20, // 设置高度
	　　 itemGap: 50, // 设置间距
		top: "bottom",
        textStyle: { //图例文字的样式
            color: '#fff',
            fontSize: 16
        }
	  },        
	  */
	  series: [
	    {
	      type: 'pie',
	      radius: [55, 80],
	      center: ['50%', '50%'],
	      data: [
	        { value: 69, name: '标签电压告警',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{ //颜色渐变函数 前四个参数分别表示四个位置依次为左、下、右、上
                        offset: 0,
                        color: '#29C0F8'
                    }, {
                        offset: 1,
                        color: '#2AF0E4'
                    }])
	        	}
	        }},
	        { value: 168, name: '其他告警',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
	        			offset: 0,
                        color: '#60A5FB'
                    }, {
                        offset: 1,
                        color: '#519DFC'
                    }])
	        	}
	        }},
	        { value: 132, name: '休眠超时告警',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
	        			offset: 0,
                        color: '#22BCFF'
                    }, {
                        offset: 1,
                        color: '#0BE8FF'
                    }])
	        	}
	        }},
	        { value: 31, name: '电子围栏告警',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
	        			offset: 0,
                        color: '#3E94FF'
                    }, {
                        offset: 1,
                        color: '#7A46FF'
                    }])
	        	}
	        }},
	        { value: 298, name: '滞留告警',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
	        			offset: 0,
                        color: '#F1DD21'
                    }, {
                        offset: 1,
                        color: '#FB8509'
                    }])
	        	}
	        }},
	        { value: 302, name: 'SOS告警',itemStyle:{
	        	normal:{
	        		color: new echarts.graphic.LinearGradient(1, 0, 0, 0, [{
	        			offset: 0,
                        color: '#FF995E'
                    }, {
                        offset: 1,
                        color: '#FF2C4E'
                    }])
	        	}
	        }},
	      ],
	      label:{
	    	  color:"rgb(255,255,255)",
	          textStyle : {
		         fontWeight : 'normal',
		         fontSize : 15
		      },
		      formatter: function (params) {
		         //console.log(params)
	             return params.value;
	          }
	      }
	    }
	  ]
	};

	option && myChart.setOption(option);
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
	
	var panelMarginTop=-(bodyHeight-topDivHeight-20);
	var leftPanelBgDiv=$("#left_panel_bg_div");
	leftPanelBgDiv.css("margin-top",panelMarginTop+"px");
	var leftPanelDiv=$("#left_panel_div");
	leftPanelDiv.css("margin-top",panelMarginTop+"px");
	lpbdMarginLeft=leftPanelBgDiv.css("margin-left");
	lpbdMarginLeft=lpbdMarginLeft.substring(0,lpbdMarginLeft.length-2);

	var rightPanelBgDiv=$("#right_panel_bg_div");
	rightPanelBgDiv.css("margin-top",panelMarginTop+"px");
	var rightPanelDiv=$("#right_panel_div");
	rightPanelDiv.css("margin-top",panelMarginTop+"px");
	lpbdRight=rightPanelBgDiv.css("right");
	lpbdRight=lpbdRight.substring(0,lpbdRight.length-2);
}

function initViewer(){
	viewer = new Cesium.Viewer('cesiumContainer',{
        animation:false,    //左下角的动画仪表盘
        baseLayerPicker:false,  //右上角的图层选择按钮
        geocoder:false,  //搜索框
        homeButton:false,  //home按钮
        sceneModePicker:false, //模式切换按钮
        timeline:false,    //底部的时间轴
        navigationHelpButton:false,  //右上角的帮助按钮
        fullscreenButton:false   //右下角的全屏按钮
	});
	
	/*
	//获取经纬度、高度链接：https://www.cnblogs.com/telwanggs/p/11289455.html
	//获取事件触发所在的  html Canvas容器
    var canvas=viewer.scene.canvas;

    //获取事件句柄
    var handler=new Cesium.ScreenSpaceEventHandler(canvas);

    //处理事件函数
    handler.setInputAction(function(movement){

        //拾取笛卡尔坐标
        var ellipsoid=viewer.scene.globe.ellipsoid;//全局椭球体
        var cartesian=viewer.scene.camera.pickEllipsoid(movement.endPosition,ellipsoid)//拾取鼠标在椭圆上的结束点笛卡尔坐标点
        //转化笛卡尔坐标 为经纬度
        var mesDom=document.getElementById('mes');
        if(cartesian){
            var cartographic=ellipsoid.cartesianToCartographic(cartesian);//笛卡尔坐标转制图坐标
            //var coordinate="经度:"+Cesium.Math.toDegrees(cartographic.longitude).toFixed(2)+",纬度:"+Cesium.Math.toDegrees(cartographic.latitude).toFixed(2)+
                    "相机高度:"+Math.ceil(viewer.camera.positionCartographic.height);
            var coordinate="经度:"+Cesium.Math.toDegrees(cartographic.longitude)+",纬度:"+Cesium.Math.toDegrees(cartographic.latitude)+
            "相机高度:"+Math.ceil(viewer.camera.positionCartographic.height);
			console.log("coordinate==="+coordinate);
        }else{
        	
        }
    },Cesium.ScreenSpaceEventType.MOUSE_MOVE);//监听的是鼠标滑动事件
	*/
}

function loadTileset(){
	var tileset = new Cesium.Cesium3DTileset({
	   url: "http://localhost:8080/PositionPhZY/upload/b3dm/tileset.json",
	   shadows:Cesium.ShadowMode.DISABLED,//去除阴影
	});
	console.log(tileset)
	viewer.scene.primitives.add(tileset);
	tileset.readyPromise.then(function(tileset) {
	   viewer.camera.viewBoundingSphere(tileset.boundingSphere, new Cesium.HeadingPitchRange(0, -0.5, 0));
	   //viewer.scene.primitives.remove(tileset);
	   resetDivSize();
	}).otherwise(function(error) {
	    throw(error);
	});

	/*
	var position = Cesium.Cartesian3.fromDegrees(milkTruckEnLong,milkTruckEnLat, 20);
	   var heading = Cesium.Math.toRadians(135);
	   var pitch = 0;
	   var roll = 0;
	   var hpr = new Cesium.HeadingPitchRoll(heading, pitch, roll);
	   var orientation = Cesium.Transforms.headingPitchRollQuaternion(position, hpr);
	 
	   var entity = viewer.entities.add({
		   id:"milkTruck",
	       position : position,
	       orientation : orientation,
	       model : {
	           uri: "http://localhost:8080/PositionPhZY/upload/CesiumMilkTruck.gltf",
	           //uri: "http://localhost:8080/PositionPhZY/upload/Cesium_Air.glb",
	           minimumPixelSize : 128,
	           maximumScale : 20000
	       }
	   });
	   viewer.trackedEntity = entity;
	
	tileset = new Cesium.Cesium3DTileset({
	   url: "http://localhost:8080/PositionPhZY/upload/model2/tileset.json",
	   shadows:Cesium.ShadowMode.DISABLED,//去除阴影
	});
	viewer.scene.primitives.add(tileset);
	tileset.readyPromise.then(function(tileset) {
	   viewer.camera.viewBoundingSphere(tileset.boundingSphere, new Cesium.HeadingPitchRange(0, -0.5, 0));
	   var cartographic = Cesium.Cartographic.fromCartesian(tileset.boundingSphere.center);
	   console.log(cartographic);
	   setTimeout(function(){
		   //viewer.scene.primitives.remove(tileset);
		   //viewer.scene.primitives.removeAll();
	   },"10000");
	}).otherwise(function(error) {
	    throw(error);
	});
	*/
}

function openLeftPanelDiv(){
	var flag;
	if(lpbdMarginLeft==-536)
		flag=true;
	else if(lpbdMarginLeft==10)
		flag=false;
	lpbdMarginLeftTimer=setInterval(() => {
		changeLeftPanelWidth(flag);
	}, 10);
}

function changeLeftPanelWidth(flag){
	if(flag){
		lpbdMarginLeft+=10;
		if(lpbdMarginLeft>10)
			lpbdMarginLeft=10;
	}
	else{
		lpbdMarginLeft-=10;
		if(lpbdMarginLeft<-536)
			lpbdMarginLeft=-536;
	}

	console.log("lpbdMarginLeft="+lpbdMarginLeft)
	if(lpbdMarginLeft==10||lpbdMarginLeft==-536)
		clearInterval(lpbdMarginLeftTimer);
	$("#left_panel_bg_div").css("margin-left",lpbdMarginLeft+"px");
	$("#left_panel_div").css("margin-left",lpbdMarginLeft+"px");
}

function openRightPanelDiv(){
	var flag;
	if(lpbdRight==-550)
		flag=true;
	else if(lpbdRight==0)
		flag=false;
	lpbdRightTimer=setInterval(() => {
		changeRightPanelWidth(flag);
	}, 10);
}

function changeRightPanelWidth(flag){
	if(flag){
		lpbdRight+=10;
		if(lpbdRight>550)
			lpbdRight=550;
	}
	else{
		lpbdRight-=10;
		if(lpbdRight<-550)
			lpbdRight=550;
	}

	console.log("lpbdRight="+lpbdRight)
	if(lpbdRight==0||lpbdRight==-550)
		clearInterval(lpbdRightTimer);
	$("#right_panel_bg_div").css("right",lpbdRight+"px");
	$("#right_panel_div").css("right",lpbdRight+"px");
	$("#right_panel_div #open_but_div").css("right",550+lpbdRight+"px");//从左往右移动，从右面板的宽度里减去已移动过去的宽度
}
</script>  
<title>Insert title here</title>
<style type="text/css">
.left_panel_bg_div{
	width: 546px;
	height: 830px;
	background-image: url('resource/image/202111230004.png');
	position:fixed; 
}
.left_panel_div{
	width: 546px;
	height: 830px;
	/*
	background-color: rgba(35,118,190,0.5);
	*/
	position: fixed;
}
.left_panel_div .cqzxrstj_div{
	width: 100%;
	height: 200px;
	/*
	background-color: #00f;
	*/
}
.left_panel_div .cqzxrstj_div .title_div,
.left_panel_div .gjjc_div .title_div,
.right_panel_div .ssgj_div .title_div,
.right_panel_div .ryfbtj_div .title_div{
	width: 439px;
	height: 38px;
	line-height: 38px;
	margin:auto;
	color:#fff;
	font-size:19px;
	font-weight: bold;
	text-align: center;
	background-image: url("resource/image/202111230028.png");
}
.left_panel_div .cqzxrstj_div .pie_list_div{
	width: 490px;
	height: 100px;
	margin-top:20px;
	/*
	background-color: #0ff;
	*/
}
.left_panel_div .cqzxrstj_div .pie_list_div .item_div{
	width: 33%;height: 100px;
}
.left_panel_div .cqzxrstj_div .pie_list_div .cbs_item_div{
	margin-top: -100px;margin-left: 33%;
}
.left_panel_div .cqzxrstj_div .pie_list_div .wlfk_item_div{
	margin-top: -100px;margin-left: 66%;
}
.left_panel_div .cqzxrstj_div .pie_list_div .item_div .tit_div{
	width: 100px;height: 20px;line-height: 20px;margin: auto;color:#fff;
}
.left_panel_div .cqzxrstj_div .pie_list_div .item_div .tit_div .pointer_div{
	width: 15px;height: 10px;border-radius:5px;
}
.left_panel_div .cqzxrstj_div .pie_list_div .item_div .tit_div .text_div{
	margin-left: 30px;margin-top: -18px;
}
.left_panel_div .cqzxrstj_div .pie_list_div .item_div .pie_div{
	width: 80px;height: 80px;margin: auto;
}
.left_panel_div .cqzxrstj_div .ycrstj_div{
	width: 280px;
	margin: 40px auto 0;
	/*
	background-color: #f0f;
	*/
}
.left_panel_div .cqzxrstj_div .ycrstj_div .text_span{
	color:#fff;
}
.left_panel_div .cqzxrstj_div .ycrstj_div .renShu_span{
	color:#f00;
}
.left_panel_div .cqzxrstj_div .ycrstj_div .djck_a{
	margin-left:10px;
	color:#00f;
}
.left_panel_div .gjjc_div{
	width: 100%;
	height: 300px;
	margin-top: 40px;
}
.left_panel_div .gjjc_div .pie_div{
	width: 100%;
	height: 250px;
	margin-top: 20px;
}
.left_panel_div .gjjc_div .center_img{
	width: 70px;
	height: 91px;
	margin-top: -170px;
	margin-left: 237px;
}
.left_panel_div .gjjc_div .legend_div{
	width: 300px;
	height: 150px;
	margin:0 auto;
}
.left_panel_div .gjjc_div .legend_div .item_div{
	width:150px;
	height: 55px;
}
.left_panel_div .gjjc_div .legend_div .qtgj_item_div,
.left_panel_div .gjjc_div .legend_div .dzwlgj_item_div,
.left_panel_div .gjjc_div .legend_div .sosgj_item_div{
	margin-top: -55px;
	margin-left: 150px;
}
.left_panel_div .gjjc_div .legend_div .item_div .icon_div{
	width: 20px;
	height:20px;
	margin-top:15px;
	position: absolute;
	border-radius:10px;
}
.left_panel_div .gjjc_div .legend_div .item_div .bqdygj_icon_div{
	background:linear-gradient(to left,#29C0F8,#2AF0E4);
}
.left_panel_div .gjjc_div .legend_div .item_div .qtgj_icon_div{
	background:linear-gradient(to left,#60A5FB,#519DFC);
}
.left_panel_div .gjjc_div .legend_div .item_div .xmcsgj_icon_div{
	background:linear-gradient(to left,#22BCFF,#0BE8FF);
}
.left_panel_div .gjjc_div .legend_div .item_div .dzwlgj_icon_div{
	background:linear-gradient(to left,#3E94FF,#7A46FF);
}
.left_panel_div .gjjc_div .legend_div .item_div .zlgj_icon_div{
	background:linear-gradient(to left,#F1DD21,#FB8509);
}
.left_panel_div .gjjc_div .legend_div .item_div .sosgj_icon_div{
	background:linear-gradient(to left,#FF995E,#FF2C4E);
}
.left_panel_div .gjjc_div .legend_div .item_div .text_div{
	width:115px;
	height: 50px;
	line-height: 50px;
	margin-left: 35px;
	color: #fff;
	font-size: 15px;
}
.left_panel_div .open_but_div{
	width: 10px;
	height: 100px;
	margin-left:533px;
	margin-top:-136px;
	/*
	background-color: #00f;
	*/
	position:fixed; 
}

.right_panel_bg_div{
	width: 566px;
	height: 925px;
	right:0;
	background-image: url('resource/image/202111230005.png');
	position:fixed; 
}
.right_panel_div{
	width: 566px;
	height: 780px;
	right:0;
	/*
	background-color: rgba(35,118,190,0.5);
	*/
	position: fixed;
}
.right_panel_div .ssgj_div{
	width: 100%;
	height: 270px;
	/*
	background: #00f;
	*/
}
.right_panel_div .ssgj_div .list_div{
	width: 70%;
	height: 120px;
	margin-top: 40px;
	margin-left: 110px;
	/*
	background: #0f0;
	*/
}
.right_panel_div .ssgj_div .list_div .item_div{
	width: 100%;
	height: 40px;
	line-height: 40px;
}
.right_panel_div .ssgj_div .list_div .item_div .dot_div{
	width: 6px;
	height: 6px;
	margin-top: 18px;
	background-color: #FF5200;
	border-radius:3px;
	position: absolute;
}
.right_panel_div .ssgj_div .list_div .item_div .text_span{
	color: #FF5200;
}
.right_panel_div .ssgj_div .list_div .item_div .name_span{
	margin-left: 12px;
}
.right_panel_div .ssgj_div .list_div .item_div .but_div{
	width: 100px;
	height: 30px;
	line-height: 30px;
	margin-top: 5px;
	color:#00304C;
	font-weight:bold;
	text-align:center;
	cursor:pointer;
	border-radius:10px;
	float: right;
}
.right_panel_div .ssgj_div .list_div .item_div .ycl_but_div{
	background-color: #00F6FF;
}
.right_panel_div .ssgj_div .list_div .item_div .wcl_but_div{
	background-color: #FA1B04;
}
.right_panel_div .ssgj_div .jrbjym_but_div{
	width: 210px;
	height: 55px;
	line-height: 55px;
	margin:20px auto 0; 
	color:#fff;
	font-size:23px;
	text-align:center;
	background-color: #00B551;
	cursor:pointer;
	border-radius:10px;
}
.right_panel_div .ryfbtj_div{
	width: 100%;
	height: 430px;
	margin-top: 25px;
	/*
	background-color: #f00;
	*/
}
.right_panel_div .ryfbtj_div .bar_div{
	width: 100%;
	height: 250px;
	margin-top: -30px;
}
.right_panel_div .ryfbtj_div .pie_div{
	width: 100%;
	height: 250px;
}
.right_panel_div .open_but_div{
	width: 10px;
	height: 100px;
	right:550px;
	margin-top:-315px;
	/*
	background-color: #00f;
	*/
	position:fixed; 
}
</style>
</head>
<body>
<div id="cesiumContainer" style="width: 100%;height: 952px;background-image: url('<%=basePath %>resource/image/202111230026.png');"></div>
<%@include file="inc/top.jsp"%>
<div class="left_panel_bg_div" id="left_panel_bg_div"></div>
<div class="left_panel_div" id="left_panel_div">
	<div class="cqzxrstj_div">
		<div class="title_div">厂区在线人数统计</div>
		<div class="pie_list_div">
			<div class="item_div">
				<div class="tit_div">
					<div class="pointer_div"></div>
					<div class="text_div"></div>
				</div>
				<div class="pie_div" id="qyyg_pie_div"></div>
			</div>
			<div class="item_div cbs_item_div">
				<div class="tit_div">
					<div class="pointer_div"></div>
					<div class="text_div"></div>
				</div>
				<div class="pie_div" id="cbs_pie_div"></div>
			</div>
			<div class="item_div wlfk_item_div">
				<div class="tit_div">
					<div class="pointer_div"></div>
					<div class="text_div"></div>
				</div>
				<div class="pie_div" id="wlfk_pie_div"></div>
			</div>
		</div>
		<div class="ycrstj_div">
			<span class="text_span">异常人数统计：</span>
			<span class="renShu_span">10</span>
			<span class="text_span">人</span>
			<a class="djck_a">点击查看</a>
		</div>
	</div>
	<div class="gjjc_div">
		<div class="title_div">告警检测</div>
		<div class="pie_div" id="gjjc_pie_div">
		</div>
		<img class="center_img" alt="" src="<%=basePath %>resource/image/202111230001.png">
		<div class="legend_div">
			<div class="item_div">
				<div class="icon_div bqdygj_icon_div"></div>
				<div class="text_div">标签电压告警</div>
			</div>
			<div class="item_div qtgj_item_div">
				<div class="icon_div qtgj_icon_div"></div>
				<div class="text_div">其他告警</div>
			</div>
			<div class="item_div">
				<div class="icon_div xmcsgj_icon_div"></div>
				<div class="text_div">休眠超时告警</div>
			</div>
			<div class="item_div dzwlgj_item_div">
				<div class="icon_div dzwlgj_icon_div"></div>
				<div class="text_div">电子围栏告警</div>
			</div>
			<div class="item_div">
				<div class="icon_div zlgj_icon_div"></div>
				<div class="text_div">滞留告警</div>
			</div>
			<div class="item_div sosgj_item_div">
				<div class="icon_div sosgj_icon_div"></div>
				<div class="text_div">SOS告警</div>
			</div>
		</div>
	</div>
	<div class="open_but_div" id="open_but_div" onclick="openLeftPanelDiv()"></div>
</div>

<div class="right_panel_bg_div" id="right_panel_bg_div"></div>
<div class="right_panel_div" id="right_panel_div">
	<div class="ssgj_div">
		<div class="title_div">实时告警</div>
		<div class="list_div">
			<div class="item_div">
				<div class="dot_div"></div>
				<span class="text_span name_span">王明阳</span><span class="text_span">工号</span><span class="text_span">004</span><span class="text_span">触发</span><span class="text_span">围栏报警</span>
				<div class="but_div ycl_but_div">已处理</div>
			</div>
			<div class="item_div">
				<div class="dot_div"></div>
				<span class="text_span name_span">李天亯</span><span class="text_span">工号</span><span class="text_span">007</span><span class="text_span">触发</span><span class="text_span">滞留报警</span>
				<div class="but_div ycl_but_div">已处理</div>
			</div>
			<div class="item_div">
				<div class="dot_div"></div>
				<span class="text_span name_span">李铁玉</span><span class="text_span">工号</span><span class="text_span">013</span><span class="text_span">触发</span><span class="text_span">SOS报警</span>
				<div class="but_div wcl_but_div">未处理</div>
			</div>
		</div>
		<div class="jrbjym_but_div">进入报警页面</div>
	</div>
	<div class="ryfbtj_div">
		<div class="title_div">人员分布统计</div>
		<div class="bar_div" id="ryfbtj_bar_div"></div>
		<div class="pie_div" id="ryfbtj_pie_div"></div>
	</div>
	<div class="open_but_div" id="open_but_div" onclick="openRightPanelDiv()"></div>
</div>
</body>
</html>