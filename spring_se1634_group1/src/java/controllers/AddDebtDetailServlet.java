/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dal.DebtDetailDao;
import entities.Debt;
import entities.DebtDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import utilities.TotalDebtService;

/**
 *
 * @author nvash
 */
@WebServlet(name = "AddDebtDetailServlet", urlPatterns = {"/addDebtDetail"})
@MultipartConfig
public class AddDebtDetailServlet extends HttpServlet {

    TotalDebtService totalDebtService = new TotalDebtService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String debtId = request.getParameter("id");
            String debtType = request.getParameter("debtType");
            String note = request.getParameter("note");
            String amount = request.getParameter("amount");
            String createdDate = request.getParameter("debtCreatedAt");
            Part imagePart = request.getPart("image");
            String imageName="";
            
            imageName = imagePart.getSubmittedFileName();
            
            InputStream imageContent = imagePart.getInputStream();
            int counter = 0;
            if(!imageName.isEmpty()){
            while(new DebtDetailDao().isFilenameExist(imageName)){
                 counter++;
                 imageName =  "("+counter+")"+imageName;
            }
            }
            // Tạo đối tượng Debt từ các giá trị vừa lấy
            DebtDetail debtDetail = new DebtDetail();
            debtDetail.setDebtId(Long.parseLong(debtId));
            debtDetail.setDebtType(Boolean.parseBoolean(debtType));
            debtDetail.setNote(note);
            if (amount.isEmpty()) {
                debtDetail.setAmount(0);
            } else {
                debtDetail.setAmount(Double.parseDouble(amount));
            }
            Date currentDate = new Date();
            Timestamp currentDatee = new Timestamp(currentDate.getTime());
            if (createdDate.isEmpty()) {
                debtDetail.setDebtCreatedAt(currentDatee);
            } else {
                SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                debtDetail.setDebtCreatedAt(new Timestamp(originalFormat.parse(createdDate).getTime()));
            }
            debtDetail.setDateCreateAt(currentDatee);
            debtDetail.setImage(imageName);
            totalDebtService.calTotalDebt(debtDetail);
            if(!imageName.isEmpty()){
            // Lưu file hình ảnh vào một thư mục trên máy chủ
            String uploadPath = getServletContext().getRealPath("") + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String imagePath = uploadPath + File.separator + imageName;
            
            try ( OutputStream outputStream = new FileOutputStream(imagePath)) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = imageContent.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            }
            }
        } catch (ParseException ex) {
            Logger.getLogger(AddDebtDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("DebtsListServlet");
    }

}
