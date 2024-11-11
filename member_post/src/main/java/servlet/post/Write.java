package servlet.post;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Criteria;
import service.PostService;
import service.PostServiceImpl;
import vo.Post;

@WebServlet("/post/write")
public class Write extends HttpServlet{
	PostService postService = new PostServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria criteria = new Criteria(req);
		if(req.getSession().getAttribute("member") == null){
			String cp = req.getContextPath();
			resp.sendRedirect(cp + "/signin?url=" + 
													URLEncoder.encode(cp + "/post/write" + criteria.getQs2(), "utf-8"));
			return;
		}
		req.setAttribute("criteria", criteria);
		req.getRequestDispatcher("/WEB-INF/jsp/post/write.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Criteria criteria = new Criteria(req);
		String title = req.getParameter("title"); 
		String content = req.getParameter("content"); 
		String writer  = req.getParameter("writer");
		
		postService.write(Post.builder().title(title).content(content).writer(writer).cno(criteria.getCategory()).build());
		
		resp.sendRedirect("list?"+criteria.getQs2());
	}

	
	
}
