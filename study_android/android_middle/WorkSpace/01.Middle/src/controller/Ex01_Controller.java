package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

@WebServlet("*.and")
public class Ex01_Controller extends HttpServlet {
// 맵핑뒤에 .and로 끝나면 모든 처리를 여기서 하겟다. ↑
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//MultiPart => 
		
		//나중에 Srping으로 바꿀꺼임.
		//ANDROID에서 요청을 함 (url , 필요하다면 파라메터도 보냄)
		//DB에 바로접속이 안되기때문에 미들웨어라는 WAS서버 , Node.js....
		String path = req.getRealPath("/");
		System.out.println(path);
		MultipartRequest reqs = new MultipartRequest(req, path ,300000);
		System.out.println(reqs.getParameter("key"));
		PrintWriter out = res.getWriter();
		out.print("anbafglkajdflj");
		
		
		
		
	}

}
