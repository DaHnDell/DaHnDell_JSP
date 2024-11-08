package servlet.post;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import service.PostService;
import service.PostServiceImpl;
import utils.Commons;
import vo.Post;

@WebServlet("/post/view")
public class View extends HttpServlet{

	private PostService service = new PostServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pnoString = req.getParameter("pno");
		if(pnoString == null) {
			Commons.printMsg("SYSTEM :: ERR / INVALID APPROACH", "list", resp);
			return;
		}
		Long bno = Long.valueOf(pnoString);
		req.setAttribute("post", service.view(bno));
		req.getRequestDispatcher("/WEB-INF/jsp/post/view.jsp").forward(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
	
	
	
	
}
