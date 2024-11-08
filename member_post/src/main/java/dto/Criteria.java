package dto;

import javax.servlet.http.HttpServlet;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Criteria extends HttpServlet{
	private int page = 1; // 시작 페이지 
	private int amount = 10; // 한 페이지당 보여줄 게시글의 갯수
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", amount=" + amount + "]";
	}
	
	
}
