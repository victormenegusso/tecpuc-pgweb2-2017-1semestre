package aula_0512;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/carregarimagem")
public class ServletCarregadorImg extends HttpServlet{
	
	
	@Override
	protected void service(
			HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		//String diretorio = "C:/TEMP/img/";
		String diretorio = "/tmp/img/";
		String arquivo_nome;
		
		// obter o nome da foto para carregar
		arquivo_nome = request.getParameter("foto");
		
		// carregar a foto na memoria //
		byte[] arquivo;
		File file = new File(diretorio + arquivo_nome);
		arquivo = new byte[ (int)file.length() ];
		
		FileInputStream fis;
		fis = new FileInputStream( file );
		fis.read( arquivo );
		
		// devolver a foto para o navegador 
		response.setContentType("image/png");
		response.getOutputStream().write( arquivo );
	}
	
}
