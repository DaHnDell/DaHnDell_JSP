package servlet.post;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PostService;
import service.PostServiceImpl;
import utils.Commons;
import vo.Member;
import vo.Post;

@WebServlet("/post/modify")
public class Modify extends HttpServlet{
	private PostService service = new PostServiceImpl();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pnoStr = req.getParameter("pno");
		Object memberObj = req.getSession().getAttribute("member");
		
		if(pnoStr == null || memberObj == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", "list", resp);
			return;
		}
		
		Long pno = Long.valueOf(pnoStr);
		Member m = (Member)memberObj;
		System.out.println(m);
		System.out.println(pno);
		if(!m.getId().equals(service.findBy(pno).getWriter())) {
			Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY REMOVED BY WRITER OF IT\'S OWN", "list", resp);
			return;
		}
		req.setAttribute("post", service.findBy(pno));
		req.getRequestDispatcher("/WEB-INF/jsp/post/modify.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PostService post = new PostServiceImpl();
		Object memberObj = req.getSession().getAttribute("member");
		if(memberObj == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", "list", resp);
			return;
		}
		Member m = (Member)memberObj;
		
		String title = req.getParameter("title");		
		String content = req.getParameter("content");		
		String pnoStr = req.getParameter("pno");		
		Long pno = Long.valueOf(pnoStr);
		
		if(!m.getId().equals(service.findBy(pno).getWriter())) {
			Commons.printMsg("SYSTEM :: ERR / POST CAN BE ONLY MODED BY WRITER OF IT'S OWN", "list", resp);
			return;
		}
		
		service.modify(Post.builder().title(title).content(content).pno(pno).build());
		resp.sendRedirect("view?pno="+pno);
	}
	
}