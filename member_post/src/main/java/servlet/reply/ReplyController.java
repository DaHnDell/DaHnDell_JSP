package servlet.reply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import service.ReplyServceImpl;
import service.ReplyService;
import vo.Reply;

@WebServlet("/reply/*")
public class ReplyController extends HttpServlet{
	private ReplyService service = ReplyServceImpl.getInstance();
	private Gson gson = new GsonBuilder().setDateFormat("yyyy/MM/dd-HH:mm:ss").create(); // 제이슨 객체를 만드는 아주 기본적인 방식
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
				String stmp = s.substring(tmpIdx+1);
				String[] stmps = stmp.split("/");
				
				switch(stmps.length) {
				case 0 :
				case 2 :
					break;
				case 3 :
					break;
				}
				
//				pno = Long.valueOf(s.substring(tmpIdx+1));
				
			}
			ret = service.list(pno);
			System.out.println(service.list(pno));
		}
		else {
			Long rno = Long.valueOf(s);
			ret = service.findBy(rno);
		}
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(gson.toJson(ret));
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		char[] chs = new char[req.getContentLength()];
//		req.getReader().read(chs);
//		String str = new String(chs);
//		
//		Reply reply = gson.fromJson(str, Reply.class);
//		gson.fromJson(req.getReader(), Reply.class);
//		service.write(reply);
		Reply reply = gson.fromJson(req.getReader(), Reply.class);
		System.out.println(reply);
		service.write(reply);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		char[] chs = new char[req.getContentLength()];
		req.getReader().read(chs);
//		String str = new String(chs);
		
		Reply reply = gson.fromJson(req.getReader(), Reply.class);
		service.modify(reply);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		uri = uri.replace(req.getContextPath()+"/reply/", "");
		System.out.println(uri);
		Object ret = null;
		if(uri.startsWith("list")) { // 목록 조회
			int tmpIdx = uri.lastIndexOf("/");
			Long pno = 0L;
			if(tmpIdx != -1) {
				pno = Long.valueOf(uri.substring(tmpIdx+1));
			}
			ret = service.removeAll(pno);
			System.out.println(service.list(pno));
		}
		else { // 단일 조회
			Long rno = Long.valueOf(uri);
			ret = service.remove(rno);
		}
		resp.setContentType("application/json; charset=utf-8");
		resp.getWriter().print(gson.toJson(ret));
	}
	
}
