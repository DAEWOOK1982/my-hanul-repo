package com.hanul.study;

public class TesterDTO {
	//멤버 변수 선언
	private int tester_id;
	private String tester_name;
	private String test;
	private int score;
	private String pup;
	
	//디폴트 생성자
	public TesterDTO() {}

	public TesterDTO(int tester_id, String tester_name, String test, int score, String pup) {
		super();
		this.tester_id = tester_id;
		this.tester_name = tester_name;
		this.test = test;
		this.score = score;
		this.pup = pup;
	}

	public int getTester_id() {
		return tester_id;
	}

	public void setTester_id(int tester_id) {
		this.tester_id = tester_id;
	}

	public String getTester_name() {
		return tester_name;
	}

	public void setTester_name(String tester_name) {
		this.tester_name = tester_name;
	}

	public String getTest() {
		return test;
	}

	public void setTest(String test) {
		this.test = test;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getPup() {
		return pup;
	}

	public void setPup(String pup) {
		this.pup = pup;
	}
}	