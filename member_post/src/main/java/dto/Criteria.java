package dto;

import javax.servlet.http.HttpServlet;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Criteria extends HttpServlet{
	private int page; // 시작 페이지 
	private int amount; // 한 페이지당 보여줄 게시글의 갯수
	private int category; // 페이지 이동 중 항상 동반해야 할 vo, 추가적으로 조회를 할 때에도 필요함.
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", amount=" + amount + "]";
	}
	
	public int getOffSet() {
		return (page - 1) * amount;
	}
	
}
