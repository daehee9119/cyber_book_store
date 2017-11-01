package com.test.db;

import java.sql.*;
import javax.sql.*;
import javax.sql.DataSource;
import javax.naming.*;

public class DBManager{

	public DBManager() {}
	
	public Connection getConnection(String div) throws Exception{
	
		Connection con = null;	//¿¬°á
		
	    try	{
	    	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	    }
	    catch(Exception e)	{	throw e;  }
	
	   try 	{
			con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:EJBDB","jsp","db");
	   }
	   catch(Exception e){	throw e;   }

	   return con;
	
	}
	

}