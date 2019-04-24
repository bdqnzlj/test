package cn.lyx.web.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.List;

@WebFilter("/*")
public class SensitiveWordsFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        //1.创建代理对象,增强getParameter方法
        ServletRequest pxy_req = (ServletRequest)Proxy.newProxyInstance(req.getClass().getClassLoader(), req.getClass().getInterfaces(), new InvocationHandler() {
            @Override
            public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                //增强getParameter方法
                //判断是否是getParameter方法
                if (method.getName().equals("getParameter")){
                    String value = (String)method.invoke(req,args);
                    if (value != null){
                        for (String o : list) {
                            if (value.contains(o)){
                                value = value.replaceAll(o,"***");
                            }
                        }
                    }
                    return value;
                }
                return method.invoke(req,args);
            }
        });
        //放行
        chain.doFilter(pxy_req, resp);
    }
    //创建用来存储敏感字符的集合
    private List<String> list = new ArrayList<>();
    public void init(FilterConfig config){
        BufferedReader br= null;
        try {
            //创建ServletContext对象
            ServletContext sc = config.getServletContext();
            String realPath = sc.getRealPath("/WEB-INF/classes/敏感词汇.txt");
            //创建字符输入流
            br = new BufferedReader(new FileReader(realPath));
            //将读取的每一行数据添加到集合里面去
            String line = null;
            while ((line = br.readLine())!=null){
                list.add(line);
            }
            System.out.println(list);
        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            try {
                br.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

}
