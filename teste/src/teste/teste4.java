package teste;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;

public class teste4 {
	static boolean running = true;

	public static void main(String[] args) {
		try {
			run();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void run() throws IOException {
		BufferedInputStream reader = new BufferedInputStream(new FileInputStream( "/home/victor/Downloads/apache-tomcat-8.5.11/logs/catalina.out" ) );

	    while( running ) {
	        if( reader.available() > 0 ) {
	            System.out.print( (char)reader.read() );
	        }
	        else {
	            try {
	                Thread.sleep( 500 );
	            }
	            catch( InterruptedException ex ) {
	                running = false;
	            }
	        }
	    }
	}
}
