import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.testDAO;
import com.hanul.study.TesterDTO;

@WebServlet("/js.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int testerid = Integer.parseInt(request.getParameter("testerid"));
		String testername = request.getParameter("testername");
		String test = "미응시";
		int score = Integer.parseInt(request.getParameter("score"));
		String pup = "불합격";
		
		TesterDTO dto = new TesterDTO(testerid, testername, pup, score, test);
		
		testDAO dao = new testDAO();
		int succ = dao.insertTester(dto);
		
		response.setContentType("text/html; charset=utf-8"); 	//MIME Type
		PrintWriter out = response.getWriter();					//출력스트림
		
		if (succ > 0) {
			out.println("<script>alert('완료되었습니다.'); location.href='index.jsp';</script>");
			out.flush();
		} else {
			out.println("<script>alert('관리자에게 문의 바랍니다.'); location.href='index.jsp';</script>");
		}//if
	}//service

}//TestJoinServlet
