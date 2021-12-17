package com.member.study;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import net.sf.json.JSONArray;

public class MemberDAO {
	//DB 접속 : myBatis
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
	}//초기화 블럭

	//ID 조회 : 중복검사
	public String getMember_idList() {
		SqlSession session =  sqlMapper.openSession();
		List<MemberDTO> list = null;
		list = session.selectList("getMember_idList");
		session.close();
		
		JSONArray array = JSONArray.fromObject(list);
		String json = array.toString();
		return json;
		
 	}//getMember_idList()
	
	//회원가입
	public int joinMember(MemberDTO dto) {
		SqlSession session = sqlMapper.openSession();
		int succ = 0;
		succ = session.insert("joinMember", dto);
		session.commit();
		session.close();
		return succ;
	}//
	
	//회원여부
	public int isMember(MemberDTO dto) {
		SqlSession session = sqlMapper.openSession();
		MemberDTO isDto = null;
		isDto = session.selectOne("isMember", dto);
		session.close();
		
		int result = -1;
		if(isDto != null) {
			if(isDto.getMember_pw().equals(dto.getMember_pw()) ) {
				result =1;
			}else {
				result = 0;
			}
			}else {
				result = -1;
		}
		return result;
	}//isMember()
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class
