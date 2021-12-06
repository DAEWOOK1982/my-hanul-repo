import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hanul.study.TesterDTO;
import com.hanul.study.testDAO;

@WebServlet("/gals.do")
public class GetAllListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		testDAO dao = new testDAO();
		ArrayList<TesterDTO> list = dao.searchAllTester();
		
		request.setAttribute("list", list);				//list를 바인딩 후
		RequestDispatcher rd = request.getRequestDispatcher("Tester.jsp");	//Tester.jsp 호출
		rd.forward(request, response);	
		
	}//service()
}//class