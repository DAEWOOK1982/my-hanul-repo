<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Answer</title>
</head>
<body>
<div align="center">
<h3>[채점 결과 보기]</h3>

<table border="1">
	<tr>
		<th>구분</th>
		<th>유형</th>
		<c:forEach var="i" begin="1" end="10" step="1">
			<th>문제 ${i}번</th>
		</c:forEach>
	</tr>
	<tr>
		<td>제출답안</td>
		<td></td>
		
	</tr>
</table>

</div>
</body>
</html>