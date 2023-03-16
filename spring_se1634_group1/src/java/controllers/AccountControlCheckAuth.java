///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controllers;
//
//import dal.AccountDao;
//import dal.UserDao;
//import entities.Account;
//import entities.User;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import java.sql.SQLException;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//
///**
// *
// * @author win
// */
//@WebServlet(name = "AccountControlServlet", urlPatterns = {"/accControlCheckAuth"})
//public class AccountControlCheckAuth extends HttpServlet {
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
////        PrintWriter out = response.getWriter();
////        int id = Integer.parseInt(request.getParameter("id"));
////        String fullName = request.getParameter("name");
////        String email = request.getParameter("email");
////        String phone = request.getParameter("phone");
////
////        UserDao userDao = new UserDao();
////
////        User user = new User(id, fullName, email, phone);
////        out.write("success");
////        try {
////            userDao.updateUser(user);
////            
////        } catch (SQLException ex) {
////            System.out.println(ex);
////        }
//
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
