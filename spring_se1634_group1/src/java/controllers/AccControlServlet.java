/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.AccountDao;
import dal.UserDao;
import entities.Account;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author win
 */
@WebServlet(name = "AccountControlServlet", urlPatterns = {"/accControl"})
public class AccControlServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        UserDao userDao = new UserDao();
        User user = userDao.getUserByUsername(username);
        Account account = new AccountDao().getAccountByUsername(username);
        request.setAttribute("user", user);
        request.setAttribute("account", account);

        request.getRequestDispatcher("change.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

//        long id = Long.parseLong(request.getParameter("id"));
//        String fullName = request.getParameter("name");
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//        
//        User u=new User(id, fullName,email,phone);
//        UserDao userDao = new UserDao();
//        try {
//            userDao.updateUser(u);
//        } catch (SQLException ex) {
//            Logger.getLogger(AccControlServlet.class.getName()).log(Level.SEVERE, null, ex);
//        }
        UserDao userDao = new UserDao();
        long id = Long.parseLong(request.getParameter("id"));
        String fullName = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        if (fullName.matches("^[a-zA-Z][a-zA-Z0-9]{8,17}") && phone.matches("^[0][0-9]{9}")) {
            
            try {
                userDao.updateUser(new User(id, fullName, email, phone));
            } catch (SQLException ex) {}
            
            request.setAttribute("ms", "Update sucessfull");
 
        } else if (fullName.matches("^[a-zA-Z][a-zA-Z0-9]{8,17}")) {
            request.setAttribute("ms", "Invalid Phone");
           
        } else {
            request.setAttribute("ms", "Invalid Full Name");
            
        };
        HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            User user = userDao.getUserByUsername(username);
            Account account = new AccountDao().getAccountByUsername(username);
            request.setAttribute("user", user);
            request.setAttribute("account", account);
            request.getRequestDispatcher("change.jsp").forward(request, response);
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
