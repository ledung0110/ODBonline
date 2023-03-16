/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import com.google.gson.Gson;
import dal.DebtDao;
import dal.UserDao;
import entities.Debt;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author nvash
 */
public class DebtsListServlet extends HttpServlet {

    private DebtDao debtDao;

    public void init() {
        debtDao = new DebtDao();
    }

    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
        request.getRequestDispatcher("debtList.jsp").forward(request, response);

    }

    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {

        try {
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            String sortField = request.getParameter("sortField");
            String sortOrder = request.getParameter("sortOrder");
            String idFrom = request.getParameter("idFrom");
            String idTo = request.getParameter("idTo");
            String filterName = request.getParameter("filterName");
            String filterAddress = request.getParameter("filterAddress");
            String filterPhone = request.getParameter("filterPhone");
            String filterEmail = request.getParameter("filterEmail");
            String totalFrom = request.getParameter("totalFrom");
            String totalTo = request.getParameter("totalTo");
            String createdFrom = request.getParameter("createdFrom");
            String createdTo = request.getParameter("createdTo");
            String updatedFrom = request.getParameter("updatedFrom");
            String updatedTo = request.getParameter("updatedTo");
            SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

            // tính toán số lượng bản ghi cần lấy
            int Index = (page - 1) * pageSize;
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
            HttpSession session = request.getSession();
            String username = (String) session.getAttribute("username");
            long userId = new UserDao().getUserByUsername(username).getId();
            // lấy danh sách bản ghi theo filter
            List<Debt> debts = debtDao.getDebts(userId, Index, pageSize, sortField,
                    sortOrder, idFrom, idTo, filterName, filterAddress, filterPhone, filterEmail,
                    totalFrom, totalTo, createdFrom, createdTo, updatedFrom, updatedTo);
            // tính toán tổng số trang
            long totalDebts;
            totalDebts = debtDao.countDebts(userId, idFrom, idTo, filterName, filterAddress, filterPhone, filterEmail,
                    totalFrom, totalTo, createdFrom, createdTo, updatedFrom, updatedTo);
            int totalPages = (int) Math.ceil((double) totalDebts / pageSize);
            // trả về kết quả dưới dạng JSON
            HashMap<String, Object> data = new HashMap<>();
            Gson gson = new Gson();
            String jsonn = gson.toJson(debts);
            data.put("totalDebts", totalDebts);
            data.put("totalPages", totalPages);
            data.put("debts", jsonn);
            data.put("date", createdFrom);

            JSONObject json = new JSONObject(data);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(json);
        } catch (ParseException ex) {
            Logger.getLogger(DebtsListServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
