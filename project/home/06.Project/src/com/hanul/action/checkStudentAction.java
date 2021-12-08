package com.hanul.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.dao.StudentDAO;
import com.hanul.dto.StudentDTO;


public class checkStudentAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		StudentDTO dto = new StudentDTO();
		dto.setCode(Integer.parseInt(request.getParameter("modal_code")));
		dto.setName(request.getParameter("modal_name"));
		
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(checkStudent(dto)+"");	

		return null;
	}
	
	public int checkStudent(StudentDTO dto){ 
		StudentDAO dao = new StudentDAO();
		return dao.checkStudent(dto);	
	}
}
	