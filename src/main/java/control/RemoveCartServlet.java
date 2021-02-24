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

import model.bookBean;

/**
 * Servlet implementation class RemoveCartServlet
 */
@WebServlet("/RemoveCartServlet")
public class RemoveCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ArrayList<bookBean> carrello = (ArrayList<bookBean>) session.getAttribute("carrello");
		String ISBN = request.getParameter("ISBN");
		
		for(bookBean l : carrello) {
			if(l.getISBN().equalsIgnoreCase(ISBN)) {
				carrello.remove(l);
				session.setAttribute("carrello", carrello);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/CarrelloJSP.jsp");
				dispatcher.forward(request,response);
			}
		}
		session.setAttribute("carrello", carrello);
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
