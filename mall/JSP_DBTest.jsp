<%@ page contentType="text/html;charset=EUC-KR" import="java.sql.*" %>

<% 

		try	{
			//1.����̹�����
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//2.db����
			Connection con = DriverManager.getConnection
							("jdbc:oracle:thin:@127.0.0.1:1521:EJBDB","jsp","db");
			//3.Statement��ü�� ��������
			//4.����
			//5.ó��
			out.println("���Ἲ��");
			//6.��������
			con.close();
		}
		catch (Exception e){
			System.out.println(e);
		}

%>