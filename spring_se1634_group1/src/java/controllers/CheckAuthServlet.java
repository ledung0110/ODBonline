/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.AccountDao;
import entities.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utilities.ConfigManagement;
import utilities.GoogleReCaptcha;

/**
 *
 * @author nvash
 */
public class CheckAuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
        String captcha = request.getParameter("captcha");
        GoogleReCaptcha gcaptcha = new GoogleReCaptcha(
                ConfigManagement.getInstance().getConfigValue("GOOGLE_RECAPTCHA_SECRET_KEY"));

        if (gcaptcha.checkCaptcha(captcha)) {
            Account account = new AccountDao().getAccountByUsernameAndPassword(username, password);
            if (account == null) {
                out.write("invalid");

            } else if (account.isConfirmed()) {
                out.write("confirmed");

            } else {
                out.write("not confirmed");
            }
        } else {
            out.write("false");
        }

    }

}
