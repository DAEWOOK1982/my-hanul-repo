import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;
@WebServlet("/ds.do")
public class DeleteServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//매개변수를 가져온다
		request.setCharacterEncoding("utf-8");  //인코딩 설정
		String isbn = request.getParameter("isbn");
		
		//회원정보 삭제
		BookDAO dao = new BookDAO();
		int succ = dao.bookDelete(isbn);
		
		//결과를 응답(html)
		response.setContentType("text/html; charset=utf-8");	//MINE Type
		PrintWriter out = response.getWriter();		//출력스트림
		if(succ > 0) {
			out.println("<script>alert('도서정보 삭제성공!');</script>");
			out.println("<a href='bookMain.html'>도서정보 입력화면</a>");
			out.println("</br>");
			out.println("<a href='gals.do'>전체도서 정보보기</a>");
		}else {
			out.println("<script>alert('도서정보 삭제실패!');</script>");
			out.println("<a href='memberMain.html'>도서정보입력 가입화면</a>");
			out.println("</br>");
			out.println("<a href='gals.do'>전체도서 정보보기</a>");
		}
		
	}

}
