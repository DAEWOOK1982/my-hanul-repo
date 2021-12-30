package com.hanul.iot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 고객관리 페이지 처리 @Controller 생성
@Controller
public class CustomerController {
	
	//고객 관리 목록
	@RequestMapping ("/list.cu")
	public String list() {
		
		return	"customer/list";
	}

}
