package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardDetailAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		if(id == null) {	//로그인이 되어 있지 않은 상태
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 하시기 바랍니다!');");
			out.println("location.href='memberLogin.me';</script>");
			return null;
		}else {				//로그인이 되어 있는 상태
			int board_num = Integer.parseInt(request.getParameter("board_num"));
			
			BoardDAO dao = new BoardDAO();
			BoardDTO dto = dao.getDetail(board_num);
			if(!id.equals(dto.getBoard_id())) {	//로그인한 id와 글을 작성한 작성자 id가 일치하지 않으면
				dao.setReadCountPlus(board_num);	//조회수 증가				
			}
			dto = dao.getDetail(board_num);		//DB에서 재검색
			request.setAttribute("dto", dto);
			
			ActionForward forward = new ActionForward();
			forward.setPath("board/boardView.jsp");
			forward.setRedirect(false);
			return forward;
		}		
	}
}//class