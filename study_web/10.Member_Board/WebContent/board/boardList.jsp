<%@page import="com.board.study.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.member.study.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
request.setCharacterEncoding("utf-8");
String id = (String) session.getAttribute("id");

MemberDAO dao = new MemberDAO();
String member_pw = dao.getMember_pw(id);

Integer nowPage = (Integer) request.getAttribute("nowPage");
Integer maxPage = (Integer) request.getAttribute("maxPage");
Integer startPage = (Integer) request.getAttribute("startPage");
Integer endPage = (Integer) request.getAttribute("endPage");
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
	<c:if test="${empty list}">		
		<tr><td colspan="5" align="center">작성된 글이 없습니다!</td></tr>
	</c:if>
	<c:if test="${!empty list}">
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
	
	<c:if test="${fn:length(list) eq 0}">
		<tr><td colspan="5" align="center">작성된 글이 없습니다!</td></tr>
	</c:if>
	<c:if test="${fn:length(list) ne 0}">
		<c:forEach var="i" begin="0" end="${fn:length(list) - 1}" step="1">
			<tr align="center">
				<td>${list[i].board_num}</td>		
				<td align="left">
					<c:if test="${list[i].board_re_lev ne 0}">
						<c:forEach var="j" begin="1" end="${(list[i].board_re_lev - 1) * 2}" step="1">
						&nbsp;
						</c:forEach>
						ㄴRE : 
					</c:if>				
					<a href="boardDetailAction.bo?board_num=${list[i].board_num}">${list[i].board_subject}</a>
				</td>		
				<td>${list[i].board_id}</td>		
				<td>${list[i].board_date}</td>		
				<td>${list[i].board_readcount}</td>		
			</tr>
		</c:forEach>
	</c:if>
		
	<!-- 페이징 처리 -->
	<%-- 
	<tr align="center">
		<td colspan="5">
			<%if(nowPage <= 1){ %>
				[이전] 
			<%}else{%>
				<a href="boardList.bo?nowPage=<%=nowPage - 1%>">[이전]</a>
			<%}//if %>			
			
			<%for(int i = startPage; i <= endPage; i++){ %>
				<%if(i == nowPage){ %>
					[<%=i %>]
				<%}else{ %>
					<a href="boardList.bo?nowPage=<%=i%>">[<%=i %>]</a>
				<%}//if %>
			<%}//for %>
			
			<%if(nowPage >= maxPage){ %>
				[다음]
			<%}else{ %>
				<a href="boardList.bo?nowPage=<%=nowPage + 1%>">[다음]</a>
			<%}//if %>
		</td>	
	</tr>
	--%>
	
	<tr align="center">
		<td colspan="5">
			<c:choose>
				<c:when test="${nowPage le 1}">[이전]&nbsp;&nbsp;&nbsp;</c:when>
				<c:otherwise>
					<a href="boardList.bo?nowPage=${nowPage - 1}">[이전]</a>&nbsp;&nbsp;&nbsp;
				</c:otherwise>
			</c:choose>
			
			<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
				<c:choose>
					<c:when test="${i eq nowPage}">${i}&nbsp;&nbsp;&nbsp;</c:when>
					<c:otherwise><a href="boardList.bo?nowPage=${i}">${i}</a>&nbsp;&nbsp;&nbsp;</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:choose>
				<c:when test="${nowPage ge maxPage}">[다음]&nbsp;&nbsp;&nbsp;</c:when>
				<c:otherwise><a href="boardList.bo?nowPage=${nowPage + 1}">[다음]</a></c:otherwise>
			</c:choose>
		</td>
	</tr>
	
	<!-- 조건검색 -->
	<tr>
		<td colspan="5" align="center">
		 	<form action="boardSearch.bo" method="post">
		 		<select name="part">
		 			<option value="board_subject">제목</option>
		 			<option value="board_content">내용</option>
		 			<option value="board_id">작성자</option>
		 		</select>
		 		<input type="text" name="searchData" required="required"/>
		 		<input type="submit" value="검색하기"/>
		 	</form>
		</td>
	</tr>
	
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