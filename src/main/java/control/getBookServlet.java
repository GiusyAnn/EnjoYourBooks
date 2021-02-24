package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.bookDao;
import model.bookBean;

/**
 * Servlet implementation class getBookServlet
 */
@WebServlet("/getBookServlet")
public class getBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		bookDao book = new bookDao();
		
		String ISBN = request.getParameter("ISBN");

		/*Devo prendere l'isbn del libro quando l'utente schiaccia sul pulsante che si riferisce al libro*/
		bookBean libro = book.getBookBean(ISBN);
	
		request.setAttribute("libro", libro);
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
