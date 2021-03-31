package smartit.u1classm;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.mysql.jdbc.exceptions.MySQLSyntaxErrorException;

public class DBUtill {
	public static Connection getMySqlConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/basicjsp?useUnicode=true&characterEncoding=UTF-8";
			String user = "jspid";
			String password = "jsppass";
			
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("연결성공:"+conn);
			
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버 클래스가 없거나 로드할 수 없습니다.<br/>");
		} catch(MySQLSyntaxErrorException e) {
			System.out.println("데이터베이스가 없거나 이름이 올바르지 않습니다.<br/>");
		} catch(SQLException e) {
			System.out.println("데이터베이스 연결 정보가 올바르지 않습니다.<br/>");
		}
		return conn;
	}
	public static void close(Connection conn) {
		if(conn != null) { try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} }
	}
}
