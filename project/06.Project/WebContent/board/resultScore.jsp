<%@page import="java.util.List"%>
<%@page import="com.hanul.dto.AnswerDTO"%>
<%@page import="com.hanul.dto.TestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("utf-8");

List<AnswerDTO> alist = (List<AnswerDTO>) request.getAttribute("alist");
List<TestDTO> tlist = (List<TestDTO>) request.getAttribute("tlist");

//TestDTO dto = (TestDTO) request.getAttribute("dto");
//List<AnswerDTO> list = (List<AnswerDTO>) request.getAttribute("list");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result Score</title>
</head>
<body>

<div align="center">
<h3>[채점 결과 보기]</h3>
<h3>수험번호 : ${dto.code}</h3>
<table border="1" style="width: 70%;">
	<tr>
		<th>구분</th>
		<th>유형</th>
		<c:forEach var="i" begin="1" end="10" step="1">
			<th>문제${i}번</th>
		</c:forEach>
	</tr>
	
	<tr align="center">
		<td>제출답안</td>
		<td>${alist.subject}</td>
		
<%-- 		<td>${dto.subject}</td>
		<td>${dto.test1}</td>
		<td>${dto.test2}</td>
		<td>${dto.test3}</td>
		<td>${dto.test4}</td>
		<td>${dto.test5}</td>
		<td>${dto.test6}</td>
		<td>${dto.test7}</td>
		<td>${dto.test8}</td>
		<td>${dto.test9}</td>
		<td>${dto.test10}</td>
 --%>
<%-- 	</tr>
	<tr align="center">
		<td>정답</td>
		<c:forEach var="i" begin="0" end="${fn:length(list) -1}" step="1">
			<c:if test="${list[i].subject == dto.subject}">
			
			<td>${list[i].subject}</td>
			<td>${list[i].answer1 }</td>
			<td>${list[i].answer2 }</td>
			<td>${list[i].answer3 }</td>
			<td>${list[i].answer4 }</td>
			<td>${list[i].answer5 }</td>
			<td>${list[i].answer6 }</td>
			<td>${list[i].answer7 }</td>
			<td>${list[i].answer8 }</td>
			<td>${list[i].answer9 }</td>
			<td>${list[i].answer10 }</td>
			</c:if>
		</c:forEach>
	</tr>
	<tr align="center">
		<td>결과</td>
		<td>${dto.subject}</td>
		<c:forEach var="i" begin="0" end="${fn:length(list) -1}" step="1">
			<c:if test="${list[i].subject == dto.subject}">
		<td>
		<c:choose>
			<c:when test="${dto.test1 eq list[i].answer1 }"> O </c:when>
			<c:when test="${dto.test1 != list[i].answer1 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test2 eq list[i].answer2 }"> O </c:when>
			<c:when test="${dto.test2 != list[i].answer2 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test3 eq list[i].answer3 }"> O </c:when>
			<c:when test="${dto.test3 != list[i].answer3 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test4 eq list[i].answer4 }"> O </c:when>
			<c:when test="${dto.test4 != list[i].answer4 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test5 eq list[i].answer5 }"> O </c:when>
			<c:when test="${dto.test5 != list[i].answer5 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test6 eq list[i].answer6 }"> O </c:when>
			<c:when test="${dto.test6 != list[i].answer6 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test7 eq list[i].answer7 }"> O </c:when>
			<c:when test="${dto.test7 != list[i].answer7 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test8 eq list[i].answer8 }"> O </c:when>
			<c:when test="${dto.test8 != list[i].answer8 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test9 eq list[i].answer9 }"> O </c:when>
			<c:when test="${dto.test9 != list[i].answer9 }"> X </c:when>
		</c:choose>
		</td>
		<td>
		<c:choose>
			<c:when test="${dto.test10 eq list[i].answer10 }"> O </c:when>
			<c:when test="${dto.test10 != list[i].answer10 }"> X </c:when>
		</c:choose>
		</td>
		</c:if>
		</c:forEach>
		
		
	</tr>
 --%></table>
</div>

</body>
</html>