package aula;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/meuservlet2")
public class MeuServlet2 extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(
			HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		
		// obtendo parametro
		String nome;
		nome = request.getParameter("nome");
		
		System.out.println( nome );
		
		// depois de processar
		// retornamos a pagina f2.jsp
		
		request.setAttribute("nome", nome);
		
		RequestDispatcher rd;
		rd = request.getRequestDispatcher("f2.jsp");
		rd.forward(request, response);
	}
	
}




