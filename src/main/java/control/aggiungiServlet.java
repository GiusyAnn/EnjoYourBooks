package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.bookDao;
import model.bookBean;
import model.cartBean;

/**
 * Servlet implementation class aggiungiServlet
 */
@WebServlet("/aggiungiServlet")
public class aggiungiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public aggiungiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		ArrayList<bookBean> carrello = (ArrayList<bookBean>) session.getAttribute("carrello");
		
		if(carrello==null) {carrello = new ArrayList<bookBean>();}
		
		response.setContentType("text/html");
		String ISBN = request.getParameter("ISBN");
		String qt = request.getParameter("quantita");
		
		for(bookBean l : carrello) {
			if(l.getISBN().equalsIgnoreCase(ISBN)) {
				int qnt;
				if(qt==null) {  qnt = 1;}else {
				 qnt = Integer.parseInt(qt);}
				l.setQuantita(l.getQuantita()+qnt);
				bookDao daob = new bookDao();
				double prz = daob.getpz(l.getISBN());
				l.setPrezzo(prz*l.getQuantita());
				l.setTipo("Cartaceo");
				session.setAttribute("carrello", carrello);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/CarrelloJSP.jsp");
				dispatcher.forward(request,response);
			}
		}
		
		bookDao dao = new bookDao();
		bookBean libro = new bookBean();
		libro = dao.getBookBean(ISBN);
		if(qt!=null) { 
			int quantita = Integer.parseInt(qt); 
			libro.setQuantita(quantita);
			libro.setPrezzo(libro.getPrezzo()*libro.getQuantita());
			libro.setTipo("Cartaceo");
			}else {
				libro.setQuantita(1);
				libro.setTipo("Digitale");
			}
		
		carrello.add(libro);
		
		session.setAttribute("carrello", carrello);
		session.setMaxInactiveInterval(24*60);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/CarrelloJSP.jsp");
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
