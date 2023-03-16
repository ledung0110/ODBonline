/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import com.google.gson.Gson;
import dal.AccountDao;
import dal.DebtDao;
import entities.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author nvash
 */
@WebServlet(name = "AccountManagerServlet", urlPatterns = {"/AccountManagerServlet"})
public class AccountManagerServlet extends HttpServlet {

    private DebtDao debtDao;

    public void init() {
        debtDao = new DebtDao();
    }

    protected void doGet(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {
        request.getRequestDispatcher("accountManager.jsp").forward(request, response);

    }

    protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws jakarta.servlet.ServletException, IOException {

        try {
            int page = Integer.parseInt(request.getParameter("page"));
            int pageSize = Integer.parseInt(request.getParameter("pageSize"));
            String sortField = request.getParameter("sortField");
            String sortOrder = request.getParameter("sortOrder");
            String idFrom = request.getParameter("idFrom");
            String idTo = request.getParameter("idTo");
            String isAdmin = request.getParameter("filterAccess");
            String isActive = request.getParameter("filterActive");
            String filterUserName = request.getParameter("filterUserName");
            AccountDao ad = new AccountDao();
            // tính toán số lượng bản ghi cần lấy
            int index = (page - 1) * pageSize;
            // lấy danh sách bản ghi theo filter
            List<Account> account = ad.getAllAccount(index, pageSize, sortField, sortOrder, idFrom, idTo, filterUserName, isAdmin, isActive);
            // tính toán tổng số trang
            long totalAccount;
            totalAccount = ad.countAccount(idFrom, idTo, filterUserName, isAdmin, isActive);
            int totalPages = (int) Math.ceil((double) totalAccount / pageSize);
            // trả về kết quả dưới dạng JSON
            HashMap<String, Object> data = new HashMap<>();
            Gson gson = new Gson();
            String jsonn = gson.toJson(account);
            data.put("totalAccount", totalAccount);
            data.put("totalPages", totalPages);
            data.put("account", jsonn);

            JSONObject json = new JSONObject(data);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(json);
        } catch (Exception ex) {
            Logger.getLogger(AccountManagerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
