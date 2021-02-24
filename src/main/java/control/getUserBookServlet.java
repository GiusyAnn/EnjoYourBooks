package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.bookDao;
import dao.recensioneDao;
import model.bookBean;
import model.recensioneBean;
import model.userBean;

/**
 * Servlet implementation class getUserBookServlet
 */
@WebServlet("/getUserBookServlet")
public class getUserBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getUserBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//getUserLibri
		HttpSession session = request.getSession();
		userBean user = (userBean) session.getAttribute("user");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		bookDao dao = new bookDao();
		
		ArrayList<bookBean> elenco = new ArrayList<bookBean>();
		elenco = dao.getUserLibri(user.getuser());
		for(bookBean r : elenco) {
			System.out.println(r.getTitolo());
		}
		
		if (elenco == null) {
			response.sendError(403);
			
		} else { 
			request.setAttribute("pubblicati", elenco);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/ProvaPubJSP.jsp");
			dispatcher.forward(request,response);
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
