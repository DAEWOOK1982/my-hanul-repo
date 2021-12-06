<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 화면</title>
<style >
	@import url("css/Manager.css");
</style>
</head>
<body>
<div class="container">
	<div id="wrap">
		<div class="menu">
			<h2>관리자 화면입니다.</h2>
			<p>원하시는 메뉴를 선택하세요.</p>
		</div>
		<input type="button" class="tester" id="tester" value="1. 수험자 관련 화면으로 이동하기" onclick="location.href='gals.do'"/>
		<input type="button" class="gomain" id="gomain" value="2. 초기화면으로 " onclick="location.href='index.jsp'"/>
	</div>	
</div>
</body>
</html>