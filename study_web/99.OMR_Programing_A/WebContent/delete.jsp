<%@page import="com.hanul.study.testDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

Integer testerid = Integer.parseInt(request.getParameter("Tester_id"));

testDAO dao = new testDAO();

int succ = dao.deleteTester(testerid);

if(succ > 0){
	out.println("<script>alert('삭제완료');");
	out.println("location.href='gals.do';</script>");
	
} else {
	out.println("<script>alert('삭제실패');");
	out.println("location.href='gals.do';</script>");
	
}

%>