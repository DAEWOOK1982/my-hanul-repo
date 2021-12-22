package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;

public class BoardListAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//클라이언트 요청 : 세션객체를 가져온다.
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		//비지니스 로직 : DB에 접속 후 전체글 목록 검색, 페이징 처리
		BoardDAO dao = new BoardDAO();
		//ArrayList<BoardDTO> list = dao.getBoardList();	//전체 글 목록 검색(페이징 미처리, 답글 미등록)
		
		//페이징 처리
		int listCount = dao.getListCount();	//전체 글의 개수 검색
		int nowPage = 1;	//현재 페이지(요청 페이지)의 위치 : 기본값으로 무조건 첫 페이지로 설정
		int limit = 10;		//한 페이지당 출력되는 글의 개수
		if(request.getParameter("nowPage") != null) {	//첫 페이지가 아닌 다른 페이지를 요청
			nowPage = Integer.parseInt(request.getParameter("nowPage"));	//요청한 페이지 번호
		}
		ArrayList<BoardDTO> list = dao.getBoardList(nowPage, limit);	//전체 글 목록 검색(페이징 처리)
		int maxPage = (int) ((double)listCount / limit + 0.95);	//전체 페이지 수
		//현재 페이지에서 보여줄 시작되는 글번호(1, 11, 21 ~)
		int startPage = (((int) ((double)nowPage / limit + 0.95)) - 1) * limit + 1;		
		//현재 페이지에서 보여줄 마지막 글번호(10, 20, 30 ~)
		int endPage = maxPage;
		if(endPage > startPage + limit - 1) {
			endPage = startPage + limit - 1;
		}		
		
		//바인딩 객체 생성 : 출력페이지(boardList.jsp)로 전달
		request.setAttribute("nowPage", nowPage);	//현재 페이지(요청페이지)
		request.setAttribute("maxPage", maxPage);	//전체 페이지 수
		request.setAttribute("startPage", startPage);	//첫 페이지 수
		request.setAttribute("endPage", endPage);	//끝 페이지 수		
		request.setAttribute("list", list);			//전체 글 목록
		
		//프리젠테이션 로직 : board/boardList.jsp
		if(id == null) {	//로그인이 되어 있지 않은 상태
			//ActionForward forward = new ActionForward();
			//forward.setPath("memberLogin.me");
			//forward.setRedirect(true);
			//return forward;
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('정상적인 접근방식이 아닙니다!');");
			out.println("location.href='memberLogin.me';</script>");
			return null;
		}else {
			ActionForward forward = new ActionForward();
			forward.setPath("board/boardList.jsp");
			forward.setRedirect(false);
			return forward;
		}
	}
}
