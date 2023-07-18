package Controller;

import Dao.*;
import Model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class AddScoreServlet
 */
@WebServlet(name = "AddScoreServlet",value = "/AddScoreServlet")
public class AddScoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String stuId = request.getParameter("stuId");
		String stuName = request.getParameter("stuName");
		String courseId = request.getParameter("courseId");
		String tcId = request.getParameter("tcId");
		String courseGrade = request.getParameter("courseGrade");
		String classId = request.getParameter("classId");
		
		try{
			StudentDao stuDao = new StudentDao();
			CourseDao courseDao = new CourseDao();
			AdministratorDao adminDao = new AdministratorDao();
			ClassesDao classesDao = new ClassesDao();
			GradeDao gradeDao = new GradeDao();
			
			Student stu = stuDao.find(stuId);
			Course course = courseDao.find(courseId);
			Administrator admin = adminDao.find(tcId);
			Classes classes = classesDao.find(classId);
			Grade grade = new Grade();
			
			grade.setStuId(stuId);
			grade.setStuName(stuName);
			grade.setCourseId(courseId);
			grade.setTcId(tcId);
			grade.setCourseGrade(courseGrade);
			grade.setClassId(classId);
			if (stu.getStuName() == null) {
				request.setAttribute("errerMsg", "����Ϊ��");
				request.getRequestDispatcher("/AddScore.jsp").forward(request, response);
			}
			if(stu != null || stu.getStuName() == stuName){
				if(course != null){
					if(admin != null){
						if(classes != null){
							if(gradeDao.insert(grade)){
								response.sendRedirect(request.getContextPath() + "/AddScore.jsp");
							}else{
								request.setAttribute("errerMsg", "���ʧ��");
								request.getRequestDispatcher("/AddScore.jsp").forward(request, response);
							}
						}else{
							request.setAttribute("errerMsg", "û�иð༶");
							request.getRequestDispatcher("/AddScore.jsp").forward(request, response);
						}
					}else{
						request.setAttribute("errerMsg", "û�иý�ʦID");
						request.getRequestDispatcher("/AddScore.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("errerMsg", "û�иÿγ�ID");
					request.getRequestDispatcher("/AddScore.jsp").forward(request, response);
				}
			} 
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
