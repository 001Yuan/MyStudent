package Controller;

import Dao.AdministratorDao;
import Dao.StudentDao;
import Dao.UserDao;
import Model.Administrator;
import Model.Student;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LoginServlet
 * @author asus
 */
@SuppressWarnings("all")
@WebServlet(name = "LoginServlet",value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String identity = request.getParameter("identity");

		
		System.out.println(username + " " + password + " " + " " + identity);
		if(username != null && password != null){
			System.out.println("�˺����벻Ϊ��");
			//�˺����벻Ϊ��

				if(identity !=null) {
					if(identity.equals("admin")){
						//��ʦ
						try{
							System.out.println("�����ʦ");
							AdministratorDao adminDao = new AdministratorDao();
							Administrator admin = adminDao.find(username); 
							if (admin != null){
								if (admin.getTcPassword().equals(password)) {
									System.out.println("ok");
									function1(username, password, 1, request, response);
								}
							} else {
								request.setAttribute("errerMsg", "û�иý�ʦ");
								request.getRequestDispatcher("/Login.jsp").forward(request, response);
							}
						} catch (Exception ee) {
							ee.printStackTrace();
						}
					} else if (identity.equals("student")){
						//ѧ��
						try{
							System.out.println("����ѧ��");
							StudentDao stuDao = new StudentDao();
							Student student = stuDao.find(username);
							if (student != null) {
								if (student.getStuPassword().equals(password)){
									System.out.println("ok");
									function1(username, password, 2, request, response);
								}
							} else {
								request.setAttribute("errerMsg", "û�и�ѧ��");
								request.getRequestDispatcher("/Login.jsp").forward(request, response);
							}
						} catch (Exception ee) {
							ee.printStackTrace();
						}
					}
				} else {
					request.setAttribute("errerMsg", "���Ϊ��");
					request.getRequestDispatcher("/Login.jsp").forward(request, response);
				}

		} else {
			//�˺Ż�����Ϊ��
			request.setAttribute("errerMsg", "�û��������벻��Ϊ��");
			request.getRequestDispatcher("/Login.jsp").forward(request, response);
		}
	}
	
	private void function1(String username, String password,  int num,
			HttpServletRequest request, HttpServletResponse response) throws IOException{
		//���û�״̬user�������session��
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		if (num == 1) {
			user.setIdentity("admin");
			
		} else if (num ==2) {
			user.setIdentity("student");
		}
		request.getSession().setAttribute("user", user);
		//��½��¼
		UserDao userDao = new UserDao();
		userDao.insert(user);

		//��ʦ
		if (num == 1) {
			//��ת����ҳ
			response.sendRedirect(request.getContextPath() + "/Admin.jsp");
			//ѧ��
		} else if (num == 2){
			//��ת����ҳ
			response.sendRedirect(request.getContextPath() + "/Student.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
