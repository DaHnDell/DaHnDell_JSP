package servlet.repy;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.codehaus.jackson.map.ObjectMapper;
import service.ReplyServceImpl;
import service.ReplyService;

@WebServlet("/reply/*")
public class ReplyController extends HttpServlet{
	private ReplyService service = ReplyServceImpl.getInstance();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String s = req.getRequestURI();
		s = s.replace(req.getContextPath()+"/reply/", "");
		System.out.println(s);
		Object ret = null;
		if(s.startsWith("list")) { // 목록 조회
			int tmpIdx = s.lastIndexOf("/");
			Long pno = 0L;
			if(tmpIdx != -1) {
				pno = Long.valueOf(s.substring(tmpIdx+1));
			}
			ret = service.list(pno);
			System.out.println(service.list(pno));
		}
		else {
			Long rno = Long.valueOf(s);
			ret = service.findBy(rno);
		}
		resp.setContentType("application/json; charset-utf-8");
		resp.getWriter().print(new ObjectMapper().writeValueAsString(ret));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		char[] chs = new char[req.getContentLength()];
		req.getReader().read(chs);
		String str = new String(chs);
		System.out.println(str);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
