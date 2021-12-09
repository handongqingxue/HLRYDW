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
	
	var xgrwListDiv=$("#xgrw_list_div");
	xgrwListDiv.css("width",(bodyWidth-leftPanelWidth-50)+"px");
	xgrwListDiv.css("height",(leftPanelHeight-80)+"px");
	xgrwListDiv.css("margin-top",-(leftPanelHeight-25)+"px");
	xgrwListDiv.css("margin-left",(leftPanelWidth+25)+"px");
	
	var xgrwListHeight=xgrwListDiv.css("height");
	xgrwListHeight=parseInt(xgrwListHeight.substring(0,xgrwListHeight.length-2));

	var xgrwListTitleDiv=$("#xgrw_list_div #title_div");
	var xgrwListTitleHeight=xgrwListTitleDiv.css("height");
	xgrwListTitleHeight=parseInt(xgrwListTitleHeight.substring(0,xgrwListTitleHeight.length-2));

	var xgrwListLDiv=$("#xgrw_list_div #list_div");
	var xgrwListLHeight=xgrwListLDiv.css("height",(xgrwListHeight-xgrwListTitleHeight)+"px");

	var xgrwListToolDiv=$("#xgrw_list_div #tool_div");
	var xgrwListToolHeight=xgrwListToolDiv.css("height");
	xgrwListToolHeight=parseInt(xgrwListToolHeight.substring(0,xgrwListToolHeight.length-2));
	
	var tabTitleDiv=$("#xgrw_list_div #tab_title_div");
	var tabTitleHeight=tabTitleDiv.css("height");
	tabTitleHeight=parseInt(tabTitleHeight.substring(0,tabTitleHeight.length-2));
	
	var tabPagerDiv=$("#xgrw_list_div #tab_pager");
	var tabPagerHeight=tabPagerDiv.css("height");
	tabPagerHeight=parseInt(tabPagerHeight.substring(0,tabPagerHeight.length-2));

	var tabDiv=$("#xgrw_list_div #tab_div");
	var tabHeight=tabDiv.css("height",(xgrwListHeight-xgrwListTitleHeight-xgrwListToolHeight-tabTitleHeight-tabPagerHeight-50)+"px");
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
.xgrw_list_div{
	background-color: rgba(39,42,49,0.5);
	border:1px solid rgba(39,42,49,0.5);
	position: fixed;
	border-radius:8px; 
}
.xgrw_list_div .title_div{
	width: 100%;
	height: 60px;
}
.xgrw_list_div .title_div .icon_img{
	width: 40px;
	height: 40px;
	margin-top: 10px;
	margin-left: 10px;
}
.xgrw_list_div .title_div .xgrw_text_span{
	margin-top: 15px;
	margin-left:30px;
	color: #fff;
	font-size:25px; 
	position: absolute;
}
.xgrw_list_div .title_div .but_div{
	width: 495px;
	height: 60px;
	margin-right: 50px;
	/*
	background-color: #0f0;
	*/
	float: right;
}
.xgrw_list_div .title_div .but_div .but_style1_div{
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
.xgrw_list_div .title_div .but_div .jr_but_div{
	margin-top:10px; 
}
.xgrw_list_div .title_div .but_div .zr_but_div{
	margin-left: 120px;
	margin-top: -42px;
}
.xgrw_list_div .title_div .but_div .but_style2_div{
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
.xgrw_list_div .title_div .but_div .zjyz_but_div{
	margin-left: 238px;
	margin-top: -41px;
}
.xgrw_list_div .title_div .but_div .dcexcel_but_div{
	margin-left: 373px;
	margin-top: -40px;
}
.xgrw_list_div .list_div{
	width: 100%;
	background-color: #EFF3F6;
	padding: 1px;
}
.xgrw_list_div .list_div .tool_div{
	width: 98%;
	height: 60px;
	margin:10px auto 0;
	background-color: #fff;
}
.xgrw_list_div .list_div .tool_div .bm_span{
	margin-top: 15px;
	margin-left:20px; 
	position: absolute;
}
.xgrw_list_div .list_div .tool_div .bm_sel{
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
.xgrw_list_div .list_div .tool_div .zt_span{
	margin-top: 15px;
	margin-left:280px; 
	position: absolute;
}
.xgrw_list_div .list_div .tool_div .zt_sel{
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
.xgrw_list_div .list_div .tool_div .sj_span{
	margin-top: 15px;
	margin-left:500px; 
	position: absolute;
}
.xgrw_list_div .list_div .tool_div .kssj_wp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 550px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.xgrw_list_div .list_div .tool_div .zhi_span{
	margin-top: 15px;
	margin-left:720px; 
	position: absolute;
}
.xgrw_list_div .list_div .tool_div .jssj_wp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 750px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.xgrw_list_div .list_div .tool_div .cx_but_div{
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
.xgrw_list_div .list_div .tool_div .cx_but_div .text_span{
	margin-left: 20px;
}
.xgrw_list_div .list_div .tool_div .cx_but_div img{
	margin-top: 5px;
	margin-right: 15px;
	float: right;
}
.xgrw_list_div .list_div .tab_title_div{
	width: 98%;
	height: 40px;
	margin:47px auto 0;
	background-color: #264476;
}
.xgrw_list_div .list_div .tab_title_div .col_div{
	height: 40px;
	line-height: 40px;
	color:#fff;
	text-align: center;
}
.xgrw_list_div .list_div .tab_title_div .xh_col_div{
	width: 100px;
	margin-top:-29px;
}
.xgrw_list_div .list_div .tab_title_div .rwmc_col_div{
	width: 150px;
	margin-top:-40px;
	margin-left:100px;
}
.xgrw_list_div .list_div .tab_title_div .zt_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:250px;
}
.xgrw_list_div .list_div .tab_title_div .xjlx_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:350px;
}
.xgrw_list_div .list_div .tab_title_div .fzr_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:450px;
}
.xgrw_list_div .list_div .tab_title_div .zxr_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:550px;
}
.xgrw_list_div .list_div .tab_title_div .ssbm_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:650px;
}
.xgrw_list_div .list_div .tab_title_div .pc_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:750px;
}
.xgrw_list_div .list_div .tab_title_div .gj_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:850px;
}
.xgrw_list_div .list_div .tab_title_div .cz_col_div{
	width: 100px;
	margin-top:-40px;
	margin-left:950px;
}
.xgrw_list_div .list_div .tab_div{
	width: 98%;
	height:300px;
	margin:auto;
	background-color: #fff;
}
.xgrw_list_div .list_div .tab_div .item_div{
	width: 100%;
	height: 60px;
}
.xgrw_list_div .list_div .tab_div .item_style1{
	background-color: #fff;
}
.xgrw_list_div .list_div .tab_div .item_style2{
	background-color: #D8FAE9;
}
.xgrw_list_div .list_div .tab_div .item_div .col_div{
	height: 60px;
	line-height: 60px;
	text-align: center;
}
.xgrw_list_div .list_div .tab_div .item_div .xh_col_div{
	width: 100px;
	color:#262626;
}
.xgrw_list_div .list_div .tab_div .item_div .rwmc_col_div{
	width: 150px;
	margin-top:-60px;
	margin-left:100px;
	color:#262626;
}
.xgrw_list_div .list_div .tab_div .item_div .zt_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:250px;
	color:#262626;
}
.xgrw_list_div .list_div .tab_div .item_div .xjlx_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:350px;
	color:#262626;
}
.xgrw_list_div .list_div .tab_div .item_div .fzr_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:450px;
	color:#262626;
}
.xgrw_list_div .list_div .tab_div .item_div .zxr_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:550px;
	color:#262626;
}
.xgrw_list_div .list_div .tab_div .item_div .ssbm_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:650px;
	color:#262626;
}
.xgrw_list_div .list_div .tab_div .item_div .pc_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:750px;
	color:#262626;
}
.xgrw_list_div .list_div .tab_div .item_div .gj_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:850px;
	padding: 1px;
}
.xgrw_list_div .list_div .tab_div .item_div .gj_col_div .ck_but_div{
	width: 60px;
	height: 33px;
	line-height: 33px;
	margin:13px auto;
	color:#fff;
	text-align:center;
	background-color: #5DC0FF;
	cursor:pointer;
	border-radius:10px;
}
.xgrw_list_div .list_div .tab_div .item_div .cz_col_div{
	width: 100px;
	line-height:53px;
	margin-top:-60px;
	margin-left:950px;
}
.xgrw_list_div .list_div .tab_div .item_div .cz_col_div span{
	color: #00f;
	cursor: pointer;
}
.xgrw_list_div .list_div .tab_pager{
	width: 98%;
	height:60px;
	margin: 5px auto 0;
	background-color: #fff;
}
.xgrw_list_div .list_div .tab_pager .option_div{
	width: 440px;
	height: 60px;
	line-height: 60px;
	color:#666; 
	font-size:14px;
	/*
	background-color: #0f0;
	*/
	float: right;
}
.xgrw_list_div .list_div .tab_pager .option_div .myts_sel{
	width:100px;
	height:30px;
	margin-left: 10px;
	color: #3B3B3B;
	background-color: #fff;
	border: #E5E7EC solid 1px;
	border-radius: 3px;
}
.xgrw_list_div .list_div .tab_pager .option_div .syy_but_div{
	width:28px;
	height:28px;
	line-height:28px;
	margin-left: 170px;
	margin-top: -45px;
	color: #C5CCD6;
	text-align:center; 
	font-weight:bold;
	background-color: #F4F4F5;
	border: #858B99 solid 1px;
}
.xgrw_list_div .list_div .tab_pager .option_div .dqy_num_div{
	width:28px;
	height:28px;
	line-height:28px;
	margin-left: 210px;
	margin-top: -30px;
	color:#fff; 
	text-align:center; 
	background-color: #96BAE6;
	border: #858B99 solid 1px;
}
.xgrw_list_div .list_div .tab_pager .option_div .xyy_but_div{
	width:28px;
	height:28px;
	line-height:28px;
	margin-left: 250px;
	margin-top: -30px;
	color: #C5CCD6;
	text-align:center; 
	font-weight:bold;
	background-color: #F4F4F5;
	border: #858B99 solid 1px;
}
.xgrw_list_div .list_div .tab_pager .option_div .qw_span{
	margin-top: -45px;
	margin-left: 310px;
	position: absolute;
}
.xgrw_list_div .list_div .tab_pager .option_div .qwy_num_inp{
	height:28px;
	margin-top: -42px;
	margin-left: 343px;
	color:#3B3B3B;
	text-align:center;
	border: #E5E7EC solid 1px;
	border-radius: 3px;
}
.xgrw_list_div .list_div .tab_pager .option_div .ye_span{
	margin-top: -43px;
	margin-left: 10px;
	position: absolute;
}
</style>
</head>
<body>
<div id="cesiumContainer" style="width: 100%;height: 952px;background-image: url('<%=basePath %>resource/image/202111230026.png');"></div>
<%@include file="inc/top.jsp"%>
<%@include file="inc/left.jsp"%>
<div class="xgrw_list_div" id="xgrw_list_div">
	<div class="title_div" id="title_div">
		<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230024.png">
		<span class="xgrw_text_span">巡更任务</span>
		<div class="but_div">
			<div class="but_style1_div jr_but_div">今日</div>
			<div class="but_style1_div zr_but_div">昨日</div>
			<div class="but_style2_div zjyz_but_div">最近7日</div>
			<div class="but_style2_div dcexcel_but_div">导出Excel</div>
		</div>
	</div>
	<div class="list_div" id="list_div">
		<div class="tool_div" id="tool_div">
			<span class="bm_span">部门</span>
			<select class="bm_sel">
				<option>请选择</option>
				<option>aaaa</option>
				<option>bbbb</option>
			</select>
			<span class="zt_span">状态</span>
			<select class="zt_sel">
				<option>全部</option>
				<option>未处理</option>
				<option>已处理</option>
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
		<div class="tab_title_div" id="tab_title_div">
			<div class="col_div xh_col_div">序号</div>
			<div class="col_div rwmc_col_div">任务名称</div>
			<div class="col_div zt_col_div">状态</div>
			<div class="col_div xjlx_col_div">巡检路线</div>
			<div class="col_div fzr_col_div">负责人</div>
			<div class="col_div zxr_col_div">执行人</div>
			<div class="col_div ssbm_col_div">所属部门</div>
			<div class="col_div pc_col_div">频次</div>
			<div class="col_div gj_col_div">轨迹</div>
			<div class="col_div cz_col_div">操作</div>
		</div>
		<div class="tab_div" id="tab_div">
			<div class="item_div item_style1">
				<div class="col_div xh_col_div">序号</div>
				<div class="col_div rwmc_col_div">任务名称</div>
				<div class="col_div zt_col_div">状态</div>
				<div class="col_div xjlx_col_div">巡检路线</div>
				<div class="col_div fzr_col_div">负责人</div>
				<div class="col_div zxr_col_div">执行人</div>
				<div class="col_div ssbm_col_div">所属部门</div>
				<div class="col_div pc_col_div">频次</div>
				<div class="col_div gj_col_div">
					<div class="ck_but_div">查看</div>
				</div>
				<div class="col_div cz_col_div">
					<span>删除</span>
				</div>
			</div>
			<div class="item_div item_style2">
				<div class="col_div xh_col_div">序号</div>
				<div class="col_div rwmc_col_div">任务名称</div>
				<div class="col_div zt_col_div">状态</div>
				<div class="col_div xjlx_col_div">巡检路线</div>
				<div class="col_div fzr_col_div">负责人</div>
				<div class="col_div zxr_col_div">执行人</div>
				<div class="col_div ssbm_col_div">所属部门</div>
				<div class="col_div pc_col_div">频次</div>
				<div class="col_div gj_col_div">
					<div class="ck_but_div">查看</div>
				</div>
				<div class="col_div cz_col_div">
					<span>删除</span>
				</div>
			</div>
			<div class="item_div item_style1">
				<div class="col_div xh_col_div">序号</div>
				<div class="col_div rwmc_col_div">任务名称</div>
				<div class="col_div zt_col_div">状态</div>
				<div class="col_div xjlx_col_div">巡检路线</div>
				<div class="col_div fzr_col_div">负责人</div>
				<div class="col_div zxr_col_div">执行人</div>
				<div class="col_div ssbm_col_div">所属部门</div>
				<div class="col_div pc_col_div">频次</div>
				<div class="col_div gj_col_div">
					<div class="ck_but_div">查看</div>
				</div>
				<div class="col_div cz_col_div">
					<span>删除</span>
				</div>
			</div>
			<div class="item_div item_style2">
				<div class="col_div xh_col_div">序号</div>
				<div class="col_div rwmc_col_div">任务名称</div>
				<div class="col_div zt_col_div">状态</div>
				<div class="col_div xjlx_col_div">巡检路线</div>
				<div class="col_div fzr_col_div">负责人</div>
				<div class="col_div zxr_col_div">执行人</div>
				<div class="col_div ssbm_col_div">所属部门</div>
				<div class="col_div pc_col_div">频次</div>
				<div class="col_div gj_col_div">
					<div class="ck_but_div">查看</div>
				</div>
				<div class="col_div cz_col_div">
					<span>删除</span>
				</div>
			</div>
		</div>
		<div class="tab_pager" id="tab_pager">
			<div class="option_div">
				<span>共<span>0</span>条</span>
				<select class="myts_sel">
					<option>15条/页</option>
				</select>
				<div class="syy_but_div">&lt;</div>
				<div class="dqy_num_div">1</div>
				<div class="xyy_but_div">&gt;</div>
				<span class="qw_span">前往</span>
				<input class="qwy_num_inp" type="text" size="4" value="1"/>
				<span class="ye_span">页</span>
			</div>
		</div>
	</div>
</div>
</body>
</html>