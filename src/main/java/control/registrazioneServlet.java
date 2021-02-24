package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.*;
import java.util.logging.*;


/**
 * Servlet implementation class Registrazione
 */
@WebServlet("/registrazioneServlet")
public class registrazioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Logger logger = Logger.getLogger("global");
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registrazioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		response.setContentType("text/html");
		String Error;	
		userDao manager = new userDao();
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		String nome= request.getParameter("Nome");
		String cognome = request.getParameter("Cognome");
		String email = request.getParameter("email");
		String via = request.getParameter("via");
		String cap = request.getParameter("cap");
		String citta = request.getParameter("citta");
		String provincia = request.getParameter("provincia");
		String profilo = request.getParameter("profilo");
	
		boolean reg = manager.registration(username, nome, cognome, password,profilo,email,via,cap,citta,provincia);
		
		if (reg==true) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/errorPage/RegistrationSuccesJSP.jsp");
			dispatcher.forward(request,response);
		}else {
		

		boolean ver = manager.controllo(username);
		if(!ver) {
			Error="Username non disponibile";
			request.setAttribute("error", Error);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/RegistrazioneInJSP.jsp");
			dispatcher.forward(request,response);}else {		
		if(password.length()<8) {
			Error="Password Non Valida";
			request.setAttribute("error", Error);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/RegistrazioneInJSP.jsp");
			dispatcher.forward(request,response);}else {
		
		if(username == null || password == null) {
			Error="Inserire Credenziali per accesso";
			request.setAttribute("error", Error);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/RegistrazioneInJSP.jsp");
			dispatcher.forward(request,response);		}}}		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
