<%@page import="com.hanul.study.testDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="com.hanul.study.TesterDTO">
	<jsp:setProperty property="*" name="dto"/>
</jsp:useBean>

<%
testDAO dao = new testDAO();
int succ = dao.insetTestResult(dto);

if(succ > 0) {
	out.println("<script>alert('수고하셨습니다.');");
	out.println("location.href='index.jsp'</script>");	
}else{
	out.println("<script>alert('오류입니다.');");
	out.println("location.href='index.jsp'</script>");

}
%>