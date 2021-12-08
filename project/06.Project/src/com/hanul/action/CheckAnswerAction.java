package com.hanul.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.StudentDAO;
import com.hanul.dao.TestDAO;
import com.hanul.dto.AnswerDTO;
import com.hanul.dto.TestDTO;

public class CheckAnswerAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//클라이언트의 요청을 받는다
		request.setCharacterEncoding("utf-8");
		int code = Integer.parseInt(request.getParameter("modal_code"));
		
		
		//비지니스 로직
		TestDAO dao = new TestDAO();
		String sub = dao.searchSubject(code);
		//List<AnswerDTO> list = dao.answerSearch();
		//System.out.println(code);
		List<TestDTO> tlist = dao.inputAnswerSearch(code);
		List<AnswerDTO> alist = dao.answerSearch(sub);
		request.setAttribute("tlist", tlist);
		request.setAttribute("alist", alist);
		
		
		//프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("board/resultScore.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
