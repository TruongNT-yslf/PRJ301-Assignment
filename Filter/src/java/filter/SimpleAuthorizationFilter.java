/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

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

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
@WebFilter("/*")
public class SimpleAuthorizationFilter implements Filter {

    private Set<String> allowedPaths = new HashSet<>();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        ServletContext context = filterConfig.getServletContext();
        String filePath = context.getRealPath("/WEB-INF/allowed_access.txt");

        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                allowedPaths.add(line.trim());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) sr;
        HttpServletResponse res = (HttpServletResponse) sr1;

        // Lấy đường dẫn yêu cầu
        String path = req.getRequestURI().substring(req.getContextPath().length());
        System.out.println("Requested path: " + path);

        // Kiểm tra nếu đường dẫn có trong danh sách cho phép
        if (!allowedPaths.contains(path)) {
            res.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied to " + req.getServletPath());
            return;
        }

        // Chuyển tiếp yêu cầu đến filter/servlet tiếp theo trong chuỗi
        fc.doFilter(sr, sr1);
    }

    @Override
    public void destroy() {
        // Dọn dẹp nếu cần
        allowedPaths.clear();
    }

}
