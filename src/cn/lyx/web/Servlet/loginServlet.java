package cn.lyx.web.Servlet;

import cn.lyx.domain.User;
import cn.lyx.service.UserService;
import cn.lyx.service.impl.UserServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.设置编码
        request.setCharacterEncoding("utf-8");
        //2.获取数据
        //2.1获取用户填写的验证码
        String verifycode = request.getParameter("verifycode");
        HttpSession session = request.getSession();
        String checkcode_server =(String) session.getAttribute("CHECKCODE_SERVER");
        session.removeAttribute("CHECKCODE_SERVER");
        //3.验证码校验
        if (!checkcode_server.equalsIgnoreCase(verifycode)){
            //代表验证码不知道
            //提示用户
            request.setAttribute("login_msg","验证码错误");
            //跳转到登录页面
            request.getRequestDispatcher("/login.jsp").forward(request,response);
            return;
        }
        Map<String, String[]> parameterMap = request.getParameterMap();
        //4.封装User对象
        User user = new User();
        try {
            BeanUtils.populate(user,parameterMap);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        //5.调用service查询
        UserService us = new UserServiceImpl();
        User loginUser = us.login(user);
        //6.判断是否登录成功
        if (loginUser != null){
            //登录成功
            //将用户存入session
            session.setAttribute("loginUser",loginUser);
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }else{
            request.setAttribute("login_msg","密码错误");
            //跳转到登录页面
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
