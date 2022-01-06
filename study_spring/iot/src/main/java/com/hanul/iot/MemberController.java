package com.hanul.iot;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import member.MemberServiceImpl;
import member.MemberVO;

@Controller
public class MemberController {
	
	@Autowired private MemberServiceImpl service;
	
	// 로그아웃 처리 요청
	@RequestMapping ("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/"; // 로그아웃시 루트(home.jsp)로 이동
	}
	
	// 로그인 처리 요청
	@ResponseBody
	@RequestMapping ("/iotLogin")
	public boolean login(String id, String pw, HttpSession session) {
		// 화면에서 전송한 아이디, 비밀번호가 일치하는 회원정보를 DB에서 조회
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		MemberVO vo = service.member_login(map);
		session.setAttribute("loginInfo", vo);
		return vo == null ? false : true;
		// 결과값이 null 이면 false / null 이 아니면 true
	}
	
	// 로그인 화면 요청
	@RequestMapping ("/login")
	public String login() {
		
		return "member/login";
	}
	
}
