package vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@AllArgsConstructor
@Builder
public class Reply {
	private Long rno;
	private String content;
	private Date regDate;
	private Date updateDate;
	private boolean hidden;
	private int likes;
	private String writer;
	private Long pno;
	
	
}
