package com.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.commons.action.Action;
import com.commons.action.ActionForward;
import com.member.study.MemberDAO;

public class MemberSecessionAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");		//로그인 된 id
		String member_id = request.getParameter("member_id");	//삭제할 id
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(id == null) {	//로그인 되지 않은 상태
			out.println("<script>alert('정상적인 접근방식이 아닙니다!');");
			out.println("location.href='memberLogin.me';</script>");
			//return null;
		}else if(!id.equals(member_id)) {	//로그인 id와 삭제할 id가 일치하지 않다
			out.println("<script>alert('정상적인 접근방식이 아닙니다!');");
			out.println("location.href='boardList.bo';</script>");
			//return null;
		}else {	//탈퇴할 회원이 인증됨
			MemberDAO dao = new MemberDAO();
			int succ = dao.deleteMember(member_id);
			session.removeAttribute("id");	//세션 객체를 제거
			if(succ > 0) {
				out.println("<script>alert('정상적으로 회원 탈퇴 되었습니다.');");
				out.println("location.href='memberLogin.me';</script>");
			}else {
				out.println("<script>alert('회원 탈퇴 처리가 완료되지 않았습니다.');");
				out.println("location.href='boardList.bo';</script>");
			}
			//return null;
		}		
		return null;
	}	
}
