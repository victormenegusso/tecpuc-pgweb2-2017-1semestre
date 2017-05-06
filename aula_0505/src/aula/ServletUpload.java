package aula;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class ServletUpload extends HttpServlet {

	@Override
	protected void service(
			HttpServletRequest request,
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		Part filepart;
		
		filepart = request.getPart("arquivo");
		
		
		PrintWriter out = response.getWriter();
		out.print( filepart.getName() +"<br/>");
		out.print( filepart.getSize() +"<br/>");
		out.print( filepart.getSubmittedFileName() +"<br/>");
		out.print( filepart.getContentType() +"<br/>");
		
		// filepart.write(C:/TEMP/img/img.png);
		// filepart.write("/tmp/img/img.png");
		String nomeArquivo;
		
		// jogando um nome randomico //
		nomeArquivo = UUID.randomUUID().toString();
		
		filepart.write("/tmp/img/"+nomeArquivo);
		
		
		
	}
	
}
