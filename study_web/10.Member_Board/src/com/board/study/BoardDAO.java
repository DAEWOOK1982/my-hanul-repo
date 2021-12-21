package com.board.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	//DB접속 : JDBC
	private Connection conn;		//연결객체
	private PreparedStatement ps;	//전송객체
	private ResultSet rs;			//결과객체
	
	//DB접속 : ojdbc8.jar(C:\oracle18c\dbhomeXE\jdbc\lib) → WebContent > WEB-INF > lib : 복&붙 ▶ 정적로딩
	public Connection getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hanul";
		String password = "0000";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");	//동적로딩
			conn = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getConn() Exception!!!");
		}
		return conn;
	}//getConn()
	
	//DB접속 해제
	public void dbClose() {
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("dbClose() Exception!!!");
		}
	}//dbClose()
	
	//글 등록
	public int boardInsert(BoardDTO dto) {
		conn = getConn();
		String sql = "";
		int succ = 0;
		try {
			//글 번호(board_num)를 먼저 검색한 후, 등록 할 글 번호(b_num)를 결정
			sql = "select max(board_num) from memberBoard";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			int b_num = 0;
			if(rs.next()) {	//등록된 글이 있다.
				//b_num = rs.getInt("max(board_num)");	//Column Label
				b_num = rs.getInt(1);	//Column Index
				b_num += 1;
			}else {			//최초 등록
				b_num = 1;
			}
						
			//글 등록하는 쿼리 작성
			sql = "insert into memberBoard values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_num);
			ps.setString(2, dto.getBoard_id());
			ps.setString(3, dto.getBoard_subject());
			ps.setString(4, dto.getBoard_content());
			ps.setString(5, dto.getBoard_file());
			ps.setInt(6, b_num);	//board_re_ref : 답글의 참조 번호
			ps.setInt(7, 0);		//board_re_lev : 답글의 답글
			ps.setInt(8, 0);		//board_re_seq : 답글의 순서
			ps.setInt(9, 0);		//board_readcount : 조회수		
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardInsert() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	}//boardInsert()
	
	//전체 글 목록 검색(페이징 미처리, 답글 미등록)
	public ArrayList<BoardDTO> getBoardList() {
		conn = getConn();
		String sql = "select * from memberBoard order by board_num desc";
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_id(rs.getString("board_id"));
				dto.setBoard_subject(rs.getString("board_subject"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_file(rs.getString("board_file"));
				dto.setBoard_re_ref(rs.getInt("board_re_ref"));
				dto.setBoard_re_lev(rs.getInt("board_re_lev"));
				dto.setBoard_re_seq(rs.getInt("board_re_seq"));
				dto.setBoard_date(rs.getDate("board_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getBoardList() Exception!!!");
		} finally {
			dbClose();
		}
		return list;
	}//getBoardList()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class
