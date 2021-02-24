package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.bookDao;
import model.bookBean;

/**
 * Servlet implementation class hideServlet
 */
@WebServlet("/hideServlet")
public class hideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hideServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		
		
		
		bookDao book = new bookDao();
		ArrayList<bookBean> libri = new ArrayList<bookBean>();
		
		libri = book.getnewLibri();	
		
		System.out.println("DAO-->Query eseguita");
		for (bookBean l: libri) {
			System.out.println(l.getTitolo());
		}
		
		request.setAttribute("libri", libri);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/ApprovaJSP.jsp");
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
