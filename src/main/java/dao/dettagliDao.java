package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DriverManagerConnectionPool;
import model.dettagliBean;

public class dettagliDao {
	public void dettagliDAO() {
		
	}
	
	public ArrayList<dettagliBean> getdettagli(int codice){
		try {
			java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
			System.out.println("DAO--> Prendiamo la tabella Ordini");
			String sql="SELECT *  " + 
					"From DettagliOrdine " + 
					"INNER JOIN Libri ON  DettagliOrdine.ISBN = Libri.ISBN  "
					+ "WHERE CodiceOrdine = ? ";
			
			PreparedStatement stm=conn.prepareStatement(sql);
			stm.setInt(1,codice);
			
			ResultSet res = stm.executeQuery();
			ArrayList<dettagliBean> elenco = new ArrayList<dettagliBean>();
			while (res.next())
			{
					dettagliBean ordine = new dettagliBean();								
					
					ordine.setISBN(res.getString(1));
					ordine.setCodiceOrdine(res.getInt(3));
					ordine.setIVA(res.getInt(4));
					ordine.setQuantita(res.getInt(5));
					ordine.setPrezzo(res.getDouble(6));
					ordine.setTitolo(res.getString(7));
					ordine.setAutore(res.getString(10));
					ordine.setCopertina(res.getString(11));

				System.out.println("DAO--> Titolo: "+ordine.Titolo);
					elenco.add(ordine);
			}; System.out.println("DAO--> Torniamo l'array");
			return elenco;
			
		}catch(SQLException e){
			e.printStackTrace();
			return null;
			}
	}
	 
	public void newdt (String isbn,String tipo, int codice, int iva, int qnt,double prz) {
		java.sql.Connection conn;
		try {
			conn = DriverManagerConnectionPool.getConnection();
			System.out.println("DAO--> Prendiamo la tabella Ordini");
			String sql="INSERT INTO DettagliOrdine (ISBN,Tipo, CodiceOrdine, IVA, Quantita, Prezzo)VALUES  "
					+ "(?, ?, ?, ?, ?, ?) ";
			
			PreparedStatement stm=conn.prepareStatement(sql);
			stm.setString(1, isbn);
			stm.setString(2, tipo);
			stm.setInt(3,codice);
			stm.setInt(4, iva);
			stm.setInt(5, qnt);
			stm.setDouble(6, prz);
			System.out.println("ABBIAMO OTTENUTO I PARAMETRI DEI DETTAGLI, INSERIMENTO NEL DB");
			stm.execute();
			conn.commit();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
