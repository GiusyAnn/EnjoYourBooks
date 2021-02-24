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

@WebServlet("/bookServlet")
public class bookServlet extends HttpServlet {
	       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
	
		bookDao book = new bookDao();
		
		String ISBN = request.getParameter("ISBN");
		/*Devo prendere l'isbn del libro quando l'utente schiaccia sul pulsante che si riferisce al libro*/
		bookBean libro = book.getBookBean(ISBN);
		
		
		if(libro.isApprovazione() == true){
		request.setAttribute("libro", libro);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/BookJSP.jsp");
		dispatcher.forward(request,response);}
		else {
			request.setAttribute("libro", libro);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/BookAJSP.jsp");
			dispatcher.forward(request,response);}
		}
		
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
