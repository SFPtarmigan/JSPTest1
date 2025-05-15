package hx.util;
import jakarta.servlet.*;

public class Pfilter implements jakarta.servlet.Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, java.io.IOException {
        request.setCharacterEncoding("UTF-8");
        //response.setContentType("text/html;charset=UTF-8");
        chain.doFilter(request, response);
    }
}
