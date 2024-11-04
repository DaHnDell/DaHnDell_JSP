package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.sql.Statement;

import org.mariadb.jdbc.Driver;

import vo.Member;

public class MemberDao {
	// CRUD
	public int insert(Member member){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
//			String sql = "INSERT into tbl_member(id, pw, name) values('" + member.getId() + "', '" + member.getPw() + "', '" + member.getName() + "')";
			String sql = "insert into tbl_member(id, pw, name, email, road_addr, detail_addr) values(?, ?, ?, ?, ?, ?)";
			// 컬럼 개수와 문자의 지시자 개수는 같아야만,,(Format 느낌)
			//		1.connection 객체 취득
            conn = DriverManager.getConnection("jdbc:mariadb://54.180.153.135:3306/post", "sample", "1234");
            //		2.문장생성, 파라미터 지정
//            Statement stmt = conn.createStatement();
            pstmt = conn.prepareStatement(sql);
            
            int idx = 1;
            
            pstmt.setString(idx++, member.getId()); // 넣는 자료형에 따른 변환
            pstmt.setString(idx++, member.getPw()); 
            pstmt.setString(idx++, member.getName()); 
            pstmt.setString(idx++, member.getEmail()); 
            pstmt.setString(idx++, member.getRoadAddr()); 
            pstmt.setString(idx++, member.getDetailAddr()); 
            // statement 는 실행 시점에야 문장을 알게 됨.
            // 반대로 prepared 로 하면 미리 문장을 가져와서 바인딩하게 됨. 
            //		3.문장 실행
            return pstmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
        	try {
				pstmt.close();
				conn.close();
			} catch (SQLException ignore) { }
        }
		return 0;
	}
	
	
	
	public static void main(String[] args) {
		MemberDao dao = new MemberDao();
		int result = dao.insert(Member.builder().id("test03").pw("1234").name("SparrowPoo").build());
		System.out.println(result);
		// 원래 이런 테스트 전용 메서드는 테스트 전용 로그 도구, 테스트 전용 클래스를 활용해야 한다.
	}

	private static final MemberDao dao = new MemberDao();
	// 
	public static MemberDao getInstancce() {
		return dao;
	}
	
	public MemberDao() {}
}
