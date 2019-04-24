package cn.lyx.web.Cookie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CookieDemo2")
public class CookieDemo2 extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取Cookie,拿到数据
        Cookie[] cookies = request.getCookies();
        //判断Cookie对象,不为空就进行数据获取
        if (cookies != null) {
            //获取数据,遍历Cookie对象
            for (Cookie ck :
                    cookies) {
                String name = ck.getName();
                String value = ck.getValue();
                System.out.println(name + "=" + value);
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
