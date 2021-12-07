package com.hanul.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.action.Action;
import com.hanul.action.ActionForward;
import com.hanul.action.GetCodeAction;
import com.hanul.action.checkStudentAction;
import com.hanul.action.testAction;


@WebServlet("/TestFrontController")
public class TestFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI(); //web.xml - uri-pattern 값 
		String ctx = request.getContextPath(); //context root 값 : 
		String command = uri.substring(ctx.length()); //실제 요청한 페이지 : /xxx.do
		
		//2. 클라이언트의 요청(*.do)과 실제 처리할 Action Class(비지니스 로직) 연결 ▶ testxxxAction.java
		Action action = null;
		ActionForward forward = null;
		if(command.equals("/test.do")) {
			action = new testAction();
			forward = action.excute(request, response);
		} else if(command.equals("/GetCode.do")) {
			action = new GetCodeAction();
			forward = action.excute(request, response);
		} else if(command.equals("/checkStudent.do")) {
			action = new checkStudentAction();
			forward = action.excute(request, response);
		}
		
		//3. 프리젠테이션 로직(결과출력) : 페이지 전환 → forward(), sendRedirect() ▶ ActionFoward.java
		if(forward != null) {
			if(forward.isRedirect()) { //true : sendRedirect()
				response.sendRedirect(forward.getPath());
			} else { //false : forward()
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}//if
	}
}
