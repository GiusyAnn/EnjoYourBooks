package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.*;

public class userDao {
	
		//Costruttore
	public userDao() {
		
	}
	
	//Metodo Registrazione 
	public boolean registration (String username, String nome, String cognome, String password,String profilo,String email,String via,String cap,String citta,String provincia){
		try {
					
					java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
					
					String sql="SELECT Username "
							+ "FROM Utente "
							+ "WHERE Username = ?";
					
					PreparedStatement stm=conn.prepareStatement(sql);
					
					stm.setString(1,username);
					
				
					ResultSet res = stm.executeQuery();
					
					
					//Se esiste l'utente 
					if(res.next()) {
							
							return false;	
					}			
					else {	
					
						sql="INSERT INTO Utente (Username, Nome, Cognome, PasswordUtente, ImgProfilo, E_mail, Via, CAP, Citta, Provincia ) " + 
								"VALUES (?,?,?,?,?,?,?,?,?,?)";
						
						stm = conn.prepareStatement(sql);
						stm.setString(1,username);
						stm.setString(2,nome);
						stm.setString(3,cognome);
						stm.setString(4,password);
						stm.setString(5,profilo);
						stm.setString(6,email);
						stm.setString(7,via);
						stm.setString(8,cap);
						stm.setString(9, citta);
						stm.setString(10, provincia);
										
						stm.execute();
						conn.commit();
						System.out.println("DAO--> inserimento completato");
						return true;
					}
						
				} catch(SQLException e){
					e.printStackTrace();
					return false;
					}
		}

	public boolean controllo(String username) {
		try {
		java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
	
		
		String sql="SELECT Username "
				+ "FROM Utente "
				+ "WHERE Username = ?";
		
		PreparedStatement stm=conn.prepareStatement(sql);
		
		stm.setString(1,username);
		
	
		ResultSet res = stm.executeQuery();
		
		
		//Se esiste l'utente 
		if(res.next()) {
				
				return false;	
		}else {return true;	} 
	}catch(SQLException e){
			e.printStackTrace();
			return false;
			}		
	}
	
		//Metodo Accesso 
	public userBean login (String username, String password) {
		try {
			
			java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
		
			String sql="SELECT *  " + 
					"FROM Utente  " + 
					"WHERE Username = ? AND PasswordUtente = ? ";
			
			PreparedStatement stm=conn.prepareStatement(sql);
			
			stm.setString(1,username);
			stm.setString(2,password);
		
			ResultSet res = stm.executeQuery();	
			
			
			userBean user = new userBean();
			
			//Se esiste l'utente 
			if(res.next()) {
				
				user.setuser(res.getString(1));
				user.setpass(res.getString(4));
				user.setnome(res.getString(2));
				user.setcognome(res.getString(3));				
				user.setProfilo(res.getString(5));
				user.setEmail(res.getString(6));
				user.setVia(res.getString(7));
				user.setCap(res.getString(8));
				user.setCitta(res.getString(9));
				user.setProvincia(res.getString(10));
				user.setrole("Utente");
				System.out.println("DAO--> il ruolo è "+user.getrole());
				return user;
			}
			
			else {
				sql="SELECT *  " + 
					"FROM Amministratore  " + 
					"WHERE Username = ? AND PasswordAd = ? ";
				
				stm=conn.prepareStatement(sql);
				
				stm.setString(1,username);
				stm.setString(2,password);
			
				res = stm.executeQuery();	
				if(res.next()) {
					
					user.setuser(res.getString(1));
					user.setpass(res.getString(2));
					user.setnome(res.getString(3));
					user.setcognome(res.getString(4));
					user.setProfilo(res.getString(5));
					user.setrole("Amministratore");
					
					return user;
				}
				else
					return null;
			}
						
			
		} catch(SQLException e){
			e.printStackTrace();
			
		}

		return null;
	}
	public void modifica(String username, String nome, String cognome,String password, String profilo, String email, String via, String cap, String citta, String provincia) throws SQLException {
		java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
		System.out.println("DAO--> Eseguiamo la funzione ");
		String sql="UPDATE Utente " + 
				"SET  Nome = ?, Cognome = ?, PasswordUtente = ?, E_mail = ?, Via = ?, CAP = ?, Citta = ?, Provincia = ? " + 
				"WHERE username= ?";
		
		PreparedStatement stm=conn.prepareStatement(sql);
		stm = conn.prepareStatement(sql);
		
		stm.setString(1,nome);
		stm.setString(2,cognome);
		stm.setString(3,password);
		stm.setString(4,email);
		stm.setString(5,via);
		stm.setString(6,cap);
		stm.setString(7, citta);
		stm.setString(8, provincia);
		stm.setString(9, username);
						
		stm.execute();
		conn.commit();
	}

	
	public void modimg( String username,String profilo ) throws SQLException {
		java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
		System.out.println("DAO--> Eseguiamo la funzione "+username);
		String sql="UPDATE Utente " + 
				"SET  ImgProfilo = ?" + 
				"WHERE username= ?";
		
		PreparedStatement stm=conn.prepareStatement(sql);
		stm = conn.prepareStatement(sql);
		stm.setString(1,profilo);
		stm.setString(2,username);
						
		stm.execute();
		conn.commit();
	}
	
	public ArrayList<String> getutenti(){
		java.sql.Connection conn;
		try {
			conn = DriverManagerConnectionPool.getConnection();
		
		
		String sql="SELECT Username  " + 
				"FROM Utente  ";
		
		PreparedStatement stm=conn.prepareStatement(sql);
		
		ResultSet res = stm.executeQuery();	
		
		ArrayList<String > nomi = new ArrayList<String>();
		//Se esiste l'utente 
		while (res.next()) {
			nomi.add(res.getString(1));
			
		}return nomi;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); return null;
		}}
}
