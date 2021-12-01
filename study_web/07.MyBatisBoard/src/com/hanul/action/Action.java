package com.hanul.action;

import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//public abstract void execute();	//추상메소드
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServerException, IOException;
}
