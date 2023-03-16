/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
 */
package security;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

/**
 *
 * @author nvash
 */

public class AuthenticationFilter implements jakarta.servlet.Filter {

  

    @Override
    public void doFilter(jakarta.servlet.ServletRequest req, jakarta.servlet.ServletResponse res, jakarta.servlet.FilterChain chain) throws IOException, jakarta.servlet.ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String loginURI = request.getContextPath() + "/login";
        String authURI = request.getContextPath() + "/checkauth";
        String signUpURI = request.getContextPath() + "/signup";

        boolean isLoggedIn = (session != null && session.getAttribute("username") != null);
        boolean isLoginRequest = request.getRequestURI().equals(loginURI);
        boolean isAuthRequest = request.getRequestURI().equals(authURI);
        boolean isSignupRequest = request.getRequestURI().equals(signUpURI);
        boolean isForgotPasswordRequest = request.getRequestURI().equals(request.getContextPath() + "/forgot");
      
        boolean isCheckAccRequest = request.getRequestURI().equals(request.getContextPath() + "/checkAccountName");
        boolean isCheckCaptcha = request.getRequestURI().equals(request.getContextPath() + "/checkCaptcha");
         boolean isVerifyAcc = request.getRequestURI().equals(request.getContextPath() + "/verifyacc");
         boolean isReset = request.getRequestURI().equals(request.getContextPath() + "/reset");
          boolean isCssRequest = request.getRequestURI().endsWith(".css");
          boolean isJsRequest = request.getRequestURI().endsWith(".js");
           boolean is403 = request.getRequestURI().equals(request.getContextPath() + "/error403");
        if (isLoggedIn && (isLoginRequest || isAuthRequest || isSignupRequest|| isForgotPasswordRequest || isCheckAccRequest|| isCheckCaptcha|| isVerifyAcc || isReset)) {
            // Nếu đã đăng nhập và yêu cầu đăng nhập lại hoặc đang ở trang đăng nhập, chuyển tiếp đến trang chính
            response.sendRedirect("home");
        } else if ((isLoggedIn || isLoginRequest  || isAuthRequest 
                || isSignupRequest|| isForgotPasswordRequest ||
                isCheckAccRequest|| isCheckCaptcha|| isVerifyAcc || isReset || isCssRequest ||isJsRequest|| is403)) {
            
            chain.doFilter(request, response);
        } else {
            // Nếu không đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect(loginURI);
        }
    }

  

   
  

}