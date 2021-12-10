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
	
	lpdMarginLeft=leftPanelDiv.css("margin-left");
	lpdMarginLeft=lpdMarginLeft.substring(0,lpdMarginLeft.length-2);
	
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
	lsgjMapDiv.css("height",(lsgjHeight-lsgjTitleHeight-lsgjToolHeight-lsgjSpaceHeight)+"px");
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
.lsgj_div .title_div .gbmb_but_img{
	width: 35px;
	height:35px; 
	float: right;
	cursor:pointer;
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
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 100px;
	color: #3B3B3B;
	background-color: #fff;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.lsgj_div .tool_div .ry_span{
	margin-top: 15px;
	margin-left:295px; 
	position: absolute;
}
.lsgj_div .tool_div .ry_inp{
	width: 120px;
	height:26px;
	margin-top: 12px;
	margin-left: 350px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.lsgj_div .tool_div .sj_span{
	margin-top: 15px;
	margin-left:520px; 
	position: absolute;
}
.lsgj_div .tool_div .rq_wp{
	width: 100px;
	height:30px;
	margin-top: 12px;
	margin-left: 570px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.lsgj_div .tool_div .kssj_wp{
	width: 120px;
	height:30px;
	margin-top: 12px;
	margin-left: 690px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.lsgj_div .tool_div .zhi_span{
	margin-top: 15px;
	margin-left:830px; 
	position: absolute;
}
.lsgj_div .tool_div .jssj_wp{
	width: 120px;
	height:30px;
	margin-top: 12px;
	margin-left: 865px;
	position: absolute;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	border-radius:5px; 
}
.lsgj_div .tool_div .cx_but_div{
	width: 110px;
	height: 35px;
	line-height: 35px;
	margin-top: 12px;
	margin-left:1020px; 
	color: #fff;
	font-size: 16px;
	background-color: #5DC0FF;
	position: absolute;
	cursor: pointer;
	border-radius: 12px;
}
.lsgj_div .tool_div .cx_but_div .text_span{
	margin-left: 20px;
}
.lsgj_div .tool_div .cx_but_div img{
	margin-top: 5px;
	margin-right: 15px;
	float: right;
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
		<img class="gbmb_but_img" alt="" src="<%=basePath %>resource/image/202111230033.png" onclick="$('#lsgj_div').css('display','none');">
	</div>
	<div class="tool_div" id="tool_div">
		<span class="xzdt_span">选择地图</span>
		<select class="xzdt_sel">
			<option>请选择</option>
			<option>一层</option>
			<option>二层</option>
		</select>
		<span class="ry_span">人员</span>
		<input class="ry_inp" type="text" placeholder="请输入人员姓名"/>
		<span class="sj_span">时间</span>
		<input type="text"  class="Wdate rq_wp" placeholder="请选择日期" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' })" readonly="readonly"/>
		<input type="text"  class="Wdate kssj_wp" placeholder="请选择开始时间" onclick="WdatePicker({ dateFmt: 'HH:mm:ss' })" readonly="readonly"/>
		<span class="zhi_span">至</span>
		<input type="text"  class="Wdate jssj_wp" placeholder="请选择结束时间" onclick="WdatePicker({ dateFmt: 'HH:mm:ss' })" readonly="readonly"/>
		<div class="cx_but_div">
			<span class="text_span">查询</span>
			<img alt="" src="<%=basePath %>resource/image/202111230032.png">
		</div>
	</div>
	<div class="space_div" id="space_div"></div>
	<div class="map_div" id="map_div" style="width: 100%;background-color: #fff;"></div>
</div>
</body>
</html>