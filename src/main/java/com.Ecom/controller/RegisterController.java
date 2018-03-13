package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.dao.UserMapper;
import com.Ecom.model.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class RegisterController {

    @RequestMapping(value="register",method= RequestMethod.POST)
    public ModelAndView register(@ModelAttribute User user, HttpServletResponse response, ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        int i=mapper.register(user);
        session.commit();
        session.close();

        if(i>0)
            map.put("Message","Register Successfully!");
        else
            map.put("Message","Register Failed!");
        ModelAndView mv = new ModelAndView();
        return new ModelAndView("redirect:/Home/home.jsp",map);
    }
}
