/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dal.AccountDao;
import dal.TokenDao;
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
@WebServlet(name = "VerifyServlet", urlPatterns = {"/verifyacc"})
public class VerifyServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String token = request.getParameter("token");
            JSONObject json = TokenGenerator.decrypt(token);
            if (!TokenHelper.isValidTokenSignUp(token)) {
                response.sendError(403);
                return;
            }
            String username = json.getString("username");

            request.setAttribute("token", token);
            request.setAttribute("username", username);
            request.getRequestDispatcher("verify.jsp").forward(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(VerifyServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String token = request.getParameter("token");
            JSONObject json = TokenGenerator.decrypt(token);
            AccountDao userModel = new AccountDao();
            String username = json.getString("username");
            userModel.accountConfirmed(username);
            new TokenDao().deleteToken(token);
            response.sendRedirect(".");
        } catch (IOException | JSONException e) {

            out.print(e);
        }
    }

}
