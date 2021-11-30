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
<script type="text/javascript" src="<%=basePath %>resource/js/Cesium.js"></script>
<link rel="stylesheet" href="<%=basePath %>resource/css/widgets.css">
<!-- 
<script src="https://cesiumjs.org/releases/1.56.1/Build/Cesium/Cesium.js"></script>  
<link href="https://cesiumjs.org/releases/1.56.1/Build/Cesium/Widgets/widgets.css" rel="stylesheet">
 -->
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
	
	var leftPanelHeight=leftPanelDiv.css("height");
	var rightPanelDiv=$("#right_panel_div");
	leftPanelHeight=leftPanelHeight.substring(0,leftPanelHeight.length-2);
	rightPanelDiv.css("margin-top",-(leftPanelHeight-350)+"px");
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

function showChildMenu(pointerImgId){
	var pointerImgIdNum=pointerImgId.substring(11);
	var display=$("#child_item_list_div"+pointerImgIdNum).css("display");
	if(display=="none"){
		$("#pointer_img"+pointerImgIdNum).attr("src",path+"resource/image/202111230012.png");
		$("#child_item_list_div"+pointerImgIdNum).css("display","block");
	}
	else{
		$("#pointer_img"+pointerImgIdNum).attr("src",path+"resource/image/202111230011.png");
		$("#child_item_list_div"+pointerImgIdNum).css("display","none");
	}
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
	font-size:17px;
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
	width: 20px;
	height: 20px;
	margin-top: 10px;
	margin-right: 20px;
	float: right;
}
.left_panel_div .menu_list_div .child_item_list_div{
	width: 100%;
	display: none;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div{
	width: 180px;
	height: 30px;
	line-height: 30px;
	margin:auto;
	font-size:15px;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div .child_name_div{
	width: 100px;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div .child_rs_div{
	margin-top: -30px;
	margin-left:100px;
}

.right_panel_div{
	width: 60px;
	height: 380px;
	right:80px;
	background-color: rgba(29,42,50,0.5);
	border:#3E8654 solid 2px;
	position: fixed;
}
.right_panel_div .img1{
	width: 50px;
	height: 50px;
	margin-top: 15px;
	margin-left: 5px;
}
.right_panel_div .img2{
	width: 50px;
	height: 50px;
	margin-top: 10px;
	margin-left: 5px;
}
.right_panel_div .img3{
	width: 50px;
	height: 50px;
	margin-top: 5px;
	margin-left: 5px;
}
.right_panel_div .img4{
	width: 50px;
	height: 50px;
	margin-left: 5px;
}
.right_panel_div .img5{
	width: 60px;
	height: 60px;
}
.right_panel_div .img6{
	width: 50px;
	height: 77px;
	margin-left: 5px;
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
	<div class="menu_list_div" id="menu_list_div1">
		<div class="item_div">
			<img class="ssdw_img" alt="" src="<%=basePath %>resource/image/202111230010.jpg">
			<span class="ssdw_name_span">实时定位</span>
			<span class="rs_span">人数：200</span>
			<img class="pointer_img" id="pointer_img1" alt="" src="<%=basePath %>resource/image/202111230011.png" onclick="showChildMenu(this.id);">
		</div>
		<div class="child_item_list_div" id="child_item_list_div1">
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
			<img class="pointer_img" id="pointer_img2" alt="" src="<%=basePath %>resource/image/202111230011.png" onclick="showChildMenu(this.id);">
		</div>
		<div class="child_item_list_div" id="child_item_list_div2">
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
<div class="right_panel_div" id="right_panel_div">
	<img class="img1" alt="" src="<%=basePath %>resource/image/202111230018.png">
	<img class="img2" alt="" src="<%=basePath %>resource/image/202111230019.png">
	<img class="img3" alt="" src="<%=basePath %>resource/image/202111230020.png">
	<img class="img4" alt="" src="<%=basePath %>resource/image/202111230021.png">
	<img class="img5" alt="" src="<%=basePath %>resource/image/202111230022.png">
	<img class="img6" alt="" src="<%=basePath %>resource/image/202111230023.png">
</div>
</body>
</html>