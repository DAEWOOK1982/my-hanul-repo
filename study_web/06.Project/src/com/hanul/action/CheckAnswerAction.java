package com.hanul.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.StudentDAO;
import com.hanul.dao.TestDAO;
import com.hanul.dto.TestAnswerDTO;

public class CheckAnswerAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//클라이언트의 요청을 받는다
		request.setCharacterEncoding("utf-8");
		int code = Integer.parseInt(request.getParameter("modal_code"));
		
		
		//비지니스 로직
		TestDAO dao = new TestDAO();
		TestAnswerDTO dto = dao.inputAnswerSearch(code); 
		request.setAttribute("dto", dto);
		
		//프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/resultScore.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
