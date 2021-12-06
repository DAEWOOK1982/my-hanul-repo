import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.TesterDTO;
import com.hanul.study.testDAO;

@WebServlet("/us.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int testerid = Integer.parseInt(request.getParameter("testerid"));
		String testername = request.getParameter("testername");
		String test = request.getParameter("test");
		int score = Integer.parseInt(request.getParameter("score"));
		String pup = request.getParameter("pup");
		
		TesterDTO dto = new TesterDTO(testerid, testername, test, score, pup);
		
		testDAO dao = new testDAO();
		int succ = dao.updateTester(dto);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(succ > 0) {
			out.print("<script>");
			out.print("alert('수정 완료 되었습니다.');");
			out.print("location.href = 'gals.do'");
			out.print("</script>");
		}else {
			out.print("<script>");
			out.print("alert('수정 실패 되었습니다.');");
			out.print("location.href = 'gals.do'");
			out.print("</script>");
		}//if
			
		
	}

}
