/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author TruongNTHE186777 <truongthuankhiet@gmail.com>
 */
@WebFilter("/auth/*")
public class SimpleAuthenticationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) sr1;
        httpResponse.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied to /auth/*");

    }

}
