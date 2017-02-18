package com.org.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB_Connection {
	Connection connection = null;
	
	protected String url = "jdbc:mysql://125.181.79.156:3306/notice";
	protected String db_id = "develop";
	protected String db_pw = " develop";
	
	
	public static void getConnection(){
		
		
	}
	
	public DB_Connection(){
	}
	
	public void  db_close(Connection con, Statement stmt, ResultSet rs) throws SQLException{
		rs.close();
		stmt.close();
		con.close();
	}
	
	public  Connection db_connection() throws SQLException, ClassNotFoundException{
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url,db_id,db_pw);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
}
