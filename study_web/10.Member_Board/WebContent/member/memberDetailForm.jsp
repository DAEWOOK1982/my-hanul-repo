<%@ page import="com.member.study.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
MemberDTO dto = (MemberDTO) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Detail Form</title>
<script type="text/javascript">
function fnSubmit(){
	if(confirm("정말 수정하시겠습니까?")){
		return true;
	}
	return false;
}

function fnReset(){
	var msg = "수정하신 내용이 초기화 됩니다.";
	msg += "\n계속 진행하시겠습니까?";
	if(confirm(msg)){
		return true;
	}
	return false;
}
</script>
</head>
<body>
<div align="center">
<h3>[회원정보 수정화면]</h3>
<form action="memberUpdataAction.me" method="post" onsubmit="return fnSubmit()" onreset="return fnReset()">
<input type="hidden" name="member_id" value="${dto.member_id}"/>
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${dto.member_id}</td>
	</tr>
	
	<tr>
		<th>비밀번호</th><!-- 비밀번호 유효성 검사 -->
		<td><input type="password" name="member_pw" value="${dto.member_pw}"/></td>
	</tr>
	<!-- 비밀번호 재입력(확인) -->
	
	<tr>
		<th>이름</th>
		<td><input type="text" name="member_name" value="${dto.member_name}"/></td>
	</tr>
	
	<tr>
		<th>나이</th>
		<td><input type="number" name="member_age" value="${dto.member_age}"/></td>
	</tr>
	
	<tr>
		<th>성별</th>
		<td>
			<c:if test="${dto.member_gender eq '남'}">
				<input type="radio" name="member_gender" value="남" checked="checked"/>남자
				<input type="radio" name="member_gender" value="여"/>여자
			</c:if>
			<c:if test="${dto.member_gender eq '여'}">
				<input type="radio" name="member_gender" value="남" />남자
				<input type="radio" name="member_gender" value="여" checked="checked"/>여자
			</c:if>
		</td>
	</tr>
	
	<tr>
		<th>이메일</th>
		<td>
			<c:if test="${dto.member_email ne null}">
				<input type="text" name="member_email" value="${dto.member_email}"/>			
			</c:if>
			<c:if test="${dto.member_email eq null}">
				<input type="text" name="member_email" value=""/>			
			</c:if>		
		</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="수정하기"/>
			<input type="reset" value="초기화하기"/>
			<input type="button" value="게시판 목록보기" onclick="location.href='boardList.bo'"/>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>