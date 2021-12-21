<%@page import="com.board.study.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id");

MemberDAO dao = new MemberDAO();
String member_pw = dao.getMember_pw(id);

ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<script type="text/javascript">
function fnModify(id, member_pw){
	//alert("ID : " + id + "\nPW : " + member_pw);
	var input_pw = prompt("비밀번호를 입력하세요", "");
	
	if(input_pw == member_pw){
		location.href = "memberDetailAction.me?member_id=" + id;
	}else{
		alert("비밀번호가 일치하지 않습니다!");
	}
}

function fnSecession(id){
	//alert("ID : " + id);
	if(confirm("정말 회원 탈퇴를 진행 하시겠습니까?")){
		location.href = "memberSecessionAction.me?member_id=" + id;
	}
	return false;
}
</script>
</head>
<body>
<div align="center">
<h3>[전체 글 목록보기]</h3>
<table border="1" style="width: 80%">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<!-- 글 목록 표시 -->
	<%-- 
		<%if(list.size() == 0){ %>
			<tr><td colspan="5" align="center">작성된 글이 없습니다!</td></tr>
		<%}else{ %>
			<%for(BoardDTO dto : list){ %>
				<tr align="center">
					<td><%=dto.getBoard_num()%></td>
					<td><%=dto.getBoard_subject()%></td>
					<td><%=dto.getBoard_id()%></td>
					<td><%=dto.getBoard_date()%></td>
					<td><%=dto.getBoard_readcount()%></td>
				</tr>
			<%}//for %>
		<%}//if %>
	--%>
	
	<%--
	<c:if test="${empty list}">		<c:if test="${list eq null}">
		<tr><td colspan="5" align="center">작성된 글이 없습니다!</td></tr>
	</c:if>
	<c:if test="${!empty list}">	<c:if test="${list ne null}">
		<c:forEach var="i" items="${list}">
			<tr align="center">
				<td>${i.board_num}</td>
				<td>${i.board_subject}</td>
				<td>${i.board_id}</td>
				<td>${i.board_date}</td>
				<td>${i.board_readcount}</td>
			</tr>
		</c:forEach>
	</c:if>
	--%>
	
	
	
	
	<!-- 페이징 처리 -->
	
	
	<!-- 조건검색 -->
	
	
	<tr>
		<td colspan="5" align="center">
			<%-- <%if(id != null && id.equals("admin")){ %>
				<input type="button" value="회원관리(관리자)" 
					onclick="location.href='memberListAction.me'"/>
			<%}//if %> --%>
			<c:if test="${id ne null && id eq 'admin'}">
				<input type="button" value="회원관리(관리자)" 
					onclick="location.href='memberListAction.me'"/>
			</c:if>
			
			<input type="button" value="회원정보 수정"
				onclick="fnModify('<%=id%>', '<%=member_pw%>')"/>
			
			<input type="button" value="로그아웃"
				onclick="location.href='memberLogout.me'"/>
				
			<c:if test="${id ne null && id ne 'admin'}">
				<input type="button" value="회원탈퇴하기"
					onclick="fnSecession('<%=id%>')"/>
			</c:if>
			
			<input type="button" value="글쓰기"
				onclick="location.href='boardWriteForm.bo'"/>
		</td>	
	</tr>
</table>
</div>
</body>
</html>