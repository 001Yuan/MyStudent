package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.User;

/**
 * Servlet implementation class ExitServlet
 */
@WebServlet(name = "ExitServlet",value = "/ExitServlet")
public class ExitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println(user.getIdentity());
		if(user.getIdentity().equals("student")){
			session.removeAttribute("grade");
			response.sendRedirect(request.getContextPath() + "/Student.jsp");
		}else{
			session.removeAttribute("grade");
			response.sendRedirect(request.getContextPath() + "/Admin.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
