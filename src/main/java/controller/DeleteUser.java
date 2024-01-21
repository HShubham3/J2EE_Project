package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import model.Registration;

@WebServlet(name="delete",urlPatterns="/delete")
public class DeleteUser extends HttpServlet{
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String id;
		HttpSession session=request.getSession();
		
		if(request.getParameter("delete")!=null) {
			id=request.getParameter("userid");
			String status=new Registration(session).delete(id); 
			
			if(status.equals("success")) {
				request.setAttribute("status", "Successfully deleted");
				request.getRequestDispatcher("DeleteUser.jsp").forward(request, response);
			}
			else if(status.equals("failed")) {
				System.out.println();
				request.setAttribute("status", "Failed to delete");
				request.getRequestDispatcher("DeleteUser.jsp").forward(request, response);
			}
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 processRequest(req,resp);
	}
	

}
