<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
var lpdMarginLeft;
var lpdMarginLeftTimer;
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

function doYjqr(){
	$("#sfqr_img").attr("src",path+"resource/image/202111230034.png");
}

function openLeftPanelDiv(){
	var flag;
	if(lpdMarginLeft==-325)
		flag=true;
	else if(lpdMarginLeft==0)
		flag=false;
	lpdMarginLeftTimer=setInterval(() => {
		changeLeftPanelWidth(flag);
	}, 10);
}

function changeLeftPanelWidth(flag){
	if(flag){
		lpdMarginLeft+=10;
		if(lpdMarginLeft>0)
			lpdMarginLeft=0;
	}
	else{
		lpdMarginLeft-=10;
		if(lpdMarginLeft<-325)
			lpdMarginLeft=-325;
	}

	console.log("lpdMarginLeft="+lpdMarginLeft)
	if(lpdMarginLeft==0||lpdMarginLeft==-325)
		clearInterval(lpdMarginLeftTimer);
	$("#left_panel_div").css("margin-left",lpdMarginLeft+"px");
}
</script>
<style type="text/css">
.left_panel_div{
	width: 325px;
	background-color: rgba(20,29,57,0.2);
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
	color:#c4f2fd;
	text-align:center;
	border:#5DC0FF solid 1px;
	cursor:pointer;
	border-radius:10px; 
}
.left_panel_div .menu_list_div{
	width: 100%;
	height: auto;
	color: #c4f2fd;
}
.left_panel_div .menu_list_div .item_div{
	width: 100%;
	height: 50px;
	line-height: 50px;
	font-size:17px;
	/*
	background-color: #00f;
	*/
	border-bottom: #646445 solid 1px;
}
.left_panel_div .menu_list_div .item_div .ssdw_img{
	width: 40px;
	height: 40px;
	margin-top: 5px;
	margin-left: 20px;
}
.left_panel_div .menu_list_div .item_div .gjxx_img{
	width: 25px;
	height: 25px;
	margin-top: 13px;
	margin-left: 28px;
}
.left_panel_div .menu_list_div .item_div .sjfx_img,
.left_panel_div .menu_list_div .item_div .dzwl_img,
.left_panel_div .menu_list_div .item_div .znxj_img,
.left_panel_div .menu_list_div .item_div .gysgl_img{
	width: 20px;
	height: 20px;
	margin-top: 16px;
	margin-left: 30px;
}
.left_panel_div .menu_list_div .item_div .ssdw_name_span{
	position: absolute;
}
.left_panel_div .menu_list_div .item_div .gjxx_name_span{
	margin-left: 9px;
	position: absolute;
}
.left_panel_div .menu_list_div .item_div .sjfx_name_span,
.left_panel_div .menu_list_div .item_div .dzwl_name_span,
.left_panel_div .menu_list_div .item_div .znxj_name_span,
.left_panel_div .menu_list_div .item_div .gysgl_name_span{
	margin-left: 12px;
	position: absolute;
}
.left_panel_div .menu_list_div .item_div .rs_span{
	margin-left:100px; 
	position: absolute;
}
.left_panel_div .menu_list_div .item_div .pointer_img{
	width: 20px;
	height: 20px;
	margin-top: 15px;
	margin-right: 20px;
	float: right;
	cursor: pointer;
}
.left_panel_div .menu_list_div .child_item_list_div{
	width: 100%;
	display: none;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div{
	width: 180px;
	height: 40px;
	line-height: 40px;
	margin:auto;
	font-size:15px;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div .child_name_div{
	width: 100px;
}
.left_panel_div .menu_list_div .child_item_list_div .child_item_div .child_rs_div{
	margin-top: -40px;
	margin-left:100px;
}
.open_lp_but_div{
	width: 10px;
	height: 100px;
	margin-left:325px;
	background-color: rgba(20,29,57,0.2);
	position:fixed; 
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="left_panel_div" id="left_panel_div">
	<div class="gj_div">
		<img id="sfqr_img" alt="" src="<%=basePath %>resource/image/202111230006.png">
		<span class="gjdj_span">告警等级：低</span>
		<div class="yjqr_but_div" onclick="doYjqr();">一键确认</div>
	</div>
	<div class="menu_list_div" id="menu_list_div1">
		<div class="item_div">
			<img class="ssdw_img" alt="" src="<%=basePath %>resource/image/202111230010.png">
			<span class="ssdw_name_span" onclick="goPage('stTool')">实时定位</span>
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
			<span class="gjxx_name_span" onclick="goPage('gjxx')">告警信息</span>
		</div>
		<div class="item_div">
			<img class="sjfx_img" alt="" src="<%=basePath %>resource/image/202111230014.png">
			<span class="sjfx_name_span">数据分析</span>
			<img class="pointer_img" id="pointer_img2" alt="" src="<%=basePath %>resource/image/202111230011.png" onclick="showChildMenu(this.id);">
		</div>
		<div class="child_item_list_div" id="child_item_list_div2">
			<div class="child_item_div">
				<div class="child_name_div" onclick="goPage('lsgj')">历史轨迹</div>
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
			<img class="pointer_img" id="pointer_img3" alt="" src="<%=basePath %>resource/image/202111230011.png" onclick="showChildMenu(this.id);">
		</div>
		<div class="child_item_list_div" id="child_item_list_div3">
			<div class="child_item_div">
				<div class="child_name_div" onclick="goPage('xgrw')">巡更任务</div>
			</div>
			<div class="child_item_div">
				<div class="child_name_div" onclick="goPage('znhkh')">智能化考核</div>
			</div>
		</div>
		<div class="item_div">
			<img class="gysgl_img" alt="" src="<%=basePath %>resource/image/202111230017.png">
			<span class="gysgl_name_span" onclick="goPage('cbsgl')">承包商管理</span>
		</div>
	</div>
</div>
	<div class="open_lp_but_div" id="open_lp_but_div" onclick="openLeftPanelDiv()"></div>
</body>
</html>