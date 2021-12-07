package com.hanul.dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanul.dto.TestAnswerDTO;

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
	public TestAnswerDTO inputAnswerSearch(int code) {
		SqlSession session = sqlMapper.openSession();
		TestAnswerDTO dto = null;
		dto = session.selectOne("inputAnswerSearch", code);
		session.close();
		return dto;
	}
}
