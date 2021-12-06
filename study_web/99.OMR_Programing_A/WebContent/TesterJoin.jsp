<%@page import="com.hanul.study.TesterDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.hanul.study.testDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//인코딩
request.setCharacterEncoding("UTF-8");
testDAO dao = new testDAO();
ArrayList<TesterDTO> list = dao.maxTesterId();
//수험자 번호로 결정할 값
int zero;
if(list.size() == 0){	//응시자가 아예 존재 하지 않는다면
	zero = 10000;
}else { //응시자번호가 존재한다면 +1한 값으로 설정
	zero = (list.get(0).getTester_id() + 1); 
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응시자 추가 접수</title>
<style >
	@import url("css/TesterJoin.css");
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/TesterJoin.js"></script>
</head>
<body>
<div class="container">
<div id="wrap">
		<h1>[응시자 추가접수]</h1>
		<p>응시자 추가 접수 화면입니다.</p>
		<p>응시자 성함을 정확히 입력하시고, 확인 버튼을 눌러주세요.</p>
		<form action="js.do" method="post" >
			<table>
				<tr>
					<th>응시번호</th>
					<td><input type="number" id="testerid" name="testerid" value = "<%=zero %>" readonly="readonly" /></td>
				</tr>
				<tr>
					<th><label for="testername">이름</label></th>
					<td><input type="text" id="testername" name="testername" id="testername"  maxlength="6" autofocus="autofocus"/></td>
				</tr>
				<tr>
					<th>응시 여부</th>
					<td><input type="text" id="test" name="test" value ="미응시" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>점수</th>
					<td><input type="number" id="score" name="score" value ="0" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>합격여부</th>
					<td><input type="text" id="pup" name="pup" value="불합격" readonly="readonly" /></td>
				</tr>

				<tr>
					<td colspan="2" >
						<input type="submit" id="submitBtn" value="확인" />
						<input type="reset"id="resetBtn" value="초기화" />
						<input type="button" id="cancleBtn" value="취소"  />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<a href="http://www.hanuledu.co.kr/"><img alt="" src="css/images/Logo.jpg"></a>
					</td>
				</tr>
				</table>
		</form>
	</div>
</div>
</body>
</html>