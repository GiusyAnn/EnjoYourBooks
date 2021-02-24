package model;

public class bookBean {

		public bookBean() {
		}
		
		//Variabili D'isanza
		private String ISBN, Titolo, Genere, Autore, Copertina, Trama, CasaEditrice, Tipo, Username;
		private double Prezzo;
		private int Quantita;
		private boolean Approvazione;
		
		//Metodi
		public String getISBN() {
			return ISBN;
		}
		public void setISBN(String iSBN) {
			ISBN = iSBN;
		}
		public String getTitolo() {
			return Titolo;
		}
		public void setTitolo(String titolo) {
			Titolo = titolo;
		}
		public String getGenere() {
			return Genere;
		}
		public void setGenere(String genere) {
			Genere = genere;
		}
		public String getAutore() {
			return Autore;
		}
		public void setAutore(String autore) {
			Autore = autore;
		}
		public String getCopertina() {
			return Copertina;
		}
		public void setCopertina(String copertina) {
			Copertina = copertina;
		}
		public String getTrama() {
			return Trama;
		}
		public void setTrama(String trama) {
			Trama = trama;
		}
		public String getCasaEditrice() {
			return CasaEditrice;
		}
		public void setCasaEditrice(String casaEditrice) {
			CasaEditrice = casaEditrice;
		}
		public String getTipo() {
			return Tipo;
		}
		public void setTipo(String tipo) {
			Tipo = tipo;
		}
		public double getPrezzo() {
			return Prezzo;
		}
		public void setPrezzo(double prezzo) {
			Prezzo = prezzo;
		}
		public int getQuantita() {
			return Quantita;
		}
		public void setQuantita(int quantita) {
			Quantita = quantita;
		}
		public String getUsername() {
			return Username;
		}
		public void setUsername(String username) {
			Username = username;
		}
		public boolean isApprovazione() {
			return Approvazione;
		}
		public void setApprovazione(boolean approvazione) {
			Approvazione = approvazione;
		}
		
			
}
