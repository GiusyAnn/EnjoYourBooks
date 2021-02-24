package control;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.bookDao;
import dao.dettagliDao;
import dao.orderDao;
import model.bookBean;
import model.userBean;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings({ "deprecation", "unchecked" })
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("SERVLET--> Eseguiamo il CHECK OUT");
		
		
		bookDao bdao = new bookDao();
   		orderDao dao = new orderDao ();
   		dettagliDao dtdao = new dettagliDao();
   		
		HttpSession session = request.getSession();
		userBean user = (userBean) session.getAttribute("user");
		String name = user.getuser();
		ArrayList<bookBean> art = (ArrayList<bookBean>) session.getAttribute("carrello");
		
		double tot=0; int c=0;
		for(bookBean l:art) {
			tot=tot+l.getPrezzo();
			if(l.getTipo().equalsIgnoreCase("Cartaceo"))
					c++;
		}
		if (c>0) tot=tot+3;
		
		System.out.println("SERVLET--> Il Prezzo Totale, preso dalla JSP "+tot);
		
		GregorianCalendar gc = new GregorianCalendar();
   		int ggoggi= gc.get(Calendar.DAY_OF_MONTH);
   		int mmoggi= gc.get(Calendar.MONTH);
   		int aaoggi = gc.get(Calendar.YEAR)-1900;   		
   		@SuppressWarnings("unused")
		Date dtoggi= new Date(aaoggi,mmoggi,ggoggi);
   		System.out.println("SERVLET --> La data di Oggi è : "+dtoggi);
   		System.out.println("SERVLET --> Abbiamo preso i parametri da inserire in ordine "+name+" "+dtoggi+" "+tot);
   		System.out.println("SERVLET--> inseriamo i dettagli nell'ordine ");
   		
   		boolean into = dao.newOrdine( tot, dtoggi, name );
   		if(into) System.out.println("SERVLET--> Inserimento Ordine Nel DB AVVENUTO CON SUCCESSO");
   		int codice = dao.getcodice(dtoggi, name, tot);
   		System.out.println("SERVLET--> aggiungiamo i dettagli , avendo ottenuto il codice dell'ordine : "+codice);
   		
   		for (bookBean l:art) {
   			System.out.println("SERVLET--> Inseriamo un elemento nei dettagli ");
   			String isbn = l.getISBN();
   			int qnt = l.getQuantita();
   			double prz = l.getPrezzo();
   			int iva = 5;
   			dtdao.newdt(isbn,l.getTipo(), codice, iva, qnt, prz);
   			
   			System.out.println("SERVLET--> Se il libro è cartaceo, diminuiamo le copie");
   			if(l.getTipo().equalsIgnoreCase("Cartaceo")) {
   				int restanti = bdao.getqnt(isbn);
   				restanti = restanti - l.getQuantita();
   				bdao.setqnt(isbn, restanti);
   			}
   		}
   		
   		art.clear();
   		session.setAttribute("carrello", art);
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
