package com.hanul.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.StudentDAO;
import com.hanul.dto.StudentDTO;

//BoardListAction Class : Action Interface 상속
// ▶ Servlet의 역할 수행 : 클라이언트의 요청, 비지니스 로직, 프리젠테이션 로직
public class resultListAction implements Action{
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//① 클라이언트의 요청을 받는다
		request.setCharacterEncoding("utf-8");
		
		int code = 0;
		if(request.getParameter("modal_code") == null) {			
			code = Integer.parseInt(request.getParameter("code"));
		} else {
			
			code = Integer.parseInt(request.getParameter("modal_code"));
		}
		
		//② 비지니스 로직 : DAO 연동하여 게시판의 전체 목록을 가져오는 작업
		StudentDAO dao = new StudentDAO();
		StudentDTO dto = dao.resultList(code);
		request.setAttribute("dto", dto); 		//바인딩(연결) 객체 생성
		
		//③ 프리젠테이션 로직 : 페이지 전환
		ActionForward forward = new ActionForward();
		forward.setPath("resultList.jsp");
		forward.setRedirect(false);
		return forward;
	}
}
