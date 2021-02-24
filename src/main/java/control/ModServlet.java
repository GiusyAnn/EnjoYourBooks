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
 * Servlet implementation class ModServlet
 */
@WebServlet("/ModServlet")
public class ModServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/html");
		HttpSession session = request.getSession();	
		String username = request.getParameter("Username");
		String password = request.getParameter("password");
		String nome= request.getParameter("Nome");
		String cognome = request.getParameter("Cognome");
		String email = request.getParameter("Email");
		String via = request.getParameter("via");
		String cap = request.getParameter("cap");
		String citta = request.getParameter("citta");
		String provincia = request.getParameter("provincia");
		String profilo = request.getParameter("profilo");
		System.out.println("SERVLET--> Abbiamo preso i parametri ");
		userDao mod = new userDao();
		try {
			mod.modifica( username,  nome,  cognome, password,  profilo,  email,  via,  cap,  citta, provincia);
			userBean user = mod.login(username, password);
			session.setAttribute("user", user);	
			session.setMaxInactiveInterval(24*60);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/UserJSP.jsp");
			dispatcher.forward(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
