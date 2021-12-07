package com.hanul.dao;

import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.hanul.dto.StudentDTO;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

public class StudentDAO {
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
	
	//수험번호 등록
	public int getCode() {
		
		int code = 0;
		SqlSession session = sqlMapper.openSession();
		if(session.selectOne("com.hanul.mybatis.testMapper.xml.checkCode") == null) {
			code = 210100;
			return code;
		} else {
		code = session.selectOne("com.hanul.mybatis.testMapper.xml.checkCode");
		code ++;
		session.close();		
		return code;
		}
	}
	
	//수험생 등록
	public void getStudent(StudentDTO dto) {
		SqlSession session = sqlMapper.openSession();
		session.insert("com.hanul.mybatis.testMapper.xml.getStudent", dto);
		session.commit();
		session.close();
	}
	
	//수험생 확인
	public int checkStudent(StudentDTO dto) {
		int succ = 0;
		SqlSession session = sqlMapper.openSession();
		if(session.selectOne("com.hanul.mybatis.testMapper.xml.checkStudent", dto) != null) {
			succ = 1;
		} else {
			succ = 0;
		}		
		session.close();
		return succ;
	}
}//class
