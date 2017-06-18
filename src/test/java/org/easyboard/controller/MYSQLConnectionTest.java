package org.easyboard.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MYSQLConnectionTest {

	private static final String DRIVER =
			"com.mysql.jdbc.Driver";
	private static final String URL = 
			"jdbc:mysql://localHost:3306/easyboard";
	private static final String USER =
			"gm";
	private static final String PW = 
			"board";
	
	@Test
	public void testConnection() throws Exception{
		
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)){
			System.out.println(con);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	
}
