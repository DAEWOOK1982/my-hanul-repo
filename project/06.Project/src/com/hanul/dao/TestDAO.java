package com.hanul.dao;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanul.dto.AnswerDTO;
import com.hanul.dto.TestDTO;

public class TestDAO {
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
	}
	
	//수험생 입력답안 확인
	public List<TestDTO> inputAnswerSearch(int code) {
		SqlSession session = sqlMapper.openSession();
		List<TestDTO> tlist = null;
		tlist = session.selectOne("inputAnswerSearch", code);
		session.close();
		return tlist;
	}
	
	//과목 정답 확인
	public List<AnswerDTO> answerSearch(String sub) {
		SqlSession session = sqlMapper.openSession();
		List<AnswerDTO> alist = null;
		alist = session.selectList("answerSearch", sub);
		session.close();
		return alist;
	}
	
	//수험자 시험 과목 확인
	public String searchSubject(int code) {
		SqlSession session = sqlMapper.openSession();
		String sub;
		sub = session.selectOne("searchSubject", code);
		session.close();
		return sub;
	}

}
