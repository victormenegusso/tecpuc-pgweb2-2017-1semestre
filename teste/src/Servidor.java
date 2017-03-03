import java.io.*;
import java.net.*;

public class Servidor 
{

	public static void main(String[] args) 
	{
		try
		{
			System.out.println("Começando Servidor...");
			
			ServerSocket ss = new ServerSocket( 5000 );
			
			while(true)
			{
				System.out.println("Aguardando um cliente...");
				Socket s = ss.accept();// bloqueia e aguarda cliente //
				InputStream is = s.getInputStream();//entrada do socket//
				OutputStream os = s.getOutputStream();//saida do socket//
			
				DataInputStream entrada = new DataInputStream(is);
				DataOutputStream saida = new DataOutputStream(os);
			
				// envia e recebe dados //
				String nome = entrada.readUTF();
				System.out.println("nome = " + nome);
				saida.writeInt(3);
				
				String operação = entrada.readUTF();
				if(operação.equals("MULTIPLICAÇÃO"))
				{
					float x = entrada.readFloat();
					float y = entrada.readFloat();
					
					double produto = x * y;
					saida.writeDouble(produto);
				}
			
				// encerra a conexão //
				entrada.close();
				saida.close();
				s.close();
			}
			
			//System.out.println("Servidor Terminando.");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

}
