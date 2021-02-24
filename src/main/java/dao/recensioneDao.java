package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.DriverManagerConnectionPool;
import model.recensioneBean;

public class recensioneDao {
	
	public recensioneDao() {
		
	}
	
	public void nuovarecensione(String user, String isbn, int voto, String comm) {
		recensioneBean nuova = new recensioneBean();
		try {
			java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
			
			String sql="INSERT INTO Recensione (Username, ISBN, Voto, Commento) VALUES "
					+ "(? , ? , ? , ? ) ";
			PreparedStatement stm=conn.prepareStatement(sql);
			stm.setString(1,user);
			stm.setString(2, isbn);
			stm.setInt(3,voto);
			stm.setString(4, comm);
			stm.execute();
			conn.commit();
		}catch(SQLException e){
			e.printStackTrace();
			}
	}
	
	public ArrayList<recensioneBean> getrec( String isbn ) {
		ArrayList<recensioneBean> elenco = new ArrayList<recensioneBean>();
		try {
			java.sql.Connection conn = DriverManagerConnectionPool.getConnection();
			
			String sql="SELECT * "
					+ "FROM recensione "
					+ "WHERE ISBN = ?";
			PreparedStatement stm=conn.prepareStatement(sql);
			stm.setString(1,isbn);
			ResultSet res = stm.executeQuery();
			while(res.next()) {
				recensioneBean nuova = new recensioneBean();
				nuova.setUsername(res.getString(1));
				nuova.setISBN(res.getString(2));
				nuova.setVoto(res.getInt(3));
				nuova.setCommento(res.getString(4));
				String sq="SELECT ImgProfilo "
						+ "FROM Utente "
						+ "WHERE Username = ? ";
				PreparedStatement st=conn.prepareStatement(sq);
				st.setString(1,nuova.getUsername());
				ResultSet re = st.executeQuery();
				if(re.next()) nuova.setFoto(re.getString(1));
				
				elenco.add(nuova);
			}
			return elenco;
			
		}catch(SQLException e){
			e.printStackTrace();
			}
		return elenco;
	}
}
