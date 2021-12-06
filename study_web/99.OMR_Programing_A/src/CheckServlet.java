import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.testDAO;

@WebServlet("/cs.do")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		int testerid = Integer.parseInt(request.getParameter("testerid"));
		String testername = request.getParameter("testername");
		request.setAttribute("testerid", testerid);
		request.setAttribute("testername", testername);
		response.setContentType("text/html; charset=utf-8"); 
		
		testDAO dao = new testDAO();
		int result = dao.searchManager(testerid, testername); 
		PrintWriter out = response.getWriter();
		
		int sign = 0;
		if(result == 1) {	//관리자 번호가 존재하고, 이름도 일치
			sign = 3;
			out.print(sign);
		} else if(result == 0) {	//이름이 일치하지 않음, 관리자 번호 존재
			sign = 0;
			out.print(sign);
		} else if(result == -1) {	//관리자 번호 없음
			sign = 1;
			out.print(sign);
		}
	}//service

}//TesterCheck
