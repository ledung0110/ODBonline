/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.AccountDao;
import dal.TokenDao;
import entities.Account;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import utilities.TokenGenerator;
import utilities.TokenHelper;

/**
 *
 * @author nvash
 */
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/reset"})
public class ResetPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String token = request.getParameter("token");
            JSONObject json = TokenGenerator.decrypt(token);
            if (!TokenHelper.isValidTokenReset(token)) {
                response.sendError(403);
                return;
            }
            String username = json.getString("username");

            request.setAttribute("username", username);

            request.getRequestDispatcher("resetPassword.jsp").forward(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(VerifyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        AccountDao accountDao = new AccountDao();
        Account account = accountDao.getAccountByUsername(username);
        account.setPassword(password);
        accountDao.updateAccount(account);
        new TokenDao().deleteToken(token);

        response.sendRedirect(".");
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
