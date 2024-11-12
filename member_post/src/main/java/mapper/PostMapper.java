package mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import vo.Post;

public interface PostMapper {
	List<Post> selectList();
	
	Post selectOne(Long pno);
	
	@Select("select now()")
	String now();
	
	int write(Post post);
}
