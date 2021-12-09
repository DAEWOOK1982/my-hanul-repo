package com.hanul.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.StudentDAO;
import com.hanul.dao.TestDAO;
import com.hanul.dto.AnswerDTO;
import com.hanul.dto.StudentDTO;
import com.hanul.dto.TestAnswerDTO;


public class CheckAnswerAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//클라이언트의 요청을 받는다
		request.setCharacterEncoding("utf-8");


		int code = 0;
		if(request.getParameter("modal_code") == null) {
			
			code = Integer.parseInt(request.getParameter("code"));
		} else {
			
			code = Integer.parseInt(request.getParameter("modal_code"));
		}
		
				
		TestDAO dao = new TestDAO();
		StudentDAO daos = new StudentDAO();
		
		
		String sub = dao.searchSubject(code);
		
			
		TestAnswerDTO dto = dao.inputAnswerSearch(code);
		List<AnswerDTO> list = dao.answerSearch();
		
		int[] test  = {dto.getTest1(), dto.getTest2(), dto.getTest3(), dto.getTest4(),
				       dto.getTest5(), dto.getTest6(), dto.getTest7(), dto.getTest8(),
				       dto.getTest9(), dto.getTest10()};
		
		AnswerDTO dtoa = dao.answerList(sub);
		int[] answer = {dtoa.getAnswer1(), dtoa.getAnswer10(), dtoa.getAnswer3(), dtoa.getAnswer4(),
						dtoa.getAnswer5(), dtoa.getAnswer6(), dtoa.getAnswer7(), dtoa.getAnswer8(),
						dtoa.getAnswer9(), dtoa.getAnswer10()};
		
		int score = 0;
		
		for(int i=0; i< test.length; i++ ) {
			if(test[i] == 0) {
				score += 0;
			}else if(test[i] == answer[i]) {
				score += 10;
			}
			
		}
		
		
		
		StudentDTO dtos = new StudentDTO();
		dtos.setCode(code);
		dtos.setScore(score);
		dao.scoreUpdate(dtos);
		
		if(score >= 60) {
			daos.passSucc(dtos);
		} else {
			daos.passFail(dtos);
		}

		request.setAttribute("score", score);
		request.setAttribute("dto", dto);
		request.setAttribute("list", list);
		
		
		//프리젠테이션 로직
		ActionForward forward = new ActionForward();
		forward.setPath("resultScore.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
