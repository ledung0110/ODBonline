/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
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
public class CheckCaptchaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String captcha = request.getParameter("captcha");
         GoogleReCaptcha gcaptcha = new GoogleReCaptcha(ConfigManagement.getInstance().getConfigValue("GOOGLE_RECAPTCHA_SECRET_KEY"));
        if (gcaptcha.checkCaptcha(captcha)) {
            response.getWriter().write("true");
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
