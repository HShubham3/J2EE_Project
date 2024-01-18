//package controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.*;
//
//import model.Registration;
//
//
//@WebServlet(name="forgot" , urlPatterns="/forgot")
//public class forgotpass extends HttpServlet{
//	
//	protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
//		response.setContentType("text/html;charset=UTF-8");
//		
//		HttpSession session =request.getSession();
//		Registration reg = new Registration(session);
//		
//		 
//		if(request.getParameter("forgot")!=null) {
//			
//			String email=request.getParameter("email");
//			String id=request.getParameter("id");
//			String pw=request.getParameter("pw");
//			String cp=request.getParameter("cp");
//			
//			if(pw.equals(cp)) {
//				String status=reg.forgotPassword(pw,id);
//				
//				if(status.equals("success")) {
//					request.setAttribute("status", "Successfully updated");
//					//System.out.println(request.getAttribute("status"));
//					request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
//				}
//				else if(status.equals("failed")) {
//					request.setAttribute("status", "Failed to update");
//					request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
//				}
//			}
//			
//		}
//		
//	}
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		processRequest(req,resp);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		processRequest(req,resp);
//	}
//
//}
//
// 
