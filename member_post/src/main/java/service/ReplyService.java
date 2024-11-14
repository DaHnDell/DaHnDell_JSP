package service;

import java.util.List;

import vo.Reply;

public interface ReplyService {
	
	int write(Reply reply); 
	int modify(Reply reply);
	int remove(Long rno);
	int removeAll(Long pno);
	
	Reply findBy(Long rno);
	List<Reply> list(Long pno); // 댓글은 포스트에 종속된 존재이기 때문임.
	List<Reply> myList(String id);
	
//	int increaseLikes(Long rno);
	
	
	
}
