<%@ page contentType="text/html;charset=EUC-KR" import="java.sql.*" %>

<% 

		try	{
			//1.드라이버선택
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2.db연결
			Connection con = DriverManager.getConnection
							("jdbc:oracle:thin:@127.0.0.1:1521:EJBDB","jsp","db");
			//3.Statement객체및 쿼리생성
			//4.실행
			//5.처리
			out.println("연결성공");
			//6.연결해제
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}

%>