package control;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.bookDao;
import model.userBean;

/**
 * Servlet implementation class pubblicaNewServlet
 */
@WebServlet("/pubblicaNewServlet")
public class pubblicaNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public pubblicaNewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		
		String titolo = request.getParameter("Titolo");
		String autore = request.getParameter("Autore");
		String genere= request.getParameter("genere");
		String trama = request.getParameter("Trama");
		String copertina = request.getParameter("copertina");
		String isbn = request.getParameter("isbn");
		String casae = request.getParameter("casae");
		String prezzo= request.getParameter("prezzo");
		double pz = Double.parseDouble(prezzo);
		String tipo= request.getParameter("tipo");
		String quantita = request.getParameter("quantita");
		int qt = Integer.parseInt(quantita);
		String username = null;		
		boolean approvazione = true;
		
		bookDao manager = new bookDao();
		boolean pub = manager.pubblication( titolo, isbn, autore, genere, copertina, trama, casae, pz, tipo, qt, username, approvazione);
		
		if (pub ==true) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/errorPage/PubblicationSJSP.jsp");
			dispatcher.forward(request,response);
		}
		else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/errorPage/PubblicationEJSP.jsp.html");
			dispatcher.forward(request,response);
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
