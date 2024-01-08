package controller;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;


import model.Registration;

@WebServlet(name = "search", urlPatterns = {"/search"})
public class search extends HttpServlet{
	
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Registration u = new Registration(session);
        try {
            if(session.getAttribute("id") != null && session.getAttribute("id").equals("1")){
            String id = request.getParameter("id");
            request.getRequestDispatcher("search.jsp?id=" + id).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        processRequest(request, response);
    }

     

}
