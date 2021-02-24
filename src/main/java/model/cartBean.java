package model;

import java.util.ArrayList;

public class cartBean {
	
	public cartBean() {
		libri = new ArrayList<bookBean>();
	}
	
	public void addBook (bookBean book) {
		libri.add(book);
	}
	
	public void removeBook (bookBean book) {
		for (bookBean l : libri) {
			if(l.getISBN()==book.getISBN()) {
				libri.remove(l);
				break;
			}
		}
	}
	
	public ArrayList<bookBean> returnBooks (){
		return libri;
	}
		
	//Variabile d'istanza
	private ArrayList<bookBean> libri;
}
