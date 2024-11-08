package service;

import java.util.List;

import dao.PostDao;
import vo.Post;

public class PostServiceImpl implements PostService{

	private final PostDao postdao = new PostDao();	
	
	@Override
	public int write(Post post){
		return postdao.insert(post);
	}
	
	@Override
	public int modify(Post post) {
		return postdao.update(post);
	}
	
	@Override
	public int remove(Long pno) {
		return postdao.delete(pno);
	}

	@Override
	public Post findBy(Long pno) {
		return postdao.selectOne(pno);
	}

	@Override
	public Post view(Long pno) {
		postdao.increaseViewCount(pno);
		return findBy(pno);
	}
	
	@Override
	public List<Post> list(){
		return postdao.selectList();
	}
	
	
}
