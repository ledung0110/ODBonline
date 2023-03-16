/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import com.google.gson.Gson;
import dal.ConfigurationDao;
import entities.Configuration;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONObject;

/**
 *
 * @author nvash
 */
@WebServlet(name = "ConfigManagerServlet", urlPatterns = {"/ConfigManagerServlet"})
public class ConfigManagerServlet extends HttpServlet {

  

//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("configManager.jsp").forward(request, response); 
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
         int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            String sortField = request.getParameter("sortField");
            String sortOrder = request.getParameter("sortOrder");
            String idFrom = request.getParameter("idFrom");
            String idTo = request.getParameter("idTo");
            String filterKey = request.getParameter("filterKey");
            String filterValue = request.getParameter("filterValue");
            String createdFrom = request.getParameter("createdFrom");
            String createdTo = request.getParameter("createdTo");
            String updatedFrom = request.getParameter("updatedFrom");
            String updatedTo = request.getParameter("updatedTo");
            SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            if (!createdFrom.isEmpty()) {
                createdFrom = dateFormat.format(originalFormat.parse(createdFrom));
            }

            if (!createdTo.isEmpty()) {
                createdTo = dateFormat.format(originalFormat.parse(createdTo));
            }
            if (!updatedFrom.isEmpty()) {
                updatedFrom = dateFormat.format(originalFormat.parse(updatedFrom));
            }
            if (!updatedTo.isEmpty()) {
                updatedTo = dateFormat.format(originalFormat.parse(updatedTo));
            }
             ConfigurationDao dao = new ConfigurationDao();
            int startIndex = (page - 1) * pageSize;
            List<Configuration> configList =  dao.getConfiguList(startIndex, pageSize, sortField, sortOrder, idFrom, idTo, filterKey, filterValue, createdFrom, createdTo, updatedFrom, updatedTo);
            long totalConfig = dao.countConfig(idFrom, idTo, filterKey, filterValue, createdFrom, createdTo, updatedFrom, updatedTo);
            int totalPages = (int) Math.ceil((double) totalConfig / pageSize);

            // Prepare data to return as JSON
            HashMap<String, Object> data = new HashMap<>();
            Gson gson = new Gson();
            String jsonn = gson.toJson(configList);
            data.put("totalAccount", totalConfig);
            data.put("totalPages", totalPages);
            data.put("configList", jsonn);

            JSONObject json = new JSONObject(data);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(json);
         } catch (ParseException ex) {
            Logger.getLogger(DebtsListServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

   

}
