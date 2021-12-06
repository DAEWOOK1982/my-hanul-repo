<%@page import="com.hanul.study.TesterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hanul.study.testDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<TesterDTO> list = (ArrayList<TesterDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응시자 목록</title>
<style>
@import url("css/Tester.css");
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/Tester.js"></script>
<script type="text/javascript">
	function fnSubmit() {
		var searchData = document.getElementById("searchData");
		//alert("searchData = " + searchData.value);
		if (searchData.value.trim() == "") {
			swal("검색어를 입력하세요.");
			searchData.value = "";
			searchData.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div class="container">
		<div id="wrap">
			<h2>[응시자 목록 보기]</h2>
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
					<%
						if (list.size() == 0) {
					%>
					<tr align='center'>
						<td colspan='7'>시험에 응시한 사람이 없습니다.</td>
					</tr>
					<%
						} else {
					%>
					<%
						for (TesterDTO dto : list) {
					%>
					<tr>
						<td><%=dto.getTester_id()%></td>
						<td><%=dto.getTester_name()%></td>
						<td><%=dto.getTest()%></td>
						<td><%=dto.getScore()%> 점</td>
						<td><%=dto.getPup()%></td>
						<td><a href="Testerchange.jsp?Tester_id=<%=dto.getTester_id()%>" class="updateBtn">수정</a></td>
						<td><a href="delete.jsp?Tester_id=<%=dto.getTester_id()%>" class="deleteBtn">삭제</a></td>
					</tr>
					<%
						} //for each
					%>
					<%
						} //if
					%>

				</table>
			</div>
			<form action="search.jsp" method="post" onsubmit="return fnSubmit()">
				<select name="part" class="arrow">
					<option value="TESTER_ID">수험자 번호</option>
					<option value="TESTER_NAME">수험자 이름</option>
				</select>
				<input type="text" name="searchData" id="searchData" />
					<input type="submit" value="검색" />
					<input type="button" id="returnBtn" value="관리자 메뉴로" />
			</form>
			
		</div>
	</div>
</body>
</html>

