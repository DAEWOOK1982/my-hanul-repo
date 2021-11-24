import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.BookDAO;
import com.hanul.study.BookDTO;

@WebServlet("/gals.do")
public class GetAllListServlet extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		
		//전체회원 목록을 검색하는 메소드를 호출
		BookDAO dao = new BookDAO();
		ArrayList<BookDTO> list = dao.bookSearchAll();
		
		//결과를 응답(html)
		response.setContentType("text/html; charset=utf-8");	//MINE Type
		PrintWriter	out = response.getWriter();		//출력스트림
		out.println("<body>");
		out.println("<div align='center'>");
		out.println("<h3>[전체도서 정보보기]</h3>");
		out.println("<table border='1'>");
		out.println("<tr>");
		out.println("<th>도서명</th>");
		out.println("<th>저자</th>");
		out.println("<th>ISBN</th>");
		out.println("<th>출판사</th>");
		out.println("<th>단가</th>");
		out.println("<th>수량</th>");
		out.println("<th>가격</th>");
		out.println("<th>삭제</th>");
		
		out.println("</tr>");
		
		if(list.size() == 0) {
			out.println("<tr align='center'>");
			out.println("<td colspan='7'>도서목록이 없습니다</td>");
			out.println("</tr>");
		} else {
			for (BookDTO dto : list) {
				out.println("<tr align='center'>");
				out.println("<td>" + dto.getTiltle() + "</td>");
				out.println("<td>" + dto.getName() + "</td>");
				out.println("<td>" + dto.getIsbn() + "</td>");
				out.println("<td>" + dto.getComp() + "</td>");
				out.println("<td>" + dto.getCost()+ "</td>");
				out.println("<td>" + dto.getQty() + "</td>");
				out.println("<td>" + dto.getPrice() + "</td>");
				out.println("<td><a href='ds.do?isbn="+dto.getIsbn()+"'>삭제</a></td>");
				out.println("</tr>");
			}
		}
		out.println("</table>");
		out.println("<br/>");
		out.println("<a href='bookMain.html'>도서정보 입력하기</a>");
		out.println("</div>");
		
		out.println("</body>");
	}
		
}


