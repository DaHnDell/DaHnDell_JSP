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
		String rem = req.getParameter("remember-id");
//		System.out.println(rem);
		
		
//			cookie.setValue(service.findBy(id).getId());
//			resp.addCookie(cookie);
//			cookie.setMaxAge(0);
		if(service.login(id, pw)) {
			// login 성공
			HttpSession session =  req.getSession();
			session.setAttribute("member", service.findBy(id));
			
			// 쿠키의 id 기억 처리 여부
			if(rem != null) {
				Cookie cookie = new Cookie("remember-id", id);
				cookie.setMaxAge(60 * 60 * 24 * 7);
				resp.addCookie(cookie);
			}else{
				// 아이디 기억 안할때 처리할 일들.
				Cookie[] cookies = req.getCookies();
				for(Cookie c : cookies) {
					if(c.getName().equals("rememeber-id")) {
						c.setMaxAge(0);
						resp.addCookie(c);
						break;
					}
				}
			}
			resp.sendRedirect(req.getContextPath()+"/index");
		}else{
			resp.sendRedirect("login?msg=fail");
		}
		
		// get 방식이어서 파라미터에 관한 것도 생성해야만 함.
	}
	
	
}