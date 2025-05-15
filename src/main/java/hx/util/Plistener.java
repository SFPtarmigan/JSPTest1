package hx.util;
import jakarta.servlet.*;
public class Plistener implements jakarta.servlet.ServletContextListener {
    public void ServletContextInitialized(ServletContextEvent event) {
        ServletContext context = event.getServletContext();
        String path = context.getRealPath("/");
        context.setAttribute("path", path);
        System.out.println("path:"+path);
    }

}
