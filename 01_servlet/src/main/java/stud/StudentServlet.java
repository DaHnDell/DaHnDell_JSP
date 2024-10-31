package stud;

import java.io.ByteArrayInputStream;
import java.io.CharArrayReader;
import java.io.IOException;
import java.io.PrintWriter;
//import java.util.Scanner;
import java.io.StringReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println();
//		Scanner scanner = new Scanner(System.in);
//		resp.setContentType("text/html; charset=utf-8");
		PrintWriter pw = resp.getWriter();
		pw.println("<body>");
		pw.println("<h1>안녕 세상</h1>");
		pw.println("</body>");
		
		ByteArrayInputStream bais =new ByteArrayInputStream(new byte[] {10, 20, 30});
		CharArrayReader car = new CharArrayReader(new char[] {'가', '나'});
		StringReader sr = new StringReader("가나다라");
		
		for(int i = 0; i < 4; i++) {
			System.out.println((char)sr.read());
		}
	}
	
}
