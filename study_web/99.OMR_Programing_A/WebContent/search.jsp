<%@page import="com.hanul.study.TesterDTO"%>
<%@page import="com.hanul.study.testDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.hanul.study.SearchDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String part = request.getParameter("part");
	String searchData = request.getParameter("searchData");

	SearchDTO dto = new SearchDTO();
	dto.setPart(part);
	dto.setSearchData("%" + searchData + "%");
	
	testDAO dao = new testDAO();
	List<TesterDTO> list = dao.testerSearch(dto);
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수험자 검색</title>
<style>
@import url("css/search.css");
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/search.js"></script>
</head>
<body>
<div class="container">
	<div id="wrap">
		<h2>검색 목록 보기</h2>
		<div class="scroll">
		<table>
			<tr>
				<th>수험번호</th>
				<th>이름</th>
				<th>응시여부</th>
				<th>점수</th>
				<th>합격여부</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>

			<c:if test="${empty list}">
				<tr>
					<td colspan="7">검색 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${!empty list}">
				<c:forEach var="i" items="${list}">
				<tr>
					<td>${i.tester_id}</td>
					<td>${i.tester_name}</td>
					<td>${i.test}</td>
					<td>${i.score} 점</td>
					<td>${i.pup}</td>					
					<td><a href="Testerchange.jsp?Tester_id=${i.tester_id }" id="updateBtn">수정</a></td>
					<td><a href="delete.jsp?Tester_id=${i.tester_id }" id="deleteBtn">삭제</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		</div>
			<input type="button" value="전제 수험자 목록" id="listBtn"/>
	</div>
</div>
</body>
</html>