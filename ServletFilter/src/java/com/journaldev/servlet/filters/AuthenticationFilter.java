package com.journaldev.servlet.filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter("/auth/*")
public class AuthenticationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        // Bỏ qua trang /login
        String path = httpRequest.getRequestURI().substring(httpRequest.getContextPath().length());
        if ("/login".equals(path)) {
            chain.doFilter(request, response);
            return;
        }

        boolean isAuthenticated = false;
        if (session != null) {
            // Kiểm tra xem user đã đăng nhập chưa
            Object user = session.getAttribute("user");
            isAuthenticated = (user != null);
        }

        if (isAuthenticated) {
            chain.doFilter(request, response);
        } else {
            // Chuyển hướng về trang login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        }
    }

    @Override
    public void destroy() {
        //close any resources here
    }
}
