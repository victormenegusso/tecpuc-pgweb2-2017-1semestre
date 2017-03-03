package teste;

import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URL;
import java.net.UnknownHostException;

public class teste3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

        String ipAddress = "8.8.8.8";
        InetAddress inet;
		try {
				inet = InetAddress.getByName(ipAddress);
		        boolean reachable = inet.isReachable(5000);
		        
		        System.out.println( inet.getAddress() );
		        System.out.println( inet.getAddress()[0] );
		        System.out.println( inet.getCanonicalHostName() );
		        System.out.println( inet.getHostAddress() );
		        System.out.println( inet.getHostName() );
		        
		        System.out.println(reachable);
	        
	        
	        System.out.println("----");
	        
	        Ping r = ping(new URL("http://www.google.com"));
	        System.out.println(r.host);
	        System.out.println(r.ip);
	        System.out.println( r.dns );
	        System.out.println( r.cnt );
	        System.out.println(r.net);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	public static class Ping {
	    public String net = "NO_CONNECTION";
	    public String host;
	    public String ip;
	    public int dns = Integer.MAX_VALUE;
	    public int cnt = Integer.MAX_VALUE;
	}

	public static Ping ping(URL url) {
	    Ping r = new Ping();
	    //if (isNetworkConnected(ctx)) {
	    //    r.net = getNetworkType(ctx);
	        try {
	            String hostAddress;
	            long start = System.currentTimeMillis();
	            hostAddress = InetAddress.getByName(url.getHost()).getHostAddress();
	            long dnsResolved = System.currentTimeMillis();
	            Socket socket = new Socket(hostAddress, url.getPort());
	            socket.close();
	            long probeFinish = System.currentTimeMillis();
	            r.dns = (int) (dnsResolved - start);
	            r.cnt = (int) (probeFinish - dnsResolved);
	            r.host = url.getHost();
	            r.ip = hostAddress;
	        }
	        catch (Exception ex) {
	            //Timber.e("Unable to ping");
	        }
	    //}
	    return r;
	}

}
