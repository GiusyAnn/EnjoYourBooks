package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.orderDao;
import model.dettagliBean;
import model.fatturaBean;
import model.orderBean;

/**
 * Servlet implementation class fatturaServlet
 */
@WebServlet("/fatturaServlet")
public class fatturaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public fatturaServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String cd = request.getParameter("ordine");
		int codice = Integer.parseInt(cd);System.out.println("Codice Ordine "+codice);
		
		ArrayList<fatturaBean> fatt = new ArrayList<fatturaBean>();
		orderDao dao = new orderDao();
		double tot = dao.getTot(codice); System.out.println("TOTALE "+tot);
		Date data= dao.getdata(codice); System.out.println("DATA "+data);
		fatt = dao.newfattura(codice, tot, (java.sql.Date) data);
		
		request.setAttribute("fattura", fatt);
		RequestDispatcher dispatcher =getServletContext().getRequestDispatcher("/JSP/FatturaJSP.jsp");
		dispatcher.forward(request,response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
