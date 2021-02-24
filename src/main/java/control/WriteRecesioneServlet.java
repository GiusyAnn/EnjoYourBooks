package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.recensioneDao;
import model.userBean;

/**
 * Servlet implementation class WriteRecesioneServlet
 */
@WebServlet("/WriteRecesioneServlet")
public class WriteRecesioneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteRecesioneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");		
		String isbn = request.getParameter("ISBN");
		HttpSession session = request.getSession();
		userBean user = (userBean) session.getAttribute("user");
		String username= user.getuser();
		String recensione = request.getParameter("recensione");
		String vt = request.getParameter("Voto");
		int voto = Integer.parseInt(vt);
		
		recensioneDao dao = new recensioneDao();
		dao.nuovarecensione(username, isbn, voto, recensione);
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
