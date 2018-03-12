package com.Ecom.controller;

import com.Ecom.dao.UserMapper;
import com.Ecom.model.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@Controller
public class LoginController {

    @RequestMapping(value="login",method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password,
                              HttpServletResponse response, ModelMap map, HttpServletRequest request) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();

        User user=new User();
        user.setEmail(email);
        user.setPassword(password);

        UserMapper mapper = session.getMapper(UserMapper.class);
        User checkUser =mapper.checkLogin(user);

        String LoginMessage=null;
        PrintWriter out = response.getWriter();

        User thisUser=new User();
        if(checkUser!=null)
        {
            LoginMessage="Login Successfully!";
            thisUser=mapper.showDetails(email);
            session.close();
            map.put("Message",LoginMessage);
//            map.put("user",thisUser);
            request.getSession().setAttribute("user",thisUser);
            //设置跳转路径为不在WEB-INF目录下的jsp文件
            return new ModelAndView("redirect:/Home/home.jsp","map",map);
        }
        else
        {
            session.close();
            LoginMessage="Login Failed!";
            map.put("Message",LoginMessage);
            //设置跳转路径为不在WEB-INF目录下的jsp文件
            return new ModelAndView("redirect:/Home/home.jsp",map);
        }
    }
}
