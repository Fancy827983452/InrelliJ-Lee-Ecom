package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.mapper.UserMapper;
import com.Ecom.model.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class LoginController {

    @RequestMapping(value="login",method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password,
                              HttpServletResponse response, ModelMap map, HttpServletRequest request) throws IOException {

        SqlSession session=MySqlSession.getMySession(response);

        User user=new User();
        user.setEmail(email);
        user.setPassword(password);

        UserMapper mapper = session.getMapper(UserMapper.class);
        User checkUser =mapper.checkLogin(user);

        String LoginMessage=null;

        if(checkUser!=null)
        {
            LoginMessage="Login Successfully!";
            user=mapper.selectUser(email);
            session.close();
            map.put("Message",LoginMessage);
            request.getSession().setAttribute("user",user);
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
