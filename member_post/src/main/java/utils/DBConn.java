package utils;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConn {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("org.mariadb.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mariadb://54.180.153.135:3306/post", "sample", "1234");
	}
	
	public static void main(String[] args) throws FileNotFoundException {
		Properties props = new Properties();
		Properties ps = System.getProperties();
		FileReader fileReader = new FileReader("./");
		System.out.println(fileReader);
	}
}
