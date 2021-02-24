package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.bookDao;

/**
 * Servlet implementation class ModBookServlet
 */
@WebServlet("/ModBookServlet")
public class ModBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String titolo = request.getParameter("Titolo");
		String isbn = request.getParameter("ISBN");
		String autore= request.getParameter("Autore");
		String copertina = request.getParameter("copertina");
		String genere = request.getParameter("genere");
		String casae = request.getParameter("casae");
		String pz = request.getParameter("prezzo");
		double prezzo = Double.parseDouble(pz);
		String qt = request.getParameter("quantita");
		int quantita = Integer.parseInt(qt);
		String tipo = request.getParameter("tipo");
		String trama = request.getParameter("Trama");
		
		System.out.println("SERVLET--> Abbiamo preso i parametri ");
		
		bookDao inse = new bookDao();
		inse.modbook(titolo, isbn, autore, genere, copertina, trama, casae, prezzo, quantita, tipo);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/UserJSP.jsp");
		dispatcher.forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
