package model;

import java.sql.Date;

public class fatturaBean {
	public fatturaBean() {
		
	}
	
	//Variabili d'Istanza
	public Date dataorder ;
	public int numordine, quantita, iva;
	public String isbn, titolo;
	public double prezzo, totale;
	
	//Metodi Get e Set
	public Date getDataorder() {
		return dataorder;
	}
	public double getTotale() {
		return totale;
	}
	public void setTotale(double totale) {
		this.totale = totale;
	}
	public void setDataorder(Date dataorder) {
		this.dataorder = dataorder;
	}
	public int getNumordine() {
		return numordine;
	}
	public void setNumordine(int numordine) {
		this.numordine = numordine;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	public int getIva() {
		return iva;
	}
	public void setIva(int iva) {
		this.iva = iva;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitolo() {
		return titolo;
	}
	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	
	

}
