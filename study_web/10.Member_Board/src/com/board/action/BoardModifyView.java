package com.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardModifyView implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		
		BoardDAO dao = new BoardDAO();
		BoardDTO dto = dao.getDetail(board_num);
		request.setAttribute("dto", dto);
		
		String board_file = dto.getBoard_file();
		request.setAttribute("board_file", board_file);
		
		ActionForward forward = new ActionForward();
		forward.setPath("board/boardModifyForm.jsp");
		forward.setRedirect(false);
		return forward;
	}	
}
