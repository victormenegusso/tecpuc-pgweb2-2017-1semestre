package aula;

import java.sql.Connection;
import java.sql.DriverManager;

public class FabricaConexao {
	
	public Connection obterConexao() throws Exception{
		String usuario = "root";
		String senha = "admin";
		String url = "jdbc:mysql://localhost:3306/aula";
		Class.forName("com.mysql.jdbc.Driver");

		Connection con;
		con = DriverManager.getConnection(url,usuario,senha);
		
		return con;
	}
	
	public static Connection obterConexao2() throws Exception{
		String usuario = "root";
		String senha = "admin";
		String url = "jdbc:mysql://localhost:3306/aula";
		Class.forName("com.mysql.jdbc.Driver");

		Connection con;
		con = DriverManager.getConnection(url,usuario,senha);
		
		return con;
	}
	
}
