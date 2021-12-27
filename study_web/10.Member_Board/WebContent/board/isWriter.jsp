<%@page import="com.board.study.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
int board_num = Integer.parseInt(request.getParameter("board_num"));

BoardDAO dao = new BoardDAO();
boolean result = dao.isBoardWriter(id, board_num);
%>
<%=result %>