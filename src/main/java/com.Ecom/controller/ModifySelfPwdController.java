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
public class ModifySelfPwdController {

    @RequestMapping(value="ModifySelfPwd",method = RequestMethod.POST)
    public ModelAndView ModifySelfInfo(HttpServletResponse response, @RequestParam("newPwd") String newPwd,
                                       @RequestParam("oldPwd") String oldPwd, ModelMap map,HttpServletRequest request) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");

        if(oldPwd.equals(user.getPassword())) {
            int i=mapper.updatePwd(newPwd,user.getEmail(),oldPwd);
            session.commit();
            session.close();
            if(i>0) {
                map.put("ModifySelfPwdMessage", "Update Password Successfully!");
                user.setPassword(newPwd);
            }
            else
                map.put("ModifySelfPwdMessage","Update Password Failed!");
        }
        else
            map.put("ModifySelfPwdMessage","Wrong old password!");
        return new ModelAndView("redirect:/User/ModifySelfPwd.jsp",map);
    }
}
