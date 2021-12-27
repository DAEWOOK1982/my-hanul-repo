package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardDeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		//로그인 id와 작성자 id의 일치 여부
		BoardDAO dao = new BoardDAO();
		boolean result = dao.isBoardWriter(id, board_num);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(id.equals("admin") || result == true) {	//관리자 또는 작성자가 일치할 경우 : 삭제 수행
			int succ = dao.boardDelete(board_num);
			if(succ > 0) {
				out.println("<script>alert('삭제 되었습니다!');");
				out.println("location.href='boardList.bo';</script>");
				//return null;
			}else {
				out.println("<script>alert('삭제 실패!');");
				out.println("history.go(-1);</script>");
				//return null;
			}			
		}else {
			out.println("<script>alert('삭제 권한이 없습니다!');");
			//out.println("location.href='boardDetailAction.bo?board_num=" + board_num + "';</script>");
			out.println("history.go(-1);</script>");
			//return null;
		}
		return null;
	}	
}
