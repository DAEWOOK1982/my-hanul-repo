<%@page import="com.hanul.study.TesterDTO"%>
<%@page import="com.hanul.study.testDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

Integer testerid = (Integer) request.getAttribute("testerid");
String testername = (String) request.getAttribute("testername");

testDAO dao = new testDAO();
TesterDTO dto = dao.getByid(testerid);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모의고사 응시 완료</title>
<style >
	@import url("css/doneTester.css");
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
	$("#returnBtn").click(function(){
		location.href="index.jsp";
	});
});
</script>
</head>
<body>
<div class="container">
	<div id="wrap">
		<h2><b><%=dto.getTester_name() %> 님은 이미 응시 완료 하였습니다.</b></h2>
		<p>자세한 사항은 관리자에게 문의 해주세요.</p>
		<table>
			<tr>
				<th>수험자&nbsp;&nbsp;번호</th>
				<td><%=dto.getTester_id() %></td>
			</tr>
			
			<tr>
				<th>수험자&nbsp;&nbsp;이름</th>
				<td><%=dto.getTester_name() %></td>
			</tr>
		
			<tr>
				<th>점&emsp;&emsp;&emsp;&nbsp;수</th>
				<td><%=dto.getScore() %> 점</td>
			</tr>
			
			<tr>
				<th>합&nbsp;&nbsp;격&nbsp;&nbsp;여&nbsp;부</th>
				<td><%=dto.getPup() %></td>
			</tr>
		
		</table>
		<input type="button" value="돌아가기" id="returnBtn"/>
	</div>
</div>

</body>
</html>