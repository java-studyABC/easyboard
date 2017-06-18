package org.easyboard.controller;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

public class MybatisTest extends TestConfig{

	@Inject
	private SqlSession session;
	
	@Test
	public void test()throws Exception{
		System.out.println(session);
	}
	
	
	
}
