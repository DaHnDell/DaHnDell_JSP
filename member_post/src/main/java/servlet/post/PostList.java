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
import vo.Post;

@WebServlet("/post/list")
public class PostList extends HttpServlet{

	private PostService service = new PostServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println(service.list());
		req.setAttribute("posts", service.list());
		req.getRequestDispatcher("/WEB-INF/jsp/post/list.jsp").forward(req,resp);
	}
	
	
	
}
