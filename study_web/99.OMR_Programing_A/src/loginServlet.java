

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.testDAO;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/ls.do")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//유저가 입력한 값을 받는다 : id, name (index.jsp)		
		int testerid = Integer.parseInt(request.getParameter("testerid"));
		String testername = request.getParameter("testername");
		String test = "응시";
		
		request.setAttribute("testerid", testerid);
		request.setAttribute("testername", testername);
		response.setContentType("text/html; charset=utf-8"); 
		
		testDAO dao = new testDAO();
		int result = dao.login(testerid,testername);
		int result2 = dao.testCheck(testerid, test);
		PrintWriter out = response.getWriter();
		
		if(result == 1) {	//수험자 번호가 존재하고 이름도 일치함
			if(result2 == 1) {	//응시한 수험자
				RequestDispatcher rd = request.getRequestDispatcher("doneTester.jsp");
				rd.forward(request, response);
			}else {	//응시하지 않은 수험자
				RequestDispatcher rd = request.getRequestDispatcher("QnASheet.jsp");
				rd.forward(request, response);
			}
		} else if(result == 0) {	//이름이 일치하지 않음, 수험자 번호 존재
			out.print("<script>");
			out.print("alert('이름을 다시 입력해주세요.');");
			out.print("location.href = 'index.jsp'");
			out.print("</script>");
		} else if(result == -1) {	//수험자 번호 없음
			out.print("<script>");
			out.print("alert('수험번호가 존재하지 않습니다!');");
			out.print("location.href = 'index.jsp'");
			out.print("</script>");
		} else if(result == 2) {
			out.print("<script>");
			out.print("alert('응시자는 시험에 재응시 할 수 없습니다.');");
			out.print("location.href = 'index.jsp'");
			out.print("</script>");
		}
	}//service()
	

}
