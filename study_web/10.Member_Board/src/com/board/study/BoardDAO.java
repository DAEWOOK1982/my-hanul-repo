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
				dto.setBoard_readcount(rs.getInt("board_readcount"));
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
	
	//전체 글의 개수
	public int getListCount() {
		conn = getConn();
		String sql = "select count(*) from memberBoard";
		int listCount = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				//listCount = rs.getInt("count(*)");	//Column Label
				listCount = rs.getInt(1);	//Column Index
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getListCount() Exception!!!");
		} finally {
			dbClose();
		}
		return listCount;
	}//getListCount()
	
	//전체 글 목록 검색(Feat : 페이징 처리) → Method OverLoading
	public ArrayList<BoardDTO> getBoardList(int nowPage, int limit) {
		conn = getConn();
		String sql = "select * from ";
		sql += "(select rownum rnum, board_num, board_id, board_subject, board_content, ";
		sql += "board_file, board_re_ref, board_re_lev, board_re_seq, board_readcount, board_date from ";
		sql += "(select * from memberBoard order by board_re_ref desc, board_re_seq asc)) ";
		sql += "where rnum >= ? and rnum <= ?";
		
		int startRow = (nowPage - 1) * limit + 1;	//읽기 시작할 rownum(rnum)
		int endRow = startRow + limit - 1;			//읽을 마지막 rownum(rnum)
		
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
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
				dto.setBoard_readcount(rs.getInt("board_readcount"));
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
	
	//상세보기를 위한 특정 글 검색
	public BoardDTO getDetail(int board_num) {
		conn = getConn();
		String sql = "select * from memberBoard where board_num = ?";
		BoardDTO dto = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_num);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBoard_num(rs.getInt("board_num"));
				dto.setBoard_id(rs.getString("board_id"));
				dto.setBoard_subject(rs.getString("board_subject"));
				dto.setBoard_content(rs.getString("board_content"));
				dto.setBoard_file(rs.getString("board_file"));
				dto.setBoard_re_ref(rs.getInt("board_re_ref"));
				dto.setBoard_re_lev(rs.getInt("board_re_lev"));
				dto.setBoard_re_seq(rs.getInt("board_re_seq"));
				dto.setBoard_readcount(rs.getInt("board_readcount"));
				dto.setBoard_date(rs.getDate("board_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getDetail() Exception!!!");
		} finally {
			dbClose();
		}
		return dto;
	}//getDetail()
	
	//조회수 증가
	public void setReadCountPlus(int board_num) {
		conn = getConn();
		String sql = "update memberBoard set board_readcount = ";
		sql += "board_readcount + 1 where board_num = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("setReadCountPlus() Exception!!!");
		} finally {
			dbClose();			
		}
	}//setReadCountPlus()
	
	//작성자 확인
	public boolean isBoardWriter(String id, int board_num) {
		conn = getConn();
		String sql = "select * from memberBoard where board_num = ?";
		boolean result = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_num);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(id.equals(rs.getString("board_id"))) {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isBoardWriter() Exception!!!");
		} finally {
			dbClose();			
		}
		return result;
	}//isBoardWriter()
	
	//글 삭제
	public int boardDelete(int board_num) {
		conn = getConn();
		String sql = "delete from memberBoard where board_num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_num);
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardDelete() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	}//boardDelete()
	
	//글 수정하기
	public int boardUpdate(BoardDTO dto) {
		conn = getConn();
		String sql = "update memberBoard ";
		sql += "set board_subject = ?, board_content = ? ";
		sql += "where board_num = ?";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBoard_subject());
			ps.setString(2, dto.getBoard_content());
			ps.setInt(3, dto.getBoard_num());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardUpdate() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	}//boardUpdate()
	
	//답글 등록
	public int boardReply(BoardDTO dto) {
		conn = getConn();
		String sql = "";
		int succ = 0;
		try {
			//등록할 답글의 등록번호
			sql = "select max(board_num) from memberBoard";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int b_num = 0;
			if(rs.next()) {
				b_num = rs.getInt(1);	//b_num = rs.getInt(max(board_num));
				b_num += 1;
			}
			
			int board_re_ref = dto.getBoard_re_ref();	//답글의 참조번호(원본글 번호)
			int board_re_lev = dto.getBoard_re_lev();	//답글의 깊이(첫번째 답글, 답글의 답글, ~~)
			int boadr_re_seq = dto.getBoard_re_seq();	//답글의 순서
			
			sql = "update memberBoard ";
			sql += "set board_re_seq = board_re_seq + 1 ";
			sql += "where board_re_ref = ? and board_re_seq > ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, board_re_ref);
			ps.setInt(2, boadr_re_seq);
			ps.executeUpdate();
			
			board_re_lev += 1;
			boadr_re_seq += 1;
			
			sql = "insert into memberBoard values(?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, b_num);
			ps.setString(2, dto.getBoard_id());
			ps.setString(3, dto.getBoard_subject());
			ps.setString(4, dto.getBoard_content());
			ps.setString(5, "");		//답글에는 파일첨부 기능이 없다
			ps.setInt(6, board_re_ref);	//board_re_ref : 답글의 참조 번호
			ps.setInt(7, board_re_lev);	//board_re_lev : 답글의 답글
			ps.setInt(8, boadr_re_seq);	//board_re_seq : 답글의 순서
			ps.setInt(9, 0);			//board_readcount : 조회수		
			succ = ps.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("boardReply() Exception!!!");
		} finally {
			dbClose();			
		}
		return succ;
	}//boardReply()
	
	//조건검색
    public ArrayList<BoardDTO> boardSearch(BoardSearchDTO sdto) {
        conn = getConn();
        //String sql = "select * from memberBoard where upper(?) like upper('?')";
        String sql = "select * from memberBoard where ";
        sql += "upper("+sdto.getPart()+") like upper('"+sdto.getSearchData()+"') ";
        sql += "order by board_num desc";

        ArrayList<BoardDTO> list = new ArrayList<>();
        try {

            ps = conn.prepareStatement(sql);
            //ps.setString(1, sdto.getPart());
            //ps.setString(2, sdto.getSearchData());
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
                dto.setBoard_readcount(rs.getInt("board_readcount"));
                dto.setBoard_date(rs.getDate("board_date"));
                list.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("boardSearch() Exception!!!");
        } finally {
            dbClose();
        }
        return list;
    }//boardSearch() 
	
}//class
