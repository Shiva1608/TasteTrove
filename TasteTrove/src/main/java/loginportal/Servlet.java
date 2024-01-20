package loginportal;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/Servlet")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String Remail = null;
	Dbconnect obj = null;
	String email = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pwd = null;
		String error=null;
		String[] params = request.getQueryString().split("&");
		try {
			obj = new Dbconnect();
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		if(params[0].equals("login"))
		{
			email = request.getParameter("email");
			 pwd = request.getParameter("pwd");
				 try {
					error = obj.login(email, pwd);
					if(error == null) {
						Cookie ck = new Cookie("user", email);
						ck.setMaxAge(60*60*24*10);
						response.addCookie(ck);
						response.sendRedirect(params[1]);
						return;
						
				} }catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
				 request.setAttribute("error", "okay");
				 request.setAttribute("p", "login");
				 request.setAttribute("err", error);
				 request.getRequestDispatcher(params[1]).forward(request, response);
			}
		else if(params[0].equals("signup"))
		{
			email = request.getParameter("email");
			 pwd = request.getParameter("pwd");
			String conf_pwd = request.getParameter("conf_pwd");
			String name = request.getParameter("name");
			if(pwd.equals(conf_pwd)) {
				try {
						if(Encryption.check(pwd)) {
							error = obj.sign_up(name, email, pwd);
							if(error == null) {
								Cookie ck = new Cookie("user", email);
								ck.setMaxAge(60*60*24*10);
								response.addCookie(ck);
								response.sendRedirect(params[1]);
								return;
							}
						}
							else
								error = "Weak password!";
						} catch (NoSuchAlgorithmException e) {
					e.printStackTrace();
				}
				}
			else
				error = "Password doesnt match!";
			request.setAttribute("error", "okay");
			request.setAttribute("er", error);
			request.setAttribute("p", "signup");
			request.getRequestDispatcher(params[1]).forward(request, response);
		}
		else if(params[0].equals("reset")) {
				
				Remail = request.getParameter("Remail");
				try {
					if(obj.email_check(Remail) != null) {
						error = obj.email_check(Remail);
						request.setAttribute("error", error);
						request.getRequestDispatcher(params[1]).forward(request, response);
						return;
					}
					else {
						EmailSender.sendMail(Remail);
						request.setAttribute("otp", "yes");
						System.out.print(params);
						request.getRequestDispatcher(params[1]).forward(request, response);
						return;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		else if(params[0].equals("otp")) {
			String otp = request.getParameter("otp");
			if(otp.equals(otp)) {
				request.setAttribute("otp", "change");
				request.getRequestDispatcher(params[1]).forward(request, response);
			}
			else {
				response.sendRedirect(params[1]);
				return;
			}
		}
		else if(params[0].equals("change")) {
				String pass = request.getParameter("pass");
				String conf_pass = request.getParameter("conf_pass");
				if(pass.equals(conf_pass)) {
					if(Encryption.check(pass)) {
						error = obj.reset(Remail, conf_pass);
						if(error == null) {
							response.sendRedirect(params[1]);
							return;
						}
					}
					else
						error = "Weak password!";
				}
				else
					error = "Password doesnt match!";
				request.setAttribute("otp", "change");
				request.setAttribute("error", error);
				request.getRequestDispatcher(params[1]).forward(request, response);
			}
		else if(params[0].equals("logout")) {
			Cookie cookie = new Cookie("user","");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			System.out.print(User.items);
			User.items.clear();
			response.sendRedirect("navigation.jsp");
			return;
		}
		else {
			String item = request.getParameter("item");
			String query = request.getQueryString();
			User.setItem(item);
			System.out.print(query);
			response.sendRedirect("restaurant.jsp?"+query);
		}
		}
	}

