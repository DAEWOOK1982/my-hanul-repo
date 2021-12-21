package com.board.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.study.BoardDAO;
import com.board.study.BoardDTO;
import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardAddAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//1. 클라이언트의 요청을 받는다 : 전달된 매개변수를 가져온다
		//request.getParameter(); → 파일첨부 기능을 구현해야 한다 ▶ MultipartRequest 객체를 생성해야한다.
		//MultipartRequest.getParameter(); ▶ 일반적으로 전달되는 매개변수를 가져온다.
		//multi.getFilesystemName((String) multi.getFileNames().nextElement()); ▶ 파일첨부의 매개변수를 가져온다.
		
		request.setCharacterEncoding("utf-8");
		//String saveFolder = "boardupload";
		//String realFolder = request.getRealPath(saveFolder);
		//System.out.println(realFolder);
		
		String realFolder = "";	//업로드한 파일이 저장되는 경로(위치)
		realFolder = "D:\\Study_Web\\workspace\\10.Member_Board\\WebContent\\boardupload";
		int fileSize = 5 * 1024 * 1024;	//최대용량 : 5MB
		
		MultipartRequest multi = null;	//파일 업로드 처리를 위한 클래스
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();	//파일명의 중복 방지를 위한 객체
		multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", policy);
		//매개변수를 전달받기 위한 객체생성 : request, 저장위치, 최대용량, 인코딩, 중복방지
		
		BoardDTO dto = new BoardDTO();
		dto.setBoard_id(multi.getParameter("board_id"));
		//System.out.println("ID : " + dto.getBoard_id());
		
		dto.setBoard_subject(multi.getParameter("board_subject"));
		//System.out.println("Subject : " + dto.getBoard_subject());
		
		dto.setBoard_content(multi.getParameter("board_content"));
		//System.out.println("Content : " + dto.getBoard_content());
		
		//dto.setBoard_file(multi.getParameter("board_file"));	//파일명 중복검사 수행하지 않았다.
		//System.out.println("File : " + dto.getBoard_file());	//null
		dto.setBoard_file(multi.getFilesystemName((String) multi.getFileNames().nextElement()));		
		//System.out.println(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		
		//2. 비지니스 로직
		BoardDAO dao = new BoardDAO();
		int succ = dao.boardInsert(dto);
		
		//3. 프리젠테이션 로직
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(succ > 0) {
			out.println("<script>alert('등록성공');");
			out.println("location.href='boardList.bo';</script>");
			//return null;
		}else {
			out.println("<script>alert('등록실패');");
			out.println("location.href='boardList.bo';</script>");
			//return null;
		}		
		return null;
	}
}//class
