package com.Ecom.controller;

import com.Ecom.dao.UserMapper;
import com.Ecom.model.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

@Controller
public class RegisterController {

    @RequestMapping(value="register",method= RequestMethod.POST)
    public ModelAndView register(@ModelAttribute User user, HttpServletResponse response, ModelMap map) throws IOException {
            response.setContentType("text/html;charset=utf-8");
            InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
            SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            SqlSession session = sqlSessionFactory.openSession(true);

            UserMapper mapper = session.getMapper(UserMapper.class);
            mapper.register(user);

            session.close();
            ModelAndView mv = new ModelAndView();
            map.put("Message","Register Successfully!");
            return new ModelAndView("redirect:/Home/home.jsp",map);
    }
}
