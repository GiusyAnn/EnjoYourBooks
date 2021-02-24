package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.dettagliDao;
import dao.orderDao;
import model.dettagliBean;
import model.orderBean;

/**
 * Servlet implementation class dettagliServlet
 */
@WebServlet("/dettagliServlet")
public class dettagliServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dettagliServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		
		String codice = request.getParameter("ordine");
		System.out.println("il numero dell'ordine è : "+codice);
		int cd = Integer.parseInt(codice);
		
		dettagliDao ordine = new dettagliDao();
		ArrayList<dettagliBean> elenco = new ArrayList<dettagliBean>();
		elenco = ordine.getdettagli(cd);
		
		request.setAttribute("elenco", elenco);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/DettagliJSP.jsp");
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
