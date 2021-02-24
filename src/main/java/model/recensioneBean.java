package model;

public class recensioneBean {
	public recensioneBean() {
		
	}
	
	//Variabili D'istanza
	public String Username, ISBN, Commento, Foto;
	public int voto;
	
	
	public String getFoto() {
		return Foto;
	}
	public void setFoto(String foto) {
		Foto = foto;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public String getCommento() {
		return Commento;
	}
	public void setCommento(String commento) {
		Commento = commento;
	}
	public int getVoto() {
		return voto;
	}
	public void setVoto(int voto) {
		this.voto = voto;
	}

}
