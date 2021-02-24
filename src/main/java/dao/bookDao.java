package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.*;

public class bookDao {

		public bookDao() {
		}
		
		public ArrayList<bookBean> getAllLibri () {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="SELECT *  " + 
						"FROM Libri  Order by Titolo ASC";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				
				ResultSet res = stm.executeQuery();
				ArrayList<bookBean> libri = new ArrayList<bookBean>();
				while (res.next())
				{
						bookBean book = new bookBean();								
						book.setISBN(res.getString(2));
						book.setTitolo(res.getString(1));
						book.setGenere(res.getString(3));
						book.setAutore(res.getString(4));
						book.setCopertina(res.getString(5));
						book.setTrama(res.getString(6));
						book.setCasaEditrice(res.getString(7));
						book.setPrezzo(res.getDouble(8));
						book.setTipo(res.getString(9));
						book.setQuantita(res.getInt(10));
						book.setUsername(res.getString(11));
						book.setApprovazione(res.getBoolean(12));
						
						libri.add(book);
				};
				return libri;
				
			}catch(SQLException e){
				e.printStackTrace();
				return null;
				}
		}
		
		public ArrayList<bookBean> getGenLibri (String genere) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="SELECT *  " + 
						"FROM Libri "+
						"WHERE Genere = ? Order by Titolo ASC";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1,genere);
				
				ResultSet res = stm.executeQuery();
				conn.commit();
				
				ArrayList<bookBean> libri = new ArrayList<bookBean>();
				while (res.next())
				{
						bookBean book = new bookBean();								
						book.setISBN(res.getString(2));
						book.setTitolo(res.getString(1));
						book.setGenere(res.getString(3));
						book.setAutore(res.getString(4));
						book.setCopertina(res.getString(5));
						book.setTrama(res.getString(6));
						book.setCasaEditrice(res.getString(7));
						book.setPrezzo(res.getDouble(8));
						book.setTipo(res.getString(9));
						book.setQuantita(res.getInt(10));
						book.setUsername(res.getString(11));
						book.setApprovazione(res.getBoolean(12));
						
						libri.add(book);
				};
				return libri;
				
			}catch(SQLException e){
				e.printStackTrace();
				return null;
				}
		}
		
		/**
		 * 
		 * @param ISBN
		 * @return book
		 */
		public bookBean getBookBean (String ISBN) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				System.out.println("DAO--> eseguiamo la Query con il parametro :"+ISBN);
				String sql="SELECT *  " + 
						"FROM Libri  "+
						"WHERE ISBN = ? ";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1,ISBN);
				ResultSet res = stm.executeQuery();
				conn.commit();
				if(res.next()) {
				System.out.println("DAO--> Query eseguita, torniamo nella servlet"+res.getString(1));
				
						bookBean book = new bookBean();								
						book.setISBN(res.getString(2));
						book.setTitolo(res.getString(1));
						book.setGenere(res.getString(3));
						book.setAutore(res.getString(4));
						book.setCopertina(res.getString(5));
						book.setTrama(res.getString(6));
						book.setCasaEditrice(res.getString(7));
						book.setPrezzo(res.getDouble(8));
						book.setTipo(res.getString(9));
						book.setQuantita(res.getInt(10));
						book.setUsername(res.getString(11));
						book.setApprovazione(res.getBoolean(12));
						
						
				
				return book;}else System.out.println("non eseguita"); return null;
				
			}catch(SQLException e){
				e.printStackTrace();
				return null;
				}
		}
		
		
		//Libri da approvare
		public ArrayList<bookBean> getnewLibri () {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="SELECT * " + 
						"FROM Libri " + 
						"WHERE Approvazione = 0 Order by Titolo ASC";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				
				ResultSet res = stm.executeQuery();
				conn.commit();
				
				ArrayList<bookBean> libri = new ArrayList<bookBean>();
				while (res.next())
				{
						bookBean book = new bookBean();								
						book.setISBN(res.getString(2));
						book.setTitolo(res.getString(1));
						book.setGenere(res.getString(3));
						book.setAutore(res.getString(4));
						book.setCopertina(res.getString(5));
						book.setTrama(res.getString(6));
						book.setCasaEditrice(res.getString(7));
						book.setPrezzo(res.getDouble(8));
						book.setTipo(res.getString(9));
						book.setQuantita(res.getInt(10));
						book.setUsername(res.getString(11));
						book.setApprovazione(res.getBoolean(12));
						
						libri.add(book);
				};
				return libri;
				
			}catch(SQLException e){
				e.printStackTrace();
				return null;
				}
		}
		
		
		//pubblicazione Libri
		public boolean pubblication (String titolo,String isbn, String autore, String genere, String copertina, String trama, String casae, double prezzo, String tipo, int quantita, String username, boolean approvazione ){
			try {
						
						java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
					
						
						String sql="SELECT ISBN "
								+ "FROM Libri "
								+ "WHERE ISBN = ?";
						
						PreparedStatement stm=conn.prepareStatement(sql);
						
						stm.setString(1,isbn);
						
					
						ResultSet res = stm.executeQuery();
						
						
						//Se esiste l'utente 
						if(res.next()) {
								return false;	
						}			
						else {	System.out.println("DAO--> QUERY");	
							sql="INSERT INTO Libri ( Titolo,ISBN, Genere, Autore,Copertina, Trama, CasaEditrice, Prezzo, Tipo, Quantita, Username,Approvazione) VALUES " + 
									" (?,?,?,?,?,?,?,?,?,?,?,?)";
							
							stm = conn.prepareStatement(sql);
							stm.setString(1,titolo); 
							stm.setString(2,isbn);
							stm.setString(3,genere);
							stm.setString(4,autore);
							stm.setString(5, copertina);
							stm.setString(6,trama);
							stm.setDouble(8,prezzo);
							stm.setString(9, tipo);
							stm.setString(7, casae);
							stm.setInt(10,quantita);
							stm.setString(11, username);
							stm.setBoolean(12, approvazione);
							
											
							stm.execute();
							conn.commit();
							System.out.println("Query Eseguita");
							return true;
						}
							
					} catch(SQLException e){
						e.printStackTrace();
						return false;
						}
			}
		
		public boolean delBookBean (String ISBN) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				System.out.println("DAO--> eseguiamo la Query con il parametro :"+ISBN);
				String sql="DELETE " + 
						"FROM Libri " + 
						"WHERE ISBN = ? ";
				

				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1,ISBN);
				stm.execute();
				conn.commit();
				System.out.println("DAO--> Query Eseguita, eseguiamo il controllo");
				sql="SELECT * " + 
					"FROM Libri " + 
					"WHERE ISBN = ? ";
				stm=conn.prepareStatement(sql);
				stm.setString(1,ISBN);
				ResultSet res = stm.executeQuery();
				if(res.next()) { return false;
				}else { return true;}
				
			}catch(SQLException e){
				e.printStackTrace();
				return false;
				}
		}
		
		public boolean appBookBean (String ISBN) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				System.out.println("DAO--> eseguiamo la Query con il parametro :"+ISBN);
				String sql="UPDATE Libri " + 
						"SET Approvazione = 1 " + 
						"WHERE ISBN = ? ";
				

				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1,ISBN);
				stm.execute();
				conn.commit();
				System.out.println("DAO--> Query Eseguita, eseguiamo il controllo");
				sql="SELECT Approvazione " + 
					"FROM Libri " + 
					"WHERE ISBN = ? ";
				stm=conn.prepareStatement(sql);
				stm.setString(1,ISBN);
				ResultSet res = stm.executeQuery();
				boolean app;
				if(res.next()) { if (app=res.getBoolean(1)) return true;
				}else { return true;}
				
			}catch(SQLException e){
				e.printStackTrace();
				return false;
				}
			return false;
		}

		public void modbook (String titolo, String isbn,String autore,String genere, String copertina ,String trama, String casae, double prezzo, int quantita, String tipo){
			try {
						
						java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
					
						
						String sql="UPDATE Libri "
								+ "SET Titolo = ? , Genere = ?, Autore = ? ,Copertina = ?, Trama = ?, CasaEditrice = ? , Prezzo = ?, Tipo = ?, Quantita = ? "
								+ "WHERE ISBN = ? ";
							
						PreparedStatement stm=conn.prepareStatement(sql);
							stm.setString(1,titolo);
							stm.setString(2,genere);
							stm.setString(3,autore); 
							stm.setString(4, copertina); 
							stm.setString(5,trama);
							stm.setDouble(7,prezzo); 
							stm.setString(8, tipo); 
							stm.setString(6, casae); 
							stm.setInt(9,quantita); 
							stm.setString(10,isbn); 
										
							stm.execute();
							conn.commit();
							System.out.println("Query Eseguita");
							
					} catch(SQLException e){
						e.printStackTrace();
						
						}
			}
		
		public ArrayList<bookBean> cercaLibri (String cerca) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="SELECT *  " + 
						"FROM Libri  Order by Titolo ASC";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				
				ResultSet res = stm.executeQuery();
				ArrayList<bookBean> libri = new ArrayList<bookBean>();
				while (res.next())
				{
						bookBean book = new bookBean();								
						book.setISBN(res.getString(2));
						book.setTitolo(res.getString(1));
						book.setGenere(res.getString(3));
						book.setAutore(res.getString(4));
						book.setCopertina(res.getString(5));
						book.setTrama(res.getString(6));
						book.setCasaEditrice(res.getString(7));
						book.setPrezzo(res.getDouble(8));
						book.setTipo(res.getString(9));
						book.setQuantita(res.getInt(10));
						book.setUsername(res.getString(11));
						book.setApprovazione(res.getBoolean(12));
						
						libri.add(book);
				}
				ArrayList<bookBean> trovati = new ArrayList<bookBean>();
				String[] crc = cerca.split(" ");
				
				System.out.println("La Stringa inserita � diventata : ");
				for(String q : crc) {System.out.println(q);}
				
				boolean trv = false;
				System.out.println("DAO--> Abbiamo ottenuto l'array di libri, adesso eseguiamo il confronto con la stringa");
				for( bookBean l:libri) {
					 String [] tit = l.getTitolo().split(" ");
					 String [] aut = l.getAutore().split(" ");
					 
					 trv= confronto(crc,tit);
					
					if(!trv) {
					trv=confronto(crc, aut);}
				
					if(trv) {trovati.add(l);}
					}
				return trovati;
				
			}catch(SQLException e){
				e.printStackTrace();
				return null;
				}
		}

		public boolean confronto (String[] crc, String[] con) {
			boolean trv = false;
			for(String s:crc) {
				for(String j:con) {
					if(s.equalsIgnoreCase(j)) {
						 trv= true;
						return trv;
				} 
			}
		} if(!trv) return false;
		return trv;
		}
		
		public ArrayList<bookBean> getPrefLibri (String utente) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="SELECT *  " + 
						"From Preferiti " + 
						"INNER JOIN Libri ON  Preferiti.ISBN = Libri.ISBN  " + 
						"Where Preferiti.Username = ? Order by Titolo ASC";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1,utente);
				
				ResultSet res = stm.executeQuery();
				conn.commit();
				
				ArrayList<bookBean> libri = new ArrayList<bookBean>();
				while (res.next())
				{
						bookBean book = new bookBean();								
						book.setISBN(res.getString(4));
						book.setTitolo(res.getString(3));
						book.setGenere(res.getString(5));
						book.setAutore(res.getString(6));
						book.setCopertina(res.getString(7));
						book.setTrama(res.getString(8));
						book.setCasaEditrice(res.getString(9));
						book.setPrezzo(res.getDouble(10));
						book.setTipo(res.getString(11));
						book.setQuantita(res.getInt(12));
						book.setUsername(res.getString(13));
						book.setApprovazione(res.getBoolean(14));
						
						libri.add(book);
				};
				return libri;
				
			}catch(SQLException e){
				e.printStackTrace();
				return null;
				}
		}
		
		public int getqnt(String isbn) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				int qnt = 0;
				String sql="SELECT Quantita  " + 
						"From Libri  " + 
						"Where ISBN = ? ";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1,isbn);
				
				ResultSet res = stm.executeQuery();
				conn.commit();
				if (res.next()) qnt = res.getInt(1);
				return qnt;
			}catch(SQLException e){
				e.printStackTrace();
				return (Integer) null;
				}
		}
		
		public void setqnt(String isbn, int restanti) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				int qnt = 0;
				String sql="UPDATE Libri " + 
						"SET  Quantita = ? " + 
						"WHERE ISBN = ? ";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(2,isbn);
				stm.setInt(1,restanti);
				
			 stm.execute();
				conn.commit();
				
			}catch(SQLException e){
				e.printStackTrace();
				}
		}
		
		public double getpz(String isbn) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				double qnt = 0;
				String sql="SELECT Prezzo  " + 
						"From Libri  " + 
						"Where ISBN = ? ";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1,isbn);
				
				ResultSet res = stm.executeQuery();
				conn.commit();
				if (res.next()) qnt = res.getInt(1);
				return qnt;
			}catch(SQLException e){
				e.printStackTrace();
				return (Double) null;
				}
		}
		
		public void remove(String isbn, String user){
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="DELETE "
						+ "FROM Preferiti "
						+ "WHERE (Username = ? ) AND (ISBN = ?) ";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1, user);
				stm.setString(2,isbn);
				
				stm.execute();
				conn.commit();
			}catch(SQLException e){
				e.printStackTrace();
				}
		}
		
		public void add(String isbn, String user){
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="INSERT INTO Preferiti (Username,ISBN) VALUES"
						+ "(?, ?)";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1, user);
				stm.setString(2,isbn);
				
				stm.execute();
				conn.commit();
			}catch(SQLException e){
				e.printStackTrace();
				}
		}
		
		public ArrayList<bookBean> getUserLibri (String username) {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="SELECT * " + 
						"FROM Libri " + 
						"WHERE (Approvazione = 1) AND (Username = ?) Order by Titolo ASC";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				stm.setString(1, username);
				ResultSet res = stm.executeQuery();
				conn.commit();
				
				ArrayList<bookBean> libri = new ArrayList<bookBean>();
				while (res.next())
				{
						bookBean book = new bookBean();								
						book.setISBN(res.getString(2));
						book.setTitolo(res.getString(1));
						book.setGenere(res.getString(3));
						book.setAutore(res.getString(4));
						book.setCopertina(res.getString(5));
						book.setTrama(res.getString(6));
						book.setCasaEditrice(res.getString(7));
						book.setPrezzo(res.getDouble(8));
						book.setTipo(res.getString(9));
						book.setQuantita(res.getInt(10));
						book.setUsername(res.getString(11));
						book.setApprovazione(res.getBoolean(12));
						
						libri.add(book);
				};
				return libri;
				
			}catch(SQLException e){
				e.printStackTrace();
				return null;
				}
		}
		
		public ArrayList<String> getTop() {
			try {
				java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
				
				String sql="SELECT ISBN, COUNT(ISBN) " + 
						"FROM Recensione " + 
						"WHERE Voto = 5 " + 
						"group by ISBN Order by COUNT(ISBN) DESC";
				
				PreparedStatement stm=conn.prepareStatement(sql);
				
				ResultSet res = stm.executeQuery();
				ArrayList<String> libri = new ArrayList<String>();
				while (res.next())
				{
					libri.add(res.getString(1));					
				};
				return libri;
				
			}catch(SQLException e){
				e.printStackTrace();
				return null;
				}
		}
}
