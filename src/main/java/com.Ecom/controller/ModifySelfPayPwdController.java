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
public class ModifySelfPayPwdController {

    @RequestMapping(value="ModifySelfPayPwd",method = RequestMethod.POST)
    public ModelAndView ModifySelfPayPwd(HttpServletResponse response, @RequestParam("newpassword") String newPwd,
                                       @RequestParam("oldpayPassword") String oldPwd, ModelMap map,HttpServletRequest request) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");
        //如果没有设置过支付密码
        if(user.getPay_password()==0)
        {
            int i=mapper.setPayPwd(Integer.parseInt(newPwd),user.getEmail());
            session.commit();
            session.close();
            if(i>0) {
                map.put("ModifySelfPayPwdMessage", "Set Pay Password Successfully!");
                user.setPay_password(Integer.parseInt(newPwd));
            }
            else
                map.put("ModifySelfPayPwdMessage","Set Pay Password Failed!");
        }
        else{
            if(Integer.parseInt(oldPwd)==user.getPay_password()) {
                int i=mapper.updatePayPwd(Integer.parseInt(newPwd),user.getEmail(),Integer.parseInt(oldPwd));
                session.commit();
                session.close();
                if(i>0) {
                    map.put("ModifySelfPayPwdMessage", "Update Pay Password Successfully!");
                    user.setPay_password(Integer.parseInt(newPwd));
                }
                else
                    map.put("ModifySelfPayPwdMessage", "Update Pay Password Failed!");
            }
            else
                map.put("ModifySelfPayPwdMessage","Wrong old Pay password!");
        }
        return new ModelAndView("redirect:/User/ModifySelfPayPwd.jsp",map);
    }
}
