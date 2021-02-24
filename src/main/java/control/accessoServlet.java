package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import com.google.gson.Gson;
import dao.*;
import model.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/accessoServlet")
public class accessoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private userBean user;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request,response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("Ciao");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		System.out.println("Parametri : "+username+" "+password);
		HttpSession session = request.getSession();
		bookDao book = new bookDao();
		
		
		if(username == null || password == null) {
			JSONResponse jsonResponse = new JSONResponse(false,"Inserire Username e Password");
			out.print(gson.toJson(jsonResponse));
			return;
		}
		
		userDao manager = new userDao();
		user = manager.login(username, password);

		if(user == null) {
			JSONResponse jsonResponse = new JSONResponse(false, "Username o Password Errati");
			out.print(gson.toJson(jsonResponse));
			return;	
		}
		else {
			session.setAttribute("user", user);	
			ArrayList<bookBean> preferiti = new ArrayList<bookBean>();			
			preferiti = book.getPrefLibri(user.getuser());			
			session.setAttribute("preferiti", preferiti);
			session.setMaxInactiveInterval(24*60);
			JSONResponse jsonResponse = new JSONResponse(true, "OK", user.getnome());
			out.print(gson.toJson(jsonResponse));
			/*RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/JSP/UserJSP.jsp");
			dispatcher.forward(request,response);*/
			
		}
	}

}
