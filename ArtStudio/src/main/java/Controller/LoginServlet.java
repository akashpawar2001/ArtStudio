package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
import model.UserDao;

@WebServlet(urlPatterns = {"/login","/createUser"})
public class LoginServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path=req.getServletPath();
		
		if(path.equals("/login")) {
			loginUser(req,resp);
		}else {
			createUser(req,resp);
		}
		
	}

	private void createUser(HttpServletRequest req, HttpServletResponse resp) {
		String firstName=req.getParameter("firstName");
		String lastName=req.getParameter("lastName");
		String emailAddress=req.getParameter("emailAddress");
		String password=req.getParameter("password");
		String contact=req.getParameter("contact");
		
		User user=new User(firstName,lastName,emailAddress,password,contact);
		
		boolean result=UserDao.createUser(user);
		
		if(result==true) {
			try {
				resp.sendRedirect("login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				req.setAttribute("STATUS", "Something Went Wrong");
				req.getRequestDispatcher("login.jsp").forward(req, resp);;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

	private void loginUser(HttpServletRequest req, HttpServletResponse resp) {
		String userEmail=req.getParameter("userEmail");
		String userPassword=req.getParameter("userPassword");
		
		User u=new User();
		u.setEmailAddress(userEmail);
		u.setPassword(userPassword);
		Boolean status=UserDao.authenticateUser(u);
		
		if(status==true) {
			try {				
				HttpSession session=req.getSession();
				session.setAttribute("AUTH", "valid");
				resp.sendRedirect("home");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				req.setAttribute("STATUS", "invalid user");
				req.getRequestDispatcher("login.jsp").forward(req, resp);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
