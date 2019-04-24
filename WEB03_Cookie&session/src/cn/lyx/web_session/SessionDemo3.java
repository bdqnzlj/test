package cn.lyx.web_session;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/sessionDemo3")
public class SessionDemo3 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取session对象
        HttpSession session = request.getSession();
        System.out.println(session);
        //创建Cookie对象
        Cookie ck = new Cookie("JSESSIONID",session.getId());
        //设置cookie存活时间
        ck.setMaxAge(60*60);
        response.addCookie(ck);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
