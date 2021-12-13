<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
.stt_panel_div{
	width: 58px;
	height: 350px;
	margin-top:-500px;
	background-color: rgba(29,42,50,0.5);
	border:#5DAFE5 solid 1px;
	right:65px;
	position: fixed;
}
.stt_panel_div img{
	cursor: pointer;
}
.stt_panel_div .yg_img{
	width: 45px;
	height: 45px;
	margin-top: 15px;
	margin-left: 5px;
}
.stt_panel_div .fk_img{
	width: 45px;
	height: 45px;
	margin-top: 10px;
	margin-left: 5px;
}
.stt_panel_div .cl_img{
	width: 45px;
	height: 45px;
	margin-top: 5px;
	margin-left: 8px;
}
.stt_panel_div .spld_img{
	width: 45px;
	height: 45px;
	margin-left: 5px;
}
.stt_panel_div .wg_img{
	width: 55px;
	height: 55px;
}
.stt_panel_div .zj_img{
	width: 45px;
	height: 70px;
	margin-left: 5px;
}
</style>
</head>
<body>
<div class="stt_panel_div" id="stt_panel_div">
	<img class="yg_img" alt="" title="员工" src="<%=basePath %>resource/image/202111230018.png">
	<img class="fk_img" alt="" title="访客" src="<%=basePath %>resource/image/202111230019.png">
	<img class="cl_img" alt="" title="车辆" src="<%=basePath %>resource/image/202111230020.png">
	<img class="spld_img" alt="" title="视频联动" src="<%=basePath %>resource/image/202111230021.png">
	<img class="wg_img" alt="" title="网关" src="<%=basePath %>resource/image/202111230022.png">
	<img class="zj_img" alt="" title="闸机" src="<%=basePath %>resource/image/202111230023.png">
</div>
</body>
</html>