<%@page import="com.hanul.dto.StudentDTO"%>
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
</head>
<body>
<%-- <jsp:include page="header.jsp"/> --%>
<div align="center">
<h3>[응시결과 보기]</h3>
<table border="1" style="width: 70%; text-align: center;">
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
		<td>${dto.score}</td>
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
		<td colspan="6">
				<input type="button" value="채점결과" onclick="location.href='check.do'"/>
				<input type="button" value="메인화면" onclick="location.href='main.html'"/>
		</td>
	</tr>
</table>
</div>
</body>
</html>
