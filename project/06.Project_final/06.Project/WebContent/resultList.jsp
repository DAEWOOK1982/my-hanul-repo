<%@page import="com.hanul.dto.StudentDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("utf-8");
StudentDTO dto = (StudentDTO) request.getAttribute("dto");	//바인딩(연결) 객체를 받는다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result List</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<style type="text/css">
@import url("css/resultList.css");
</style>
</head>
<body>
<div align="center">
<h3>[응시결과 보기]</h3>
<table border="1" style="width: 50%; text-align: center; width: 1000px; box-sizing: bo">
	<tr>
		<th>수험번호</th>
		<td>${dto.code}</td>
	</tr>
	<tr>
		<th>성명</th>	
		<td>${dto.name}</td>
	</tr>
	<tr>
		<th>과목</th>
		<td>${dto.subject}</td>
	</tr>
	<tr>
		<th>점수</th>
		<td>${dto.score}점</td>
	</tr>
	<tr>
		<th>합격여부</th>
		<td>${dto.pass}</td>
	</tr>
	<tr>
		<th>시험응시날짜</th>
		<td>${dto.day}</td>
	</tr>

	<tr align="center">
		<td colspan="2">
				<input type="button" class="btn btn-danger" value="메인화면" onclick="location.href='main.html'"/>
		</td>
	</tr>
</table>
</div>
</body>
</html>
