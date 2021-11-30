<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript">
function goPage(page){
	switch (page) {
	case "main":
		location.href="main.jsp";
		break;
	case "gjxx":
		location.href="gjxx.jsp";
		break;
	}
}
</script>
<style type="text/css">
body{
	margin: 0;
}

.top_div{
	width:100%;
	height:95px;
	background-image: url('resource/image/202111230008.png');
	position:fixed;
}
.top_div .left_div{
	margin-top:30px;
	margin-left: 80px;
	color: #00FFFF;
	font-size:20px; 
	position: absolute;
}
.top_div .left_div .dqyh_key_span{
	margin-left: 15px;
}
.top_div .title_div{
	width:605px;
	height:94px;
	line-height:94px;
	margin: 0 auto;
	color:#fff;
	font-size:35px; 
	text-align:center;
	background-image: url('resource/image/202111230009.png');
}
.top_div .right_div{
	margin-top: -70px;margin-right: 100px;float: right;
}
.top_div .right_div .but_img{
	cursor: pointer;
}
.top_div .right_div .qht_but_img{
	margin-left: 40px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="top_div" id="top_div">
	<div class="left_div">
		<span>2019-10-16 10:10:10</span>
		<span class="dqyh_key_span">当前用户：</span><span>管理员</span>
	</div>
	<div class="title_div">人员定位管理平台</div>
	<div class="right_div">
		<img class="but_img" alt="" src="<%=basePath %>resource/image/202111230002.png" onclick="goPage('main')">
		<img class="but_img qht_but_img" alt="" src="<%=basePath %>resource/image/202111230003.png">
	</div>
</div>
</body>
</html>