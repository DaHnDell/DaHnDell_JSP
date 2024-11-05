package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import utils.DBConn;
import vo.Post;

public class PostDao {
	public int insert(Post post) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "insert into tbl_post(title,writer, content) values(?, ?, ?)";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, post.getTitle()); 
			pstmt.setString(idx++, post.getWriter()); 
			pstmt.setString(idx++, post.getContent()); 
			return pstmt.executeUpdate();
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException ignore) {
			}
		}
		return 0;
	}
	
	
	public static void main(String[] args) {
		PostDao dao = new PostDao();
//		int i = dao.insert(Post.builder().title("testTitle01").writer("rlagksals").content("testContent").build());
//		System.out.println(i);
		int j = dao.delete(2);
		System.out.println(j);
	}
	
	public int delete(long pno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from tbl_post where pno = " + pno;
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			return pstmt.executeUpdate();
		}catch(SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException ignore) {
			}
		}
		return 0;
	}
	
}
