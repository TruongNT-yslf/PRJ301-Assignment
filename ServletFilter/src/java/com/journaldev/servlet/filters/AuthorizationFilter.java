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
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@WebFilter("/*")
public class AuthorizationFilter implements Filter {

    private Set<String> allowedPaths = new HashSet<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext context = filterConfig.getServletContext();
        String filePath = context.getRealPath("/WEB-INF/allow_access.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println("Allowed path: " + line);
                // Add each allowed path to a list or set to use in the filter logic
                allowedPaths.add(line);
                
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Lấy đường dẫn yêu cầu
        String path = req.getRequestURI().substring(req.getContextPath().length());
        System.out.println(path);
        // Kiểm tra nếu đường dẫn có trong danh sách cho phép
        if (!allowedPaths.contains( path)) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
            return;
        }

        // Chuyển tiếp yêu cầu đến filter/servlet tiếp theo trong chuỗi
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        allowedPaths.clear();
    }
}
