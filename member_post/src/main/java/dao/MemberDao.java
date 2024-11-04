package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import vo.Member;

public class MemberDao {
	// CRUD
	public int insert(Member member) {
		try {
			String sql = "INSERT into tbl_member(id, pw, name) values('" + member.getId() + "', '" + member.getPw() + "', '" + member.getName() + "')";
			//		1.connection 객체 취득
            Connection conn = DriverManager.getConnection("jdbc:mariadb://54.180.153.135:3306/post", "sample", "1234");
            //		2.문장생성, 파라미터 지정
            Statement stmt = conn.createStatement();
            //		3.문장 실행
            return stmt.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return 0;
	}
	
	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		int result = dao.insert(Member.builder().id("test01").pw("1234").name("CowPoo").build());
		System.out.println(result);
		// 원래 이런 테스트 전용 메서드는 테스트 전용 로그 도구, 테스트 전용 클래스를 활용해야 한다.
	}
}
