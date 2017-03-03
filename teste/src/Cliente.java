import java.io.*;
import java.net.*;

public class Cliente 
{
	public static void main(String [] args)
	{
		try
		{
			System.out.println("Começando Cliente...");
			
			Socket s = new Socket("localhost",5000);
			InputStream is = s.getInputStream();//entrada do socket//
			OutputStream os = s.getOutputStream();//saida do socket//
			
			DataInputStream entrada = new DataInputStream(is);
			DataOutputStream saida = new DataOutputStream(os);
			
			// envia e recebe dados //
			saida.writeUTF("Victor");
			int quantidade = entrada.readInt();
			System.out.println("quantidade = " + quantidade);
			
			saida.writeUTF("MULTIPLICAÇÃO");
			saida.writeFloat(2);
			saida.writeFloat(5);
			
			Double resultado = entrada.readDouble();
			
			System.out.println(" 2 * 5 = " + resultado);
			
			// encerra a conexão //
			entrada.close();
			saida.close();
			s.close();
			
			System.out.println("Clinte Terminou.");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
}
