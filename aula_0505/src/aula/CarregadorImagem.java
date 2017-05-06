package aula;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/carregarimg")
public class CarregadorImagem extends HttpServlet{

	@Override
	protected void service(
			HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		String pathArquivo;
		//pathArquivo = "C:/TEMP/img/img.png";
		pathArquivo = "/tmp/img/img.png";
		
		// carregar o arquivo do computador
		byte[] arquivo;
		File file = new File(pathArquivo);
		arquivo = new byte[ (int)file.length() ];
		
		FileInputStream fis;
		fis = new FileInputStream( file );
		fis.read( arquivo );
		
		// retorna o conteudo do arquivo
		// para o navegador
		response.setContentType("image/png");
		response.getOutputStream().write( arquivo );
		
		
	}
	
}
