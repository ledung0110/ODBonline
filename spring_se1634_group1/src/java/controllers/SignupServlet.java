package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import dal.AccountDao;
import dal.TokenDao;
import utilities.ConfigManagement;
import utilities.GlobalConstants;
import utilities.EmailSystem;
import utilities.TokenGenerator;

@WebServlet(urlPatterns = {"/signup"})
public class SignupServlet extends HttpServlet {

    EmailSystem emailSystem = new EmailSystem();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("signUp.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String email = request.getParameter("email").trim();

        HashMap<String, Object> data = new HashMap<>();
        data.put("username", username);
        data.put("expiry", new Date().getTime() + 1000 * 60 * 30);
        String token = TokenGenerator.generate(data, ConfigManagement.getInstance().getConfigValue("GLOBAL_GENERATE_KEY") );
        String text = "Please access the following link to confirm your password: \nhttp://" + ConfigManagement.getInstance().getConfigValue("HOST") + "/verifyacc?token=" + token;
        new TokenDao().addToken(token);
        emailSystem.sendEmail("ODB (No-Reply", email, "[ODB] Verify Account", text);
        new AccountDao().createAccount(username, password, email);
        response.sendRedirect(".");

    }
}
