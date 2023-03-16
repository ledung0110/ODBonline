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
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utilities.Crypto;
import utilities.GlobalConstants;
import utilities.GoogleReCaptcha;

/**
 *
 * @author win
 */
@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/change"})
public class ChangePasswordServlet extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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

        HttpSession session = request.getSession(true);
        String username = (String) session.getAttribute("username");
        Account account = new AccountDao().getAccountByUsername(username);
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

        String username = request.getParameter("username");
         String oldPassword= request.getParameter("password");
        String newPassword = request.getParameter("newPass");
        String rePassword= request.getParameter("reType");
        
        Account account = new AccountDao().getAccountByUsername(username);
       
             account.setPassword(newPassword);
        new AccountDao().updateAccount(account);
        
        
        request.setAttribute("account", account);
        

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
