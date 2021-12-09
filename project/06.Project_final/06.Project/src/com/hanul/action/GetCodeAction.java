package com.hanul.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.StudentDAO;


public class GetCodeAction implements Action{
		
	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf8");
		response.getWriter().write(getCode()+"");
		
		
		return null;
	}
	
	public int getCode(){ 
		StudentDAO dao = new StudentDAO();
		return dao.getCode();		
	}
}
