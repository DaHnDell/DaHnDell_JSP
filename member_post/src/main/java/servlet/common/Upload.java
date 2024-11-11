package servlet.common;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/upload")
public class Upload extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024*1024);
		factory.setRepository(new File("c:/upload/tmp"));
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		List<FileItem> items;
		try {
			items = upload.parseRequest(req);
			items.forEach(item->{
				System.out.println(item.getName());
				System.out.println(item.getSize());
			});
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
				

	}
	
	

}
