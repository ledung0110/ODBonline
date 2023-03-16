/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.AccountDao;
import dal.TokenDao;
import dal.UserDao;
import entities.Account;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import utilities.ConfigManagement;
import utilities.EmailSystem;
import utilities.GlobalConstants;
import utilities.TokenGenerator;

/**
 *
 * @author nvash
 */
public class ForgotPasswordServlet extends HttpServlet {

    EmailSystem emailSystem = new EmailSystem();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        Account account = new AccountDao().getAccountByUsername(username);
        User user = new UserDao().getUserByUsername(username);
        String oldPassword = account.getPassword();
        HashMap<String, Object> data = new HashMap<>();
        data.put("username", username);
        data.put("expiry", new Date().getTime() + 1000 * 60 * 30); // 30 minutes
        String text = "Please visit the following link to set a new password (valid for 30 minutes): \nhttp://" + ConfigManagement.getInstance().getConfigValue("HOST") + "/reset?token=" + TokenGenerator.generate(data, oldPassword);
        String token = TokenGenerator.generate(data, oldPassword);
        TokenDao tokenDao = new TokenDao();
        if (!account.isConfirmed()) {
            token = TokenGenerator.generate(data, "ODB_Group1");
            text = "Please access the following link to confirm your password: \nhttp://" + ConfigManagement.getInstance().getConfigValue("HOST") + "/verifyacc?token=" + token;
            emailSystem.sendEmail("ODB (No-Reply", user.getEmail(), "[ODB] Verify Account", text);
            tokenDao.addToken(token);
        } else {
            emailSystem.sendEmail("ODB (No-Reply", user.getEmail(), "[ODB] Password Recovery", text);
            tokenDao.addToken(token);
        }

        response.sendRedirect(".");
    }

}
