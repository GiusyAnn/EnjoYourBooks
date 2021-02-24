package control;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.bookDao;

import dao.userDao;
import model.userBean;

@WebServlet("/pubblicaServlet")
public class pubblicaServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		String titolo = request.getParameter("Titolo");
		String autore = request.getParameter("Autore");
		String genere= request.getParameter("genere");
		String trama = request.getParameter("Trama");
		String copertina = "Img/0873a99fbfa56c55da4181ee4c36f93f.jpg";
		
		Random ran= new Random();
		int is = ran.nextInt(9999999)+1;
		int bn = ran.nextInt(999999)+1;
		String a= Integer.toString(is);
		String b=Integer.toString(bn);
		String isbn = a.concat(b);
		
		String casae = "EnjoYourBooks";
		double prezzo= 15.00;
		String tipo= "Digitale";
		int quantita = 50;
	
		HttpSession session = request.getSession();
		userBean user = (userBean) session.getAttribute("user");
		String username = user.getuser();
		
		boolean approvazione = false;
		
		bookDao manager = new bookDao();
		boolean pub = manager.pubblication( titolo, isbn, autore, genere, copertina, trama,  casae, prezzo, tipo, quantita, username, approvazione);
		
		if (pub ==true) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/errorPage/PubblicationSJSP.jsp");
			dispatcher.forward(request,response);
		}
		else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/errorPage/PubblicationEJSP.jsp");
			dispatcher.forward(request,response);
		}
	}

}
