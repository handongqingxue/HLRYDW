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
	
	var gjglListDiv=$("#gjgl_list_div");
	gjglListDiv.css("width",(bodyWidth-leftPanelWidth-50)+"px");
	gjglListDiv.css("height",(leftPanelHeight-80)+"px");
	gjglListDiv.css("margin-top",-(leftPanelHeight-25)+"px");
	gjglListDiv.css("margin-left",(leftPanelWidth+25)+"px");
	
	var gjglListHeight=gjglListDiv.css("height");
	gjglListHeight=parseInt(gjglListHeight.substring(0,gjglListHeight.length-2));

	var gjglListTitleDiv=$("#gjgl_list_div #title_div");
	var gjglListTitleHeight=gjglListTitleDiv.css("height");
	gjglListTitleHeight=parseInt(gjglListTitleHeight.substring(0,gjglListTitleHeight.length-2));

	var gjglListToolDiv=$("#gjgl_list_div #tool_div");
	var gjglListToolHeight=gjglListToolDiv.css("height");
	gjglListToolHeight=parseInt(gjglListToolHeight.substring(0,gjglListToolHeight.length-2));

	var gjglListLTDiv=$("#gjgl_list_div #list_title_div");
	var gjglListLTHeight=gjglListLTDiv.css("height");
	gjglListLTHeight=parseInt(gjglListLTHeight.substring(0,gjglListLTHeight.length-2));
	
	var gjglListLDiv=$("#gjgl_list_div #list_div");
	var gjglListLHeight=gjglListLDiv.css("height",(gjglListHeight-gjglListTitleHeight-gjglListToolHeight-gjglListLTHeight)+"px");
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
.gjgl_list_div{
	background-color: rgba(39,42,49,0.5);
	border:1px solid rgba(39,42,49,0.5);
	position: fixed;
	border-radius:8px; 
}
.gjgl_list_div .title_div{
	width: 100%;
	height: 60px;
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
	width: 840px;
	height: 60px;
	margin-right: 0px;
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
.gjgl_list_div .title_div .but_div .gbmb_but_img{
	width: 35px;
	height:35px; 
	margin-top: -50px;
	float: right;
	cursor:pointer;
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
.gjgl_list_div .tool_div .lx_sel{
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
.gjgl_list_div .tool_div .zt_span{
	margin-top: 15px;
	margin-left:280px; 
	position: absolute;
}
.gjgl_list_div .tool_div .zt_sel{
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
.gjgl_list_div .tool_div .sj_span{
	margin-top: 15px;
	margin-left:480px; 
	position: absolute;
}
.gjgl_list_div .tool_div .kssj_wp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 530px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.gjgl_list_div .tool_div .zhi_span{
	margin-top: 15px;
	margin-left:700px; 
	position: absolute;
}
.gjgl_list_div .tool_div .jssj_wp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 730px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.gjgl_list_div .tool_div .kh_span{
	margin-top: 15px;
	margin-left:905px; 
	position: absolute;
}
.gjgl_list_div .tool_div .kh_inp{
	width: 150px;
	height:30px;
	margin-top: 12px;
	margin-left: 960px;
	color: #3B3B3B;
	border: #E5E7EC solid 2px;
	position: absolute;
	border-radius:5px; 
}
.gjgl_list_div .tool_div .cx_but_div{
	width: 110px;
	height: 35px;
	line-height: 35px;
	margin-top: 12px;
	margin-left:1150px;
	color: #fff;
	font-size: 16px;
	background-color: #5DC0FF;
	position: absolute;
	cursor: pointer;
	border-radius: 12px;
}
.gjgl_list_div .tool_div .cx_but_div .text_span{
	margin-left: 20px;
}
.gjgl_list_div .tool_div .cx_but_div img{
	margin-top: 5px;
	margin-right: 15px;
	float: right;
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
	background-color: #EFF3F6;
}
.gjgl_list_div .list_div .item_div{
	width: 100%;
	height: 60px;
}
.gjgl_list_div .list_div .item_style1{
	background-color: #EFF3F6;
}
.gjgl_list_div .list_div .item_style2{
	background-color: #fff;
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
}
.gjgl_list_div .list_div .item_div .fsqy_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:400px;
	color:#262626;
}
.gjgl_list_div .list_div .item_div .bmdw_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:500px;
	color:#262626;
}
.gjgl_list_div .list_div .item_div .kssj_col_div{
	width: 200px;
	margin-top:-60px;
	margin-left:600px;
	color:#262626;
}
.gjgl_list_div .list_div .item_div .jssj_col_div{
	width: 200px;
	margin-top:-60px;
	margin-left:800px;
	color:#262626;
}
.gjgl_list_div .list_div .item_div .clzt_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:1000px;
	color:#9A0808;
}
.gjgl_list_div .list_div .item_div .clr_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:1100px;
	color:#262626;
}
.gjgl_list_div .list_div .item_div .clsj_col_div{
	width: 200px;
	margin-top:-60px;
	margin-left:1200px;
	color:#262626;
}
.gjgl_list_div .list_div .item_div .cz_col_div{
	width: 100px;
	margin-top:-60px;
	margin-left:1400px;
}
.gjgl_list_div .list_div .item_div .cz_col_div .cz_img{
	width: 30px;
	height:30px;
	margin-top: 15px;
	cursor: pointer;
}
</style>
</head>
<body>
<div id="cesiumContainer" style="width: 100%;height: 952px;background-image: url('<%=basePath %>resource/image/202111230026.png');"></div>
<%@include file="inc/top.jsp"%>
<%@include file="inc/left.jsp"%>
<div class="gjgl_list_div" id="gjgl_list_div">
	<div class="title_div" id="title_div">
		<img class="icon_img" alt="" src="<%=basePath %>resource/image/202111230024.png">
		<span class="gjgl_text_span">告警管理</span>
		<div class="but_div">
			<div class="but_style1_div jr_but_div">今日</div>
			<div class="but_style1_div zr_but_div">昨日</div>
			<div class="but_style2_div zjyz_but_div">最近7日</div>
			<div class="but_style2_div dcexcel_but_div">导出Excel</div>
			<div class="but_style2_div plcl_but_div">批量处理</div>
			<div class="but_style2_div yjcl_but_div">一键处理</div>
			<img class="gbmb_but_img" alt="" src="<%=basePath %>resource/image/202111230033.png" onclick="$('#gjgl_list_div').css('display','none');">
		</div>
	</div>
	<div class="tool_div" id="tool_div">
		<span class="lx_span">类型</span>
		<select class="lx_sel">
			<option>请选择</option>
			<option>aaaa</option>
			<option>bbbb</option>
		</select>
		<span class="zt_span">状态</span>
		<select class="zt_sel">
			<option>请选择</option>
			<option>未处理</option>
			<option>已处理</option>
		</select>
		<span class="sj_span">时间</span>
		<input type="text"  class="Wdate kssj_wp" placeholder="请选择开始时间" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" readonly="readonly"/>
		<span class="zhi_span">至</span>
		<input type="text"  class="Wdate jssj_wp" placeholder="请选择结束时间" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" readonly="readonly"/>
		<span class="kh_span">卡号</span>
		<input class="kh_inp" type="text" placeholder="请输入卡号"/>
		<div class="cx_but_div">
			<span class="text_span">查询</span>
			<img alt="" src="<%=basePath %>resource/image/202111230032.png">
		</div>
	</div>
	<div class="list_title_div" id="list_title_div">
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
	<div class="list_div" id="list_div">
		<div class="item_div item_style1">
			<input class="sel_cb" type="checkbox"/>
			<div class="col_div kh_col_div">123456</div>
			<div class="col_div bjr_col_div">李铁玉</div>
			<div class="col_div bjlx_col_div">滞留报警</div>
			<div class="col_div fsqy_col_div">一车间</div>
			<div class="col_div bmdw_col_div">生产部</div>
			<div class="col_div kssj_col_div">1997-07-01 12:05:05</div>
			<div class="col_div jssj_col_div">1997-07-01 13:05:05</div>
			<div class="col_div clzt_col_div">未处理</div>
			<div class="col_div clr_col_div">于祥海</div>
			<div class="col_div clsj_col_div">1997-07-01 14:05:05</div>
			<div class="col_div cz_col_div">
				<img class="cz_img" alt="" src="<%=basePath %>resource/image/202111230025.png">
			</div>
		</div>
		<div class="item_div item_style2">
			<input class="sel_cb" type="checkbox"/>
			<div class="col_div kh_col_div">123456</div>
			<div class="col_div bjr_col_div">李铁玉</div>
			<div class="col_div bjlx_col_div">滞留报警</div>
			<div class="col_div fsqy_col_div">一车间</div>
			<div class="col_div bmdw_col_div">生产部</div>
			<div class="col_div kssj_col_div">1997-07-01 12:05:05</div>
			<div class="col_div jssj_col_div">1997-07-01 13:05:05</div>
			<div class="col_div clzt_col_div">未处理</div>
			<div class="col_div clr_col_div">于祥海</div>
			<div class="col_div clsj_col_div">1997-07-01 14:05:05</div>
			<div class="col_div cz_col_div">
				<img class="cz_img" alt="" src="<%=basePath %>resource/image/202111230025.png">
			</div>
		</div>
	</div>
</div>
</body>
</html>