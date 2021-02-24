package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.userDao;

/**
 * Servlet implementation class verificaReg
 */
@WebServlet("/verificaRegServlet")
public class verificaRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verificaRegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		System.out.println("Abbiamo ricebuto i parametri : "+username+" "+password);
		userDao manager = new userDao();
		boolean ver = manager.controllo(username);
		if(!ver) {
			JSONResponse jsonResponse = new JSONResponse(false,"Username non disponibile");
			out.print(gson.toJson(jsonResponse));
			return;
		}else {
			JSONResponse jsonResponse = new JSONResponse(true, "Credenziali Valide");
			out.print(gson.toJson(jsonResponse));
		}
		if(password.length()<8) {
			JSONResponse jsonResponse = new JSONResponse(false,"Password Non Valida");
			out.print(gson.toJson(jsonResponse));
			return;
		}else {
			JSONResponse jsonResponse = new JSONResponse(true, "Credenziali Valide");
			out.print(gson.toJson(jsonResponse));
		}
		if(username == null || password == null) {
			JSONResponse jsonResponse = new JSONResponse(false,"Inserire Username e Password");
			out.print(gson.toJson(jsonResponse));
			return;
		}else {
			JSONResponse jsonResponse = new JSONResponse(true, "Credenziali Valide");
			out.print(gson.toJson(jsonResponse));
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
