/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import com.google.gson.Gson;
import dal.DebtDao;
import dal.DebtDetailDao;
import entities.Debt;
import entities.DebtDetail;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
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
public class DebtDetailsListServlet extends HttpServlet {

  private DebtDetailDao debtDetailDao;
  private DebtDao debtDao;

    public void init() {
        debtDetailDao = new DebtDetailDao();
        debtDao = new DebtDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            long id = Long.parseLong(request.getParameter("id"));
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            String sortField = request.getParameter("sortField");
            String sortOrder = request.getParameter("sortOrder");
             String idFrom = request.getParameter("idFrom");
            String idTo = request.getParameter("idTo");
            String filterNote = request.getParameter("filterNote");
            String amountFrom = request.getParameter("amountFrom");
            String amountTo = request.getParameter("amountTo");
            String debtCreatedFrom = request.getParameter("debtCreatedFrom");
            String debtCreatedTo = request.getParameter("debtCreatedTo");
            String createdFrom = request.getParameter("createdFrom");
            String createdTo = request.getParameter("createdTo");
            String debtType = request.getParameter("debtType");
            
            SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            if (!createdFrom.isEmpty()) {
                createdFrom = dateFormat.format(originalFormat.parse(createdFrom));
            }

            if (!createdTo.isEmpty()) {
                createdTo = dateFormat.format(originalFormat.parse(createdTo));
            }
            if (!debtCreatedFrom.isEmpty()) {
                debtCreatedFrom = dateFormat.format(originalFormat.parse(debtCreatedFrom));
            }
            if (!debtCreatedTo.isEmpty()) {
                debtCreatedTo = dateFormat.format(originalFormat.parse(debtCreatedTo));
            }
            int index = (page - 1) * pageSize;
            List<DebtDetail> debtDetails = debtDetailDao.getDebtDetails(id, 
                    index, pageSize, sortField,sortOrder, idFrom, idTo,  filterNote,
             debtType,  amountFrom,  amountTo,
             debtCreatedFrom, debtCreatedTo, createdFrom,  createdTo);
            long totalDebts;
            totalDebts = debtDetailDao.countDebtDetails(id,idFrom, idTo,  filterNote,
             debtType,  amountFrom,  amountTo,
             debtCreatedFrom, debtCreatedTo, createdFrom,  createdTo);
            int totalPages = (int) Math.ceil((double) totalDebts / pageSize);
            Debt debt= debtDao.getDebtByID(id);
            // trả về kết quả dưới dạng JSON
            HashMap<String, Object> data = new HashMap<>();
            Gson gson = new Gson();
            String jsonn = gson.toJson(debtDetails);
            data.put("totalDebtDetails", totalDebts);
            data.put("totalPages", totalPages);
            data.put("debtDetails", jsonn);
            data.put("debtName",debt.getName());
            data.put("debtTotal",debt.getTotalDebt());

            JSONObject json = new JSONObject(data);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(json);
             } catch (ParseException ex) {
            Logger.getLogger(DebtsListServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

}
