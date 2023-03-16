/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.ConfigurationDao;
import dal.DebtDao;
import dal.UserDao;
import entities.Configuration;
import entities.Debt;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import utilities.ConfigManagement;

/**
 *
 * @author nvash
 */
@WebServlet(name = "addConfigureServlet", urlPatterns = {"/addConfig"})
public class AddConfigureServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            String key = request.getParameter("key");
            String value = request.getParameter("value");
            // Lấy ngày hiện tại
            Date currentDate = new Date();
        // Định dạng ngày tháng
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        // Chuyển đổi thành chuỗi theo định dạng
            String formattedDate = dateFormat.format(currentDate);
            Date format = dateFormat.parse(formattedDate);
            Timestamp date = new Timestamp(format.getTime());
            
            Configuration  configuration= new Configuration();
            configuration.setKey(key);
            configuration.setValue(value);
            configuration.setCreatedAt(date);
            configuration.setUpdatedAt(date);
            
            new ConfigurationDao().addConfig(configuration);
            ConfigManagement.getInstance().refresh();
            response.sendRedirect("ConfigManagerServlet");
        } catch (ParseException ex) {
            Logger.getLogger(AddDebtorServlet.class.getName()).log(Level.SEVERE, null, ex);
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
