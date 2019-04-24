package cn.lyx.web.Servlet;

import cn.lyx.domain.User;
import cn.lyx.service.UserService;
import cn.lyx.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updUserServlet")
public class updUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置编码
        request.setCharacterEncoding("utf-8");
        //获取id
        String id = request.getParameter("id");
        //创建UserService
        UserService us = new UserServiceImpl();
        User user = us.updUser(id);
        //将user存入到request中
        request.setAttribute("user",user);
        //转发a
        request.getRequestDispatcher("/update.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
