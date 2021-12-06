import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hanul.study.testDAO;

@WebServlet("/ss.do")
public class ScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//수험자 번호를 받는다.
		request.setCharacterEncoding("UTF-8");
		//유저가 선택한 값을 받는다 name : Q(숫자) 이므로 "Q" + i
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			for(int i = 1; i <=20; i++) {
				list.add(Integer .parseInt(request.getParameter("Q" + i)));
			}//for
		} catch (Exception e) {
		
		}
		
		int score = 0;
		
		//DB에 접속해서 정답을 가져온다
		testDAO dao = new testDAO();
		ArrayList<Integer> answerList = dao.CheckAnswer();
		
		//점수 계산 : 
		for(int i=0; i <list.size(); i++) {
			if(list.get(i)==answerList.get(i)) {
				score += 5;
			}
		}
		
		//점수와 내가 선택한 답안/ 정답/ 점수를 넘긴다
		request.setAttribute("score", score);
		request.setAttribute("list", list);
		request.setAttribute("answerList", answerList);
		
		try {
			RequestDispatcher rd = request.getRequestDispatcher("resultScore.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}//service

}
