package cn.lyx.web_servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/*
    验证码案例
 */
@SuppressWarnings("all")
@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //定义宽高
        int width=100;
        int heigth=50;
        //1.创建对象,在内存中加载图(验证码图片对象)
        BufferedImage bfi = new BufferedImage(width,heigth,BufferedImage.TYPE_INT_RGB);
        //2.美化图片
        Graphics gp = bfi.getGraphics();//画笔对象
        //2.1设置背景颜色
        gp.setColor(Color.pink);
        gp.fillRect(0,0,width,heigth);

        //2.2设置边框颜色
        gp.setColor(Color.blue);
        gp.drawRect(0,0,width-1,heigth-1);
        //2.3设置随机验证码
        String str = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789";
        //随机验证码
        Random ran = new Random();
        StringBuilder sb = new StringBuilder();
        for (int j = 1; j <=4 ; j++) {
            int i = ran.nextInt(str.length());
            char c = str.charAt(i);
            sb.append(c);
            gp.drawString(c+"",width/5*j,heigth/2);
        }
        String s = sb.toString();
        //使用session共享数据
        req.getSession().setAttribute("s",s);
        //2.4画干扰线
        gp.setColor(Color.green);
        //随机生成干扰线
        for (int i = 0; i < 10 ; i++) {
            int x1 = ran.nextInt(width);
            int x2 = ran.nextInt(width);

            int y1 = ran.nextInt(heigth);
            int y2 = ran.nextInt(heigth);

            gp.drawLine(x1,x2,y1,y2);
        }
        //3.将图片输出到页面展示
        ImageIO.write(bfi,"jpg",resp.getOutputStream());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
