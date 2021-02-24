package model;

public class dettagliBean {
	public dettagliBean() {
		
	}
	
	//Variabili d'istanza
	public String ISBN, Titolo, Copertina, Autore;
	public int CodiceOrdine, IVA, Quantita;
	public double Prezzo;
	
	
	public String getAutore() {
		return Autore;
	}
	public void setAutore(String autore) {
		Autore = autore;
	}
	public String getTitolo() {
		return Titolo;
	}
	public void setTitolo(String titolo) {
		Titolo = titolo;
	}
	public String getCopertina() {
		return Copertina;
	}
	public void setCopertina(String copertina) {
		Copertina = copertina;
	}
	
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public int getCodiceOrdine() {
		return CodiceOrdine;
	}
	public void setCodiceOrdine(int codiceOrdine) {
		CodiceOrdine = codiceOrdine;
	}
	public int getIVA() {
		return IVA;
	}
	public void setIVA(int iVA) {
		IVA = iVA;
	}
	public int getQuantita() {
		return Quantita;
	}
	public void setQuantita(int quantita) {
		Quantita = quantita;
	}
	public double getPrezzo() {
		return Prezzo;
	}
	public void setPrezzo(double prezzo) {
		Prezzo = prezzo;
	}
	


}
