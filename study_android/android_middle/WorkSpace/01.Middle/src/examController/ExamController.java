package examController;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * Servlet implementation class ExamController
 */
@WebServlet("*.exam")
public class ExamController extends HttpServlet {
	String resource = "mybatis/config.xml";
	InputStream inputStream;
	SqlSessionFactory sqlSessionFactory;
	SqlSession session;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		initMybatis();
		if (req.getServletPath().equals("/grading.exam")) {
			List<ExamVO> list = session.selectList("mybatis.test.lsit");
			int total_cnt = Integer.parseInt(req.getParameter("tt_cnt") + "");
			for (int i = 0; i < total_cnt; i++) {
				String dap = req.getParameter((i + 1) + "");
				if (list.get(i).getExam_dap().equals(dap)) {
					System.out.println("맞음");
				} else {
					System.out.println("틀림");
				}
			}

		} else {
			List<ExamVO> list = session.selectList("mybatis.test.lsit");
			req.setAttribute("list", list);
			RequestDispatcher rd = req.getRequestDispatcher("main.jsp");
			rd.forward(req, resp);
		}
	}

	public void initMybatis() {

		try {
			inputStream = Resources.getResourceAsStream(resource);

			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sqlSessionFactory.openSession();

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
