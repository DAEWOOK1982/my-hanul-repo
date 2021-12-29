package com.hanul.hello;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FormController {
	
	@RequestMapping("/joinParam")
	public String member(String name, String gender, String email, Model model) {
		
		model.addAttribute("method","RequestParam");
		model.addAttribute("name", name);
		model.addAttribute("gender", gender);
		model.addAttribute("email", email);
		
		return "member/info";
	}
	
	/*
	 * @RequestMapping("/joinParam") public String member(@RequestParam String
	 * name, @RequestParam String gender, @RequestParam String email, Model model) {
	 * 
	 * model.addAttribute("name", name); model.addAttribute("gender", gender);
	 * model.addAttribute("email", email);
	 * 
	 * return "member/info"; }
	 */	
	@RequestMapping("/joinRequest")
	public String member(HttpServletRequest request, Model model) {

		model.addAttribute("method","RequestParam");
		model.addAttribute("name", request.getParameter("name"));
		model.addAttribute("gender", request.getParameter("gender"));
		model.addAttribute("email", request.getParameter("email"));
		
		return "member/info";
	}
	
	// 값을 입력받을 페이지.. 회원가입 페이지를 생성 및 찾아가기
	@RequestMapping("/join")
	public String join() {
		
		return "member/join";	// forward 방식
	}

}
