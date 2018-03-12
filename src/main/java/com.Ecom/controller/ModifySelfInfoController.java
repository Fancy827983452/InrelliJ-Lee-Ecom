package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class ModifySelfInfoController {
    @RequestMapping(value="/ModifySelfInfo",method = RequestMethod.POST)
    public ModelAndView ModifySelfInfo(HttpServletResponse response) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        return new ModelAndView();
    }
}
