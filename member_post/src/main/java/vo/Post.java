package vo;

import java.util.Date;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Post {
	private final Long pno;
	private final String title;
	private final String writer;
	private final String content;
	private final Long viewCnt;
	private final Date regDate;
	private final Date updateDate;

//	public final Post() {
//		
//	}
	
	private Post(Long pno, String title, String writer, String content, Long viewCnt, Date regDate, Date updateDate) {
		
		this.pno = pno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.viewCnt = viewCnt;
		this.regDate = regDate;
		this.updateDate = updateDate;
	}
	
//	public static P builder() {
//		return new P();
//	}
//	
//	public static class P {
//		Long pno;
//		String title;
//		String writer;
//		String content;
//		Long viewCnt;
//		Date regDate;
//		Date updateDate;
//		
//		public P pno(Long pno) {
//			this.pno = pno;
//			return this;
//		}
//		public P title(String title) {
//			this.title = title;
//			return this;
//		}
//		public P writer(String writer) {
//			this.writer = writer;
//			return this;
//		}
//		public P content(String conent) {
//			this.content = conent;
//			return this;
//		}
//		public P viewCnt(Long viewCnt) {
//			this.viewCnt = viewCnt;
//			return this;
//		}
//		public P regDate(Date regDate) {
//			this.regDate = regDate;
//			return this;
//		}
//
//		public P update(Date updateDate) {
//			this.updateDate = updateDate;
//			return this;
//		}
//
//		public Post build() {
// 			return new Post(pno, title, writer, content, viewCnt, regDate, updateDate);
//		}
//	}
//	

}
