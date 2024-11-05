package servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/signin")
public class Signin extends HttpServlet{
	private MemberService service = new MemberServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/signin.jsp").forward(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
//		Cookie cookie = new Cookie("id", null);
		if(service.login(id, pw)) {
			HttpSession session =  req.getSession();
			session.setAttribute("member", service.findBy(id));
//			cookie.setValue(service.findBy(id).getId());
			// login 성공
//			resp.addCookie(cookie);
			resp.sendRedirect(req.getContextPath()+"/index");
		}else {
//			cookie.setMaxAge(0);
			resp.sendRedirect("login?msg=fail");
			// get 방식이어서 파라미터에 관한 것도 생성해야만 함.
		}
	}
	
	
}
