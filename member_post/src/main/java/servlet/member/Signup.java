package servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Member;

@WebServlet("/signup")
public class Signup extends HttpServlet{
	// get, post 모두 사용해야 하므로
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/jsp/member/signup.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String roadAddr = req.getParameter("roadAddress");
		String detailAddr = req.getParameter("address");
		
//		Member member = new Member();
//		member.setId(id);
//		member.setPw(pw);

		Member member = Member
				.builder()
				.id(id)
				.pw(pw)
				.name(name)
				.email(email)
				.roadAddr(roadAddr)
				.detailAddr(detailAddr)
				.build();

		System.out.println(member);
	}
	
}
