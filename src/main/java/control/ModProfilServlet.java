package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.userDao;
import model.userBean;

/**
 * Servlet implementation class ModProfilServlet
 */
@WebServlet("/ModProfilServlet")
public class ModProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModProfilServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		HttpSession session = request.getSession();	
		String profilo = request.getParameter("profilo");
		String username = request.getParameter("username");
		userBean usre = (userBean) session.getAttribute("user");
		String password = usre.getpass();
		userDao mod = new userDao();
		try {
			mod.modimg( username, profilo);
			usre = mod.login(username, password);
			session.setAttribute("user", usre);	
			session.setMaxInactiveInterval(24*60);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/UserJSP.jsp");
			dispatcher.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
