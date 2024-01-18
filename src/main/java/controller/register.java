package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Registration;


@WebServlet(name="register",urlPatterns="/register")
public class register extends HttpServlet{
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		// type of the response sent to the client or browser
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		Registration reg = new Registration(session);
		
		try {
			if (request.getParameter("register") != null) {
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String pw = request.getParameter("pw");
				String cp = request.getParameter("cp");
				
				if (pw.equals(cp)) {
					String status = reg.Registration(name, phone, email, pw);//method call in model package Registration class
					
					if (status.equals("existed")) {
						request.setAttribute("status", "Existed record");
						RequestDispatcher rd1 = request.getRequestDispatcher("Registration.jsp");
						rd1.forward(request, response);
					} 
					else if (status.equals("success")) {
						request.setAttribute("status", "Successfully Registered");
						RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
						rd1.forward(request, response);
					} 
					else if (status.equals("failure")) {
						request.setAttribute("status", "Registration failed");
						RequestDispatcher rd1 = request.getRequestDispatcher("Registration.jsp");
						rd1.forward(request, response);
					}
				}
			}
			else if (request.getParameter("login") != null) {
				
				String email = request.getParameter("email");
				String pass = request.getParameter("pw");
				
				String status = reg.login(email, pass);//login()
				
				if (status.equals("success")) {
					RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
					rd1.forward(request, response);
				} else if (status.equals("failure")) {
					request.setAttribute("status", "Login failed");
					RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
					rd1.forward(request, response);
				}
			} else if (request.getParameter("logout") != null) {
				session.invalidate();
				RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
				rd1.forward(request, response);
			}
			else if (session.getAttribute("uname") != null && request.getParameter("submit") != null) {
                String name = request.getParameter("name");
                String pno = request.getParameter("pno");
                String email = request.getParameter("email");
                Registration u = new Registration(session);
                String status = u.update(name, pno, email);
                if (status.equals("success")) {
                    request.setAttribute("status", "Profile successfully Updated");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                } else {
                    request.setAttribute("status", "Updation failure");
                    RequestDispatcher rd1 = request.getRequestDispatcher("index.jsp");
                    rd1.forward(request, response);
                }
            }
			else if(request.getParameter("continue")!=null)
            {
            	String email=request.getParameter("email");
            	String status=reg.forgot(email);
            	if(status.equals("success"))
            	{
            		RequestDispatcher rd1 = request.getRequestDispatcher("change.jsp");
                    rd1.forward(request, response);
            	}
            	else if(status.equals("failure"))
            	{
            		request.setAttribute("status","Invalid email");
            		RequestDispatcher rd1 = request.getRequestDispatcher("forgotpass.jsp");
                    rd1.forward(request, response);
                }
            	
            }
            else if(request.getParameter("change")!=null)
            {
            	String pword=request.getParameter("pwd");
            	String cword=request.getParameter("cp");
            	if(pword.equals(cword))
            	{
            		String status=reg.change(pword);
            		if(status.equals("existed"))
            		{
            			request.setAttribute("status","EXISTED PASSWORD");
            			RequestDispatcher rd1 = request.getRequestDispatcher("change.jsp");
                        rd1.forward(request, response);
            		}
            		else if(status.equals("success"))
            		{
            			request.setAttribute("status","password updated successfully");
            			RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
                        rd1.forward(request, response);
            			
            		}
            		else if(status.equals("failure"))
            		{
            			request.setAttribute("status","upadation failed");
            			RequestDispatcher rd1 = request.getRequestDispatcher("change.jsp");
                        rd1.forward(request, response);
            		}
            	}
            	else {
            		request.setAttribute("status","Password not matched");
        			RequestDispatcher rd1 = request.getRequestDispatcher("change.jsp");
                    rd1.forward(request, response);
            	}
            }


		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	public String getServletInfo() {
		return "Short description";
	}

}
