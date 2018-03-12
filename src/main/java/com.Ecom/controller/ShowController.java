package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.dao.UserMapper;
import com.Ecom.model.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class ShowController {
    @RequestMapping(value="show",method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView show(@ModelAttribute User user, HttpServletResponse response) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);

        UserMapper mapper = session.getMapper(UserMapper.class);
        List<User> users=mapper.showAll();

        session.close();
        return new ModelAndView("show","UserList",users);
    }
}
