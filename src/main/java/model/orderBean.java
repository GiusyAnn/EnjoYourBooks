package model;

import java.sql.Date;

public class orderBean {
	public orderBean() {
		
	}
	
	//Variabili D'istanza
	public String     Username;
	public int CodiceOrdine;
	public double PrezzoTotale;
	public Date DataO;
	

	public String getUsername() {
		return Username;
	}
	public int getCodiceOrdine() {
		return CodiceOrdine;
	}
	public double getPrezzoTotale() {
		return PrezzoTotale;
	}
	public Date getDataO() {
		return DataO;
	}
	
	public void setUsername(String username) {
		Username = username;
	}
	public void setCodiceOrdine(int codiceOrdine) {
		CodiceOrdine = codiceOrdine;
	}
	public void setPrezzoTotale(double prezzoTotale) {
		PrezzoTotale = prezzoTotale;
	}
	public void setDataO(Date dataO) {
		DataO = dataO;
	}
	
	
}
