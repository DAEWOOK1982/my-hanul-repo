package com.hanul.study;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class testDAO {
	// 데이터 베이스 접속
	private Connection conn; // 연결 객체
	private PreparedStatement ps; // 전송객체
	private ResultSet rs; // 결과객체

	private static SqlSessionFactory sqlMapper;

	static {
	    try {
	        String resource = "com/hanul/mybatis/SqlMapConfig.xml";
	        InputStream inputStream = Resources.getResourceAsStream(resource);
	        sqlMapper = new SqlSessionFactoryBuilder().build(inputStream);
	    } catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("SqlSessionFactory Exception!!!");
	    }
	}//static(초기화 블럭)
	
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getconn() Exception");

		}
		return conn;
	}// getConn()

	// DB접속 해제
	public void dbClose() {
		try {
			if (rs != null) {
				rs.close();
			} // if rs close
			if (ps != null) {
				ps.close();
			} // if ps close
			if (conn != null) {
				conn.close();
			} // if conn close
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception");

		} // try & catch
	}// dbClose()
	
	// 로그인 값 : 1: tester_id가 있음 / 0: tester_id가 없음
	public int login(int testerid, String testername) {
		conn = getConn();

		String sql = "SELECT TESTER_NAME FROM TESTER_A WHERE TESTER_ID = ?";
		int result = -2; // 결과값을 반환할 변수
		try {
			ps = conn.prepareStatement(sql); // SQL문 전송
			ps.setInt(1, testerid); // 인자 설정
			rs = ps.executeQuery(); // SQL문 실행 후 결과 저장

			if (rs.next()) { // 수험번호가 존재한다 : tester_id가 있다.
				if (testername.equals(rs.getString("TESTER_NAME"))) {
					result = 1; // 이름 일치한다
				} else {
					result = 0; // 이름이 일치하지 않는다.
				}

			} else { // 수험번호가 존재하지 않는다 : tester_id가 없다
				result = -1;

			} // if
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("login() Exception");
		} finally {
			dbClose();
		}
		return result;
	}// login()
	
	// 응시여부 확인
	public int testCheck(int testerid, String test) {
		conn = getConn();
		String sql = "SELECT TEST FROM TESTER_A WHERE TESTER_ID = ?";
		int result2 = -2; // 결과값을 반환할 변수
		try {
			ps = conn.prepareStatement(sql); // SQL문 전송
			ps.setInt(1, testerid); // 인자 설정
			rs = ps.executeQuery(); // SQL문 실행 후 결과 저장

			if (rs.next()) { // 수험번호가 존재한다 : tester_id가 있다.
				if (test.equals(rs.getString("TEST"))) {
					result2 = 1; // 응시함
				} else {
					result2 = 0; // 응시하지 않음
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("login() Exception");
		} finally {
			dbClose();
		}
		return result2;
	}// login()
	
	// 추가접수
	public int insertTester(TesterDTO dto) {
		conn = getConn();
		String sql = "INSERT INTO TESTER_A VALUES(?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getTester_id());
			ps.setString(2, dto.getTester_name());
			ps.setString(3, dto.getTest());
			ps.setInt(4, dto.getScore());
			ps.setString(5, dto.getPup());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insertTester() Exception!!");
		} finally {
			dbClose();
		} // try
		return succ;
	}// insertTester()
	
	
	// 추가 접수 시 응시 번호 부여
	public ArrayList<TesterDTO> maxTesterId() {
		conn = getConn();
		String sql = "SELECT TESTER_ID FROM TESTER_A ORDER BY TESTER_ID DESC";
		ArrayList<TesterDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				TesterDTO dto = new TesterDTO();
				dto.setTester_id(rs.getInt("tester_id"));
				list.add(dto);
			} // while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("maxTesterId( Exception!!!");
		} finally {
			dbClose();
		}
		return list;
	}// maxTesterId
	
	// 관리자로그인
	public int searchManager(int managerid, String managername) {
		conn = getConn(); // DB에 접속
		String sql = "SELECT * FROM MANAGER_A WHERE MANAGER_ID =?";
		int result = -2;
		try {
			ps = conn.prepareStatement(sql); // SQL문 전송
			ps.setInt(1, managerid);
			rs = ps.executeQuery(); // SQL문 실행 후 결과 저장

			if (rs.next()) { // 매니저 ID가 존재한다
				if (managername.equals(rs.getString("MANAGER_NAME"))) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception e) { // 예외 상황 시 작동
			e.printStackTrace();
			System.out.println("searchManager Exception!!!");
		} finally {
			dbClose(); // DB연결해제
		} // try & catch & finally
		return result;
	}// searchManager
	
	// 수험자목록
	public ArrayList<TesterDTO> searchAllTester() {
		conn = getConn();
		String sql = "SELECT * FROM TESTER_A ORDER BY SCORE DESC, TESTER_ID ASC";
		ArrayList<TesterDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				TesterDTO dto = new TesterDTO();
				dto.setTester_id(rs.getInt("tester_id"));
				dto.setTester_name(rs.getString("tester_name"));
				dto.setTest(rs.getString("test"));
				dto.setScore(rs.getInt("score"));
				dto.setPup(rs.getString("pup"));
				list.add(dto);
			} // while
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("searchAllTester() Exception!!!");
		} finally {
			dbClose();
		} // try
		return list;
	}// searchAllTester()
	
	
	// 정답 비교
	public ArrayList<Integer> CheckAnswer() {
		conn = getConn(); // DB연결
		String sql = "SELECT * FROM ANSWER_A ORDER BY Q_NUMBER";
		ArrayList<Integer> answerList = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql); // SQL문 실행
			rs = ps.executeQuery(); // sql문 실행후 결과값 저장

			while (rs.next()) {
				answerList.add(rs.getInt("A_NUMBER"));
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CheckAnswer() Exception");

		} finally {
			dbClose(); // DB 해제

		}
		return answerList;
	}// checkAnswer()


	//응시번호를 이용한 수험자 번호 검색 
	public TesterDTO getByid(int testerid) {
		conn = getConn();
		String sql = "SELECT * FROM TESTER_A where TESTER_ID = ?";
		TesterDTO dto = null;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, testerid);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new TesterDTO();
				dto.setTester_id(rs.getInt("tester_id"));
				dto.setTester_name(rs.getString("tester_name"));
				dto.setTest(rs.getString("test"));
				dto.setScore(rs.getInt("score"));
				dto.setPup(rs.getString("pup"));
			}//if
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getByid() Exception!!!");
		} finally {
			dbClose();
		}//try
		return dto;
	}//getByid()
	
	//시험 결과 저장
	public int insetTestResult(TesterDTO dto) {
		conn = getConn();
		String sql = "UPDATE TESTER_A SET TESTER_NAME =?, PUP =?, SCORE=?, TEST=? where tester_id = ?";
		int succ = 0;
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTester_name());
			ps.setString(2, dto.getPup());
			ps.setInt(3, dto.getScore());
			ps.setString(4, dto.getTest());
			ps.setInt(5, dto.getTester_id());
			succ=ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("insetTestResult() Exception!!!");
		} finally {
			dbClose();
		}//try
		return succ;
	}//insterTestResult()
	
	
	// 응시자정보 수정
	public int updateTester(TesterDTO dto) {
		conn = getConn();
		String sql = "UPDATE TESTER_A SET TESTER_NAME=?, TEST = ?, PUP = ?, SCORE = ? WHERE TESTER_ID = ?";
		int succ = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getTester_name());
			ps.setString(2, dto.getTest());
			ps.setString(3, dto.getPup());
			ps.setInt(4, dto.getScore());
			ps.setInt(5, dto.getTester_id());
			succ = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("updateTester() Exception!!!");

		} finally {
			dbClose();

		} // try
		return succ;

	}// updateTester()
	
	// 응시자 삭제
	public int deleteTester(int tester_id) {
		conn = getConn();
		String sql = "DELETE FROM TESTER_A WHERE TESTER_ID = ?";
		int succ = 0;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, tester_id);
			succ = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("deleterTester() Exception!!");

		} finally {
			dbClose();

		}
		return succ;

	}

	public List<TesterDTO> testerSearch(SearchDTO dto){
		SqlSession session = sqlMapper.openSession();
		List<TesterDTO> list = null;
		list = session.selectList("testerSearch", dto);
		session.close();
		return list;
	}
	
}
