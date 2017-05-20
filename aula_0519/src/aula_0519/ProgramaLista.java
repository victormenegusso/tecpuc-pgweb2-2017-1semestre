package aula_0519;

import java.util.ArrayList;

public class ProgramaLista {

	public static void main(String[] args) {
		
		// declarando a lista de textp
		ArrayList<String> lista;
		
		// instancio a lista
		lista = new ArrayList<>();
		
		// adicionando itens 
		lista.add("manga");
		lista.add("arroz");
		lista.add("feijao");
		lista.add("maracuja");
		
		System.out.println( lista );
		System.out.println( lista.size() );
		
		for(String item : lista){
			System.out.println( item );
		}
		
		System.out.println( lista.get(2) );
		
		lista.remove(2);
		
		for(String item : lista){
			System.out.println( item );
		}
		
	}

}
