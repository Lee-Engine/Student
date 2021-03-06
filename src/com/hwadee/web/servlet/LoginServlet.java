package com.hwadee.web.servlet;

import com.hwadee.model.UserInfo;
import com.hwadee.service.impl.LoginService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


/**
 * @Author xuiexizhang
 * @Description
 * @Date Create in 9:50 2020/7/18
 */

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        //获取数据
        HttpSession session = request.getSession();
        String code = request.getParameter("code");
        System.out.println("code" + code);
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String scode = (String) session.getAttribute("CHECKCODE_SERVER");
        //判断验证码是否正确
        //不区分大小写
        if(code == null || !code.equalsIgnoreCase(scode)){
            out.println("验证码错误请重新输入");
            response.setHeader("refresh", "5,url="+request.getContextPath()+"/login/signin.jsp");
            return;
        }
        //user传个service层
        LoginService service=new LoginService();
        UserInfo user=null;
        try {
            user=service.login(username, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if(user!=null){
            //登录成功
            //将登录的用户的user对象存到session中
            String autoLogin=request.getParameter("autoLogin");
            session.setAttribute("user", user);//左边为名字，右边为值
            //管理员学生管理页面
            if("admin".equals(user.getLevel() )){
                response.sendRedirect(request.getContextPath()+"/admin/admin_index.jsp");
            }
            //学生选课界面
            if("stu".equals(user.getLevel())){
                response.sendRedirect(request.getContextPath()+"/student/student_index.jsp");
            }

        }else{
            //登录失败
            System.out.println("登入失败");
            request.getRequestDispatcher("/login/false.jsp").forward(request, response);
        }


    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}