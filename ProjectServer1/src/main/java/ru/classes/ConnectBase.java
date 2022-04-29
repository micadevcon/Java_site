package ru.classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectBase {
	
	public static Connection GetConnection() {
		
		final String URL="jdbc:sqlite:C:/Users/micad/Downloads/учеба/3 курс/2 семестр/СТИП/1-4/Java_site/ProjectServer1/src/main/bd/base.db";
        Connection connectionBase = null;
        try {
        	try {
				Class.forName("org.sqlite.JDBC");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	connectionBase = DriverManager.getConnection(URL);
        	
        	} 
         catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connectionBase;
	}
	public static Statement GetStatementBase(Connection connectionBase) {
		
        Statement statement = null;
        try {
        	statement = connectionBase.createStatement();
        }catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return statement;
	}
}
