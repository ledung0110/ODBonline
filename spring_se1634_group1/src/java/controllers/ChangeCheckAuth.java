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
import utilities.ConfigManagement;
import utilities.Crypto;
import utilities.GlobalConstants;
import utilities.GoogleReCaptcha;

/**
 *
 * @author win
 */
@WebServlet(name = "ChangeCheckAuth", urlPatterns = {"/changecheckauth"})
public class ChangeCheckAuth extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String currentPassword = request.getParameter("password");
        String newPassword = request.getParameter("newPass");
        String confirmPassword = request.getParameter("reType");
        String captcha = request.getParameter("g-recaptcha-response");
        GoogleReCaptcha gcaptcha = new GoogleReCaptcha(ConfigManagement.getInstance().getConfigValue("GOOGLE_RECAPTCHA_SECRET_KEY"));
        PrintWriter out = response.getWriter();
        Account account = new AccountDao().getAccountByUsernameAndPassword(username, currentPassword);
        if (account != null) { 
            if (newPassword.equals(confirmPassword) && newPassword.matches("/^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/") ) {
                // Validate the new password
                if (gcaptcha.checkCaptcha(captcha)) {
                      account.setPassword(newPassword);
                       new AccountDao().updateAccount(account);
                } else {
                    out.write("captchafalse");
                }
            } else {
                out.write("notsame");
            } 
        } else {
            out.write("notfoundacc");

        }
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
