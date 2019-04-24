package cn.lyx.web.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter("/*")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //强制转换
        HttpServletRequest request = (HttpServletRequest)req;
        //获取资源请求路径
        String requestURI = request.getRequestURI();
        //判断是否有关于登陆的资源路径
        if (requestURI.contains("/login.jsp") || requestURI.contains("/loginServlet") || requestURI.contains("/css/") || requestURI.contains("/js/") || requestURI.contains("/fonts/") || requestURI.contains("/checkCode")){
            //说明用户是通过登陆的
            //放行
            chain.doFilter(req, resp);
        }else{
            Object user = request.getSession().getAttribute("loginUser");
            if (user != null){
                //包含,说明用户是通过登陆的
                //放行
                chain.doFilter(req, resp);
            }else{
                request.setAttribute("login_msg","您尚未登陆,请先登录");
                request.getRequestDispatcher("/login.jsp").forward(request,resp);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
