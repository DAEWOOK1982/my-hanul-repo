<%@page import="com.hanul.study.TesterDTO"%>
<%@page import="com.hanul.study.testDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

Integer testerid = Integer.parseInt(request.getParameter("Tester_id"));
testDAO dao = new testDAO();
TesterDTO dto = dao.getByid(testerid);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수험자 정보 변경</title>
<style >
	@import url("css/Testerchange.css");
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/Testerchange.js"></script>
</head>
<body>
<div class="container">
	<div id="wrap">
		<h3>[응시자 정보수정]</h3>
		<form action="us.do" method="post">
			<table>
				<tr>
					<th>응시번호</th>
					<td><input type="number" name="testerid" id="testerid" value="<%=dto.getTester_id() %>" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="testername" id="testername" value="<%=dto.getTester_name() %>" /></td>
				</tr>
				
				<tr>
					<th>응시여부</th>
					<td>
						<div class="select">
						<input type="radio" value="응시" name="test" id="do" /><label for="do">응시</label> 
						<input type="radio" value="미응시" name="test" id="not"/><label for="not">미응시</label>
					</div>
					</td>
				</tr>
				<tr>
					<th>점수</th>
					<td><input type="number" name="score" id="score" value="<%=dto.getScore() %>"/></td>
				</tr>
				
				<tr>
					<th>합격여부</th>
					<td>
					<div class="select">
						<input type="radio" value="합격" name="pup" id="pass"/><label for="pass">합격</label>
						<input type="radio" value="불합격" name="pup" id="unpass"/><label for ="unpass">불합격</label> 
					</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기"  id="submitBtn"/>
						<input type="reset" value="초기화하기" id="resetBtn"/>
						<input type="button" value="취소하기" id="cancleBtn" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>