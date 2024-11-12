package service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import mapper.PostMapper;
import utils.MybatisInIt;
import vo.Post;

public class TestServiceImpl implements TestService{

	@Override
	public List<Post> list() {
		// 위 코드는 매 메서드마다 있어야 함
		try(SqlSession session = MybatisInIt.getInstance().sqlSessionFactory().openSession()){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.selectList();
		}
	}

	@Override
	public Post findBy(Long pno) {
		try(SqlSession session = MybatisInIt.getInstance().sqlSessionFactory().openSession()){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.selectOne(pno);
		}
	}
	
	@Override
	public int write(Post post) {
		try(SqlSession session = MybatisInIt.getInstance().sqlSessionFactory().openSession(true)){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.write(post);
		}
	}

	@Override
	public String now() {
		try(SqlSession session = MybatisInIt.getInstance().sqlSessionFactory().openSession()){
			PostMapper mapper = session.getMapper(PostMapper.class);
			return mapper.now();
		}
	}

	public static void main(String[] args) {
		TestService service = new TestServiceImpl();
//		System.out.println(service.findBy(21L));
//		System.out.println(service.now());
		System.out.println(service.write(Post.builder().title("마이바티스 제목").content("마이바티스 내용").writer("rlagksals").build()));
	}
}