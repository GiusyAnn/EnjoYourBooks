package control;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.orderDao;
import model.orderBean;

/**
 * Servlet implementation class OrderDateServlet
 */
@WebServlet("/OrderDateServlet")
public class OrderDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderDateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		
		String da =  request.getParameter("da");
		String al =  request.getParameter("al");		
		
		
		orderDao ordine = new orderDao();
		ArrayList<orderBean> elenco = new ArrayList<orderBean>();
		elenco = ordine.getdataorder(da, al);
		request.setAttribute("elenco", elenco);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/OrdiniJSP.jsp");
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
