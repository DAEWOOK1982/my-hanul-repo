package com.hanul.study;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BookDAO {				//DB와 연동
	private Connection conn;		//연결객체
	private PreparedStatement ps;	//전송객체
	private ResultSet rs; 			//결과객체
	
	//DB접속
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
	
	//DB접속해제
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
	
	//isbn 중복체크
	public boolean isbnCheck(String isbn) {
		conn= getConn();
		String sql = "select count(*) cnt from tblbook where isbn = ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			rs = ps.executeQuery();
			while(rs.next()) {
				if(rs.getInt("cnt")==1) {
					return false;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("isbnCheck() Exception!!!!");
		} finally {
			dbClose();
		}
		return true;
	}//isbnCheck()
	
	//도서정보입력
	public int bookInsert(BookDTO dto) {
		conn = getConn(); //DB접속
		
		String sql = "insert into tblbook values(?, ?, ?, ?, ?, ?, ?)";
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);	//전송객체 생성
			ps.setString(1, dto.getTiltle());	//매개변수 값을 세팅
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getIsbn());
			ps.setString(4, dto.getComp());
			ps.setInt(5, dto.getCost());
			ps.setInt(6, dto.getQty());
			ps.setInt(7, dto.getCost()*dto.getQty());
			succ = ps.executeUpdate();			//SQL 문장을 실행
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("bookInsert() Exception!!!");
		} finally {
			dbClose();
		}
		return succ;
	}//bookInsert()
	
	//전체도서 목록 검색
	public ArrayList<BookDTO> bookSearchAll() {
		conn = getConn();	//DB접속
		String sql = "select * from tblbook";  //SQL 문장 작성
		ArrayList<BookDTO> list = new ArrayList<>();	//최종결과를 저장할 컬렉션 자료구조를 생성
		try {
			ps = conn.prepareStatement(sql); 	//전송객체 생성
			rs = ps.executeQuery();				//SQL문장 실행
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setTiltle(rs.getString("title"));
				dto.setName(rs.getString("name"));
				dto.setIsbn(rs.getString("isbn"));
				dto.setComp(rs.getString("comp"));
				dto.setCost(rs.getInt("cost"));
				dto.setQty(rs.getInt("qty"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("bookSearchAll() Exception!!!");
		} finally {
			dbClose();	//DB접속 해제
		}
		return list;
	}//bookSearchAll
	
	//도서정보 삭제
	public int bookDelete(String isbn) {
		conn = getConn();
		String sql = "delete from tblbook where isbn = ?";	//SQL 문장 작성
		int succ = 0;
		try {
			ps = conn.prepareStatement(sql);	//전송객체생성
			ps.setString(1, isbn);				//매개변수 값을 세팅
			succ = ps.executeUpdate();			//SQL문장 실행
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("bookDelete() Exeption!!!");
		} finally {
			dbClose();	//DB접속 해제
		}
		return succ;	//결과값을 리턴
	}//bookDelete()

}//class



