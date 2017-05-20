package aula_0519;

import java.util.ArrayList;

public class ProgramaLista2 {

	public static void main(String[] args) {
		
		// declarando a lista
		ArrayList<Produto> lista;
		
		// instanciando a lista
		lista = new ArrayList<>();
		
		// adicionando na lista
		Produto p;
		
		p = new Produto();
		p.setNome("manga");
		p.setDescricao("fruta dos ninjas");
		p.setPreco(1.0);
		
		lista.add( p ); 
		
		// segundo produto
		p = new Produto();
		p.setNome("xbox");
		p.setDescricao("video game");
		p.setPreco(1000.0);
		
		lista.add( p ); 
		
		// imprindo a lista
		System.out.println( lista );
		
		for( Produto prod : lista ){
			System.out.println( prod.getNome() );
			System.out.println( prod.getDescricao() );
			System.out.println( prod.getPreco() );

		}
		
		//lista.remove(0);
		String produtoRemover = "manga";
		//lista.remove(produtoRemover);
		
		// percorre todos os produtos
		for(int i = 0; i < lista.size(); i++){
			
			Produto aux = lista.get(i);
			// verifica se o nome do produto
			// eh igual ao nome na variavel
			// produtoRemover
			if(aux.getNome().equals( produtoRemover )){
				// i é a posição atual da lista
				lista.remove(i);
				break; // para o for
			}
			
		}
	}

}
