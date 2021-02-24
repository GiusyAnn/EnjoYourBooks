package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import model.DriverManagerConnectionPool;
import model.fatturaBean;
import model.orderBean;

public class orderDao {
	public orderDao() {
	}
	
	public ArrayList<orderBean> getorder(){
		try {
			java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
			System.out.println("DAO--> Prendiamo la tabella Ordini");
			String sql="SELECT *  " + 
					"FROM Ordine Order by DataO DESC ";
			
			PreparedStatement stm=conn.prepareStatement(sql);
			
			ResultSet res = stm.executeQuery();
			ArrayList<orderBean> elenco = new ArrayList<orderBean>();
			while (res.next())
			{
					orderBean ordine = new orderBean();								
					
					ordine.setCodiceOrdine(res.getInt(1));
					ordine.setPrezzoTotale(res.getDouble(2));					
					ordine.setDataO(res.getDate(3));
					ordine.setUsername(res.getString(4));				
					
					elenco.add(ordine);
			}; System.out.println("DAO--> Torniamo l'array");
			return elenco;
			
		}catch(SQLException e){
			e.printStackTrace();
			return null;
			}
	}
	
	public ArrayList<orderBean> getuserorder(String username){
		try {
			java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
			System.out.println("DAO--> Prendiamo la tabella Ordini");
			String sql="SELECT *  " + 
					"FROM Ordine  "
					+ "WHERE Username = ? Order by DataO DESC";
			
			PreparedStatement stm=conn.prepareStatement(sql);
			stm.setString(1,username);
			
			ResultSet res = stm.executeQuery();
			ArrayList<orderBean> elenco = new ArrayList<orderBean>();
			while (res.next())
			{
					orderBean ordine = new orderBean();								
					
					ordine.setCodiceOrdine(res.getInt(1));
					ordine.setPrezzoTotale(res.getDouble(2));				
					ordine.setDataO(res.getDate(3));
					ordine.setUsername(res.getString(4));				
					
					elenco.add(ordine);
			}; System.out.println("DAO--> Torniamo l'array");
			return elenco;
			
		}catch(SQLException e){
			e.printStackTrace();
			return null;
			}
	}
	
	public orderBean getBean (int codice) {
		try {
			java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
			System.out.println("DAO--> eseguiamo la Query con il parametro :"+codice);
			String sql="SELECT *  " + 
					"FROM Ordine  "+
					"WHERE CodiceOrdine = ? Order by DataO DESC ";
			
			PreparedStatement stm=conn.prepareStatement(sql);
			stm.setInt(1,codice);
			ResultSet res = stm.executeQuery();
			conn.commit();
			if(res.next()) {
			System.out.println("DAO--> Query eseguita, torniamo nella servlet"+res.getString(1));
			
					orderBean book = new orderBean();								
					book.setCodiceOrdine(res.getInt(1));
					book.setPrezzoTotale(res.getDouble(2));
					book.setDataO(res.getDate(3));
					book.setUsername(res.getString(4));				
			
			return book;}else System.out.println("non eseguita"); return null;
			
		}catch(SQLException e){
			e.printStackTrace();
			return null;
			}
	}
	
	
	
	public ArrayList<orderBean> getdataorder (String da, String al){
		try {
			java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
			System.out.println("DAO--> Prendiamo la tabella Ordini");
			String sql="SELECT *  " + 
					"FROM Ordine  "
					+"WHERE DataO BETWEEN ? AND ? Order by DataO DESC";
			
			PreparedStatement stm=conn.prepareStatement(sql);
			stm.setString(1,da);
			stm.setString(2,al);
			ResultSet res = stm.executeQuery();
			ArrayList<orderBean> elenco = new ArrayList<orderBean>();
			while (res.next())
			{
					orderBean ordine = new orderBean();								
					
					ordine.setCodiceOrdine(res.getInt(1));
					ordine.setPrezzoTotale(res.getDouble(2));					
					ordine.setDataO(res.getDate(3));
					ordine.setUsername(res.getString(4));				
					
					elenco.add(ordine);
			}; System.out.println("DAO--> Torniamo l'array");
			return elenco;
			
		}catch(SQLException e){
			e.printStackTrace();
			return null;
			}
	}
	
		public boolean newOrdine (double tot,  Date dtoggi, String name) {
			
			try {
				
				System.out.println("DAO--> Inseriamo la tabella Ordini "+tot+" "+dtoggi+" "+name);
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				String sql = "INSERT INTO Ordine ( PrezzoTotale, DataO,Username) VALUES "
						+ "(?, ?, ?)";
			
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setDouble(1,tot);
				stm.setDate(2, dtoggi);
				stm.setString(3, name);
				stm.execute();
				conn.commit();
				
				sql = "Select * " + 
						"From Ordine " + 
						"Where (DataO=?) AND (Username=?)";
				stm=conn.prepareStatement(sql);
				stm.setDate(1, dtoggi);
				stm.setString(2, name);
				ResultSet res = stm.executeQuery();
				if(res.next()) {
					
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			 return false;
			
			
		}
		
		public int getcodice (Date dtoggi, String name, Double prezzo) {
			int codice= 0;
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				String sql = "Select CodiceOrdine " + 
						"From Ordine " + 
						"Where (DataO=?) AND (Username=?) AND (PrezzoTotale = ? )";
				PreparedStatement stm=conn.prepareStatement(sql);
				stm=conn.prepareStatement(sql);
				stm.setDate(1, dtoggi);
				stm.setString(2, name);
				stm.setDouble(3, prezzo);
				ResultSet res = stm.executeQuery();
				if(res.next()) {
					codice=res.getInt(1);
					return codice;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			 return codice;
		}
		public Date getdata(int codice ) {
				try {
					java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
					
					Date data = null;
					String sql= "SELECT  DataO  "
							+ "FROM Ordine "
							+ "WHERE CodiceOrdine = ? ";
					PreparedStatement stm=conn.prepareStatement(sql);
					stm=conn.prepareStatement(sql);
					  stm.setInt(1, codice);
					  ResultSet res = stm.executeQuery();
					  if(res.next()) {
						  data = res.getDate(1);
					  } return data;
				} catch (SQLException e) {
					e.printStackTrace();
				}
				return null; 
		}
		
		public double getTot (int codice ) {
			
			double totale = 0;
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				Date data = null;
				String sql= "SELECT PrezzoTotale  "
						+ "FROM Ordine "
						+ "WHERE CodiceOrdine = ? ";
				PreparedStatement stm=conn.prepareStatement(sql);
				stm=conn.prepareStatement(sql);
				 stm.setInt(1, codice);
				  ResultSet res = stm.executeQuery();
				  if(res.next()) 
					  totale=res.getDouble(1);
					  
				  } catch (SQLException e) {
						e.printStackTrace();
					}
					return totale;
				  
		}
		public ArrayList<fatturaBean> newfattura (int codice, double tot, Date data){
			ArrayList<fatturaBean> lista = new ArrayList<fatturaBean>();
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				String sql="SELECT * "
						+ "FROM  DettagliOrdine "						
						+ "WHERE CodiceOrdine = ? ";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				  stm.setInt(1, codice);
				 ResultSet res = stm.executeQuery();
				  
			while(res.next()) {
				fatturaBean fatt = new fatturaBean();				
				fatt.setDataorder(data);
				fatt.setIsbn(res.getString(1));
				fatt.setIva(res.getInt(4));
				fatt.setQuantita(res.getInt(5));
				fatt.setNumordine(codice);
				fatt.setTotale(tot);
				fatt.setPrezzo(res.getDouble(6));
				String sql2="SELECT Titolo "
						+ "FROM Libri "
						+ "WHERE ISBN = ? ";
				PreparedStatement stm2=conn.prepareStatement(sql2);
				  		stm2.setString(1, fatt.getIsbn());
				  		ResultSet res2 = stm2.executeQuery();
				if(res2.next())fatt.setTitolo(res2.getString(1));
				lista.add(fatt);
			}
				return lista;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return null;
		}

}
