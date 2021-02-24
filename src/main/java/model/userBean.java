package model;

public class userBean {

			//Costruttore
	public userBean() {
		
	}
	
	//Variabili d'istanza
	private String nome, cognome, username, password,role, profilo, email, via, cap, citta, provincia;
	
	public String getProfilo() {
		return profilo;
	}

	public void setProfilo(String profilo) {
		this.profilo = profilo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getCitta() {
		return citta;
	}

	public void setCitta(String citta) {
		this.citta = citta;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getnome() {
		return nome;
	}
	
	public String getcognome() {
		return cognome;
	}
	
	public String getuser() {
		return username;
	}
	
	public String getpass() {
		return password;
	}
	
	public String getrole() {
		return role;
	}
	
	public void setnome( String name) {
		this.nome=name;
	}
	
	public void setcognome (String con) {
		this.cognome=con;
	}
	
	public void setpass(String pass) {
		this.password=pass;
	}
	
	public void setuser(String user) {
		this.username=user;
	}
	public void setrole(String role) {
		this.role=role;
	}
	
}
