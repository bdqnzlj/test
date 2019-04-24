package cn.lyx.web_servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            //1.设置编码表
            request.setCharacterEncoding("utf-8");
            //2.获取参数
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String checkCode = request.getParameter("checkCode");
            //3.先获取生成的验证码
            HttpSession session = request.getSession();
            String s = (String)session.getAttribute("s");
            //删除之前存储的验证码
            request.removeAttribute(s);
            //3.1判断验证码是否正确
            if (s != null && s.equalsIgnoreCase(checkCode)){
                //再次判断账号和密码是否错误
                if ("lisi".equals(username) && "123".equals(password)){
                    //登录成功
                    //存储信息,存储用户信息
                    session.setAttribute("user",username);
                    //使用重定向跳转到另外一个页面
                    response.sendRedirect(request.getContextPath()+"/success.jsp");
                }else{
                    //登录失败
                    //存储信息到request
                    request.setAttribute("login_error","用户名或密码错误");
                    //转发到登录页面
                    request.getRequestDispatcher("/login.jsp").forward(request,response);
                }
            }else{
                //验证码错误
                //存储信息到request
                request.setAttribute("cc_error","验证码错误");
                //转发到登录页面
                request.getRequestDispatcher("/login.jsp").forward(request,response);
            }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
