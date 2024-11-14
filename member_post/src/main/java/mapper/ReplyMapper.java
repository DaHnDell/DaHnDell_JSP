package mapper;

import java.util.List;

import vo.Reply;

public interface ReplyMapper {
//	int write(Reply reply); ? 답글?
	
	int insert(Reply reply); 
	int update(Reply reply);
	int delete(Long rno);
	int deleteAll(Long pno);
	
	Reply selectOne(Long rno);
	List<Reply> selectList(Long pno); // 댓글은 포스트에 종속된 존재이기 때문임.
	List<Reply> selectMyList(String id);
	
//	int increaseLikes(Long rno);
}
