package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lombok.extern.slf4j.Slf4j;
import utils.DBConn;
import vo.Post;

@Slf4j
public class PostDao {
	public int insert(Post post) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into tbl_post(title, writer, content) values(?, ?, ?)";
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
	
	public Post selectOne(Long pno) {
		Post post = null;
		String sql = "select pno, title, writer, content, view_cnt, regdate, updatedate from tbl_post where pno = ?";
		try (Connection conn = DBConn.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setLong(1, pno);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int idx = 1;
				post = Post
					.builder()
					.pno(rs.getLong(idx++))
					.title(rs.getString(idx++))
					.writer(rs.getString(idx++))
					.content(rs.getString(idx++))
					.viewCnt(rs.getLong(idx++))
					.regDate(rs.getDate(idx++))
					.updateDate(rs.getDate(idx++))
					.build();
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return post;
	}
	
	public List<Post> selectList(){
		List<Post> posts = new ArrayList<Post>();
		String sql = "select pno, title, writer, view_cnt, regdate from tbl_post";
		try (Connection conn = DBConn.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int idx = 1;
				Post post = Post
					.builder()
					.pno(rs.getLong(idx++))
					.title(rs.getString(idx++))
					.writer(rs.getString(idx++))
					.viewCnt(rs.getLong(idx++))
					.regDate(rs.getDate(idx++))
					.build();
				posts.add(post);
			}
			rs.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return posts;
	}
	
	
	public int update(Post post) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "update tbl_post set title = ?, content = ?, updatedate = now() where pno = ?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			int idx = 1;
			
			pstmt.setString(idx++, post.getTitle()); 
			pstmt.setString(idx++, post.getContent()); 
			pstmt.setLong(idx++, post.getPno()); 
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
	
	
	public int delete(Long pno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from tbl_post where pno = ?";
			conn = DBConn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, pno);
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
		
//		for(int i = 0; i < 10; i++) {
//			int j = dao.insert(Post.builder().writer("abcd").title("title + " + (i + 1)).content("Content " + i + 1).build());
//			System.out.println(i + " ::: " + j);
//		}
//		System.out.println();
//		dao.delete(6L);
//		System.out.println(dao.selectOne(6L));
//		int result = dao.insert(Post.builder().title("test@03").writer("rlagksals").content("contentTest.03").build());
//		System.out.println(result);
		
		
//		Post sel1Post = dao.selectOne(4L);
//		System.out.println(sel1Post);
//		int result2 = dao.update(sel1Post.builder().title("ctitle@").content("contentTest.03c").pno(sel1Post.getPno()).build()); 
//		System.out.println(result2);
//		
//		// 강사님 코드
//		Post post = dao.selectOne(10L);
//		System.out.println(post);
//		post = Post.builder().pno(post.getPno()).title("modTitle").content("modContent").build();
//		dao.update(post);
//		post = dao.selectOne(10L);
//		System.out.println(post);
		
		new PostDao().selectList().forEach(System.out::println);
	}
}
