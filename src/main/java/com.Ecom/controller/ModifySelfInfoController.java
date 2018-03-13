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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class ModifySelfInfoController {
    @RequestMapping(value="ModifySelfInfo",method = RequestMethod.POST)
    public ModelAndView ModifySelfInfo(@ModelAttribute User model, HttpServletResponse response, ModelMap map, HttpServletRequest request) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);

        UserMapper mapper = session.getMapper(UserMapper.class);
        System.out.println("Name: "+model.getName());
        int i=mapper.updateUserInfo(model);
        session.commit();
        request.getSession().setAttribute("user",model);
        session.close();

        System.out.println("i= "+i);
        if(i>0)
            map.put("ModifySelfInfoMessage","Update Info Successfully!");
        else
            map.put("ModifySelfInfoMessage","Update Info Failed!");
        ModelAndView mv = new ModelAndView();
        return new ModelAndView("redirect:/User/ModifySelfInfo.jsp",map);
    }
}
