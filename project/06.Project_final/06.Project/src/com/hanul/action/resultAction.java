package com.hanul.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.TestDAO;
import com.hanul.dto.StudentDTO;
import com.hanul.dto.TestAnswerDTO;


public class resultAction implements Action{

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		TestAnswerDTO dto = new TestAnswerDTO();
		TestDAO dao = new TestDAO();
		
		dto.setCode( Integer.parseInt(request.getParameter("code")));
		dto.setSubject(request.getParameter("subject"));
		
		if(dto.getSubject().equals("정보처리기사")) {
			dto.setTest1(Integer.parseInt(request.getParameter("code1")));
			dto.setTest2(Integer.parseInt(request.getParameter("code2")));
			dto.setTest3(Integer.parseInt(request.getParameter("code3")));
			dto.setTest4(Integer.parseInt(request.getParameter("code4")));
			dto.setTest5(Integer.parseInt(request.getParameter("code5")));
			dto.setTest6(Integer.parseInt(request.getParameter("code6")));
			dto.setTest7(Integer.parseInt(request.getParameter("code7")));
			dto.setTest8(Integer.parseInt(request.getParameter("code8")));
			dto.setTest9(Integer.parseInt(request.getParameter("code9")));
			dto.setTest10(Integer.parseInt(request.getParameter("code10")));
		}else if(dto.getSubject().equals("전기기능사")) {
			dto.setTest1(Integer.parseInt(request.getParameter("sub1")));
			dto.setTest2(Integer.parseInt(request.getParameter("sub2")));
			dto.setTest3(Integer.parseInt(request.getParameter("sub3")));
			dto.setTest4(Integer.parseInt(request.getParameter("sub4")));
			dto.setTest5(Integer.parseInt(request.getParameter("sub5")));
			dto.setTest6(Integer.parseInt(request.getParameter("sub6")));
			dto.setTest7(Integer.parseInt(request.getParameter("sub7")));
			dto.setTest8(Integer.parseInt(request.getParameter("sub8")));
			dto.setTest9(Integer.parseInt(request.getParameter("sub9")));
			dto.setTest10(Integer.parseInt(request.getParameter("sub10")));
		}else if(dto.getSubject().equals("자동차정비기능사")) {
			dto.setTest1(Integer.parseInt(request.getParameter("car1")));
			dto.setTest2(Integer.parseInt(request.getParameter("car2")));
			dto.setTest3(Integer.parseInt(request.getParameter("car3")));
			dto.setTest4(Integer.parseInt(request.getParameter("car4")));
			dto.setTest5(Integer.parseInt(request.getParameter("car5")));
			dto.setTest6(Integer.parseInt(request.getParameter("car6")));
			dto.setTest7(Integer.parseInt(request.getParameter("car7")));
			dto.setTest8(Integer.parseInt(request.getParameter("car8")));
			dto.setTest9(Integer.parseInt(request.getParameter("car9")));
			dto.setTest10(Integer.parseInt(request.getParameter("car10")));
		}
		
		dao.getSubject(dto);
		dao.getTestInsert(dto);
		
		request.setAttribute("code", dto.getCode());
		
		ActionForward forward = new ActionForward();
		forward.setPath("check.do");
		forward.setRedirect(false);		
		return forward;
	}

}
