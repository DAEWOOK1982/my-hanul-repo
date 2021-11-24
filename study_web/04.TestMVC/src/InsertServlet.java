import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;
import com.hanul.study.BookDTO;
@WebServlet("/is.do")
public class InsertServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		//① 클라이언트의 요청을 받는다 : 매개변수를 가져온다
		request.setCharacterEncoding("utf-8");	//인코딩 설정
		
		//디폴트 생성자 메소드를 이용하여 DTO 객체를 생성
		BookDTO dto = new BookDTO();
		dto.setTiltle(request.getParameter("title"));
		dto.setName(request.getParameter("name"));
		dto.setIsbn(request.getParameter("isbn"));
		dto.setComp(request.getParameter("comp"));
		dto.setCost(Integer.parseInt(request.getParameter("cost")));
		dto.setQty(Integer.parseInt(request.getParameter("qty")));
		
		
		//② DAO 클래스를 통해서 DataBase 연동
		BookDAO dao = new BookDAO();
		int succ = dao.bookInsert(dto);
		
		//③ 결과를 응답(html)
		response.setContentType("text/html; charset=utf-8");	//MINE Type
		PrintWriter out = response.getWriter();		//출력스트림
		if(succ >0) {
			out.println("<script>alert('도서정보 입력성공');</script>");
			out.println("<a href='bookMain.html'>도서정보 입력하기</a>");
			out.println("<br/>");
			out.println("<a href='gals.do'>전체도서 정보보기</a>");
		}else {
			out.println("<script>alert('도서정보 입력실패');</script>");
			out.println("<a href='bookMain.html'>도서정보 입력하기</a>");
			out.println("<br/>");
			out.println("<a href='gals.do'>전체도서 목록보기</a>");
		}

	}

}
