package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.bookDao;
import dao.orderDao;
import model.bookBean;
import model.orderBean;

/**
 * Servlet implementation class getOrderServlet
 */
@WebServlet("/getOrderServlet")
public class getOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		
		orderDao book = new orderDao();
		
		String cod = request.getParameter("codice");
		int ord = Integer.parseInt(cod);

		/*Devo prendere l'isbn del libro quando l'utente schiaccia sul pulsante che si riferisce al libro*/
		orderBean ordine = book.getBean(ord);
		
		request.setAttribute("ordine", ordine);
		RequestDispatcher dispatcher = request.getRequestDispatcher("JSP/ModBookJSP.jsp");
		dispatcher.forward(request,response);}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
