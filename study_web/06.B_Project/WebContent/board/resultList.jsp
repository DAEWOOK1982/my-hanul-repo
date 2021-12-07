<%@page import="com.hanul.dto.StudentDTO"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("utf-8");
List<StudentDTO> list = (List<StudentDTO>) request.getAttribute("list");	//바인딩(연결) 객체를 받는다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
</head>
<body>
<div align="center">
<jsp:include page="header.jsp"></jsp:include>
<h3>[응시결과 보기]</h3>
<table border="1" style="width: 80%">
	<tr>
		<th>수험번호</th>
		<th>성명</th>
		<th>과목</th>
		<th>점수</th>
		<th>합격여부</th>
		<th>시험응시날짜</th>
	</tr>
	
		
	<%-- JSTL과 EL 표현식을 이용한 출력 --%>
	<c:if test="${empty list}">
		<tr align="center">
			<td colspan="6">응시결과가 없습니다!</td>
		</tr>
	</c:if>
	<c:if test="${!empty list}">
		<c:forEach var="i" begin="0" end="${fn:length(list) - 1}" step="1">
			<tr align="center">
				<td>${list[i].code}</td>
				<td>${list[i].name}</td>
				<td>${list[i].subject}</td>
				<td>${list[i].score}</td>
				<td>${list[i].pass}</td>
				<td>${list[i].day}</td>
			</tr>
		</c:forEach>
	</c:if>
	
	<tr align="center">
		<td colspan="6">
<!-- 			<form action="boardSearch.do" method="post"> -->
				<input type="button" value="채점결과" onclick="location.href='check.do'"/>
				<input type="button" value="메인화면" onclick="location.href='main.do'"/>
<!-- 			</form> -->
		</td>
	</tr>
</table>
</div>
</body>
</html>
