package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.bookDao;
import model.bookBean;
import model.userBean;

/**
 * Servlet implementation class RemoveLoveServlet
 */
@WebServlet("/RemoveLoveServlet")
public class RemoveLoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveLoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();
		userBean user = (userBean) session.getAttribute("user");
		String isbn = request.getParameter("ISBN");
		ArrayList<bookBean> preferiti = (ArrayList<bookBean>) session.getAttribute("preferiti");
		
		bookDao dao = new bookDao();
		dao.remove(isbn, user.getuser());
		preferiti = dao.getPrefLibri(user.getuser());			
		session.setAttribute("preferiti", preferiti);
		session.setMaxInactiveInterval(24*60);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
