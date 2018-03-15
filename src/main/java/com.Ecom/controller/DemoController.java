package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.mapper.UserMapper;
import com.Ecom.model.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class DemoController {
    @RequestMapping(value="delete",method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView update(@RequestParam("email") String email, HttpServletResponse response, ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        int i=mapper.deleteUser(email);
        session.close();

        ModelAndView mv = new ModelAndView();
        if(i==1)
            map.put("Message", "Delete Successfully!");
        else
            map.put("Message", "Delete Failed!");
        return new ModelAndView("redirect:index.jsp", map);
    }

    @RequestMapping(value="update",method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView update(@ModelAttribute User user, HttpServletResponse response, ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        int i=mapper.updateUserInfo(user);
        session.close();

        ModelAndView mv = new ModelAndView();

        if(i==1)
            map.put("Message", "Update Successfully!");
        else
            map.put("Message", "Update Failed!");

        return new ModelAndView("redirect:index.jsp", map);
    }

    @RequestMapping(value="show",method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView show(@ModelAttribute User user, HttpServletResponse response) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);

        UserMapper mapper = session.getMapper(UserMapper.class);
        List<User> users=mapper.showAll();

        session.close();
        return new ModelAndView("show","UserList",users);
    }

}
