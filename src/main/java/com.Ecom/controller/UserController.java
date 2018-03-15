package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.mapper.ShopMapper;
import com.Ecom.mapper.UserMapper;
import com.Ecom.model.Address;
import com.Ecom.model.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {

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
            ShopMapper shopMapper=session.getMapper(ShopMapper.class);
            int shops=shopMapper.checkShopExist(email);
            List<Address> addressList=mapper.showAllAddress(email);
            session.close();
            map.put("Message",LoginMessage);
            request.getSession().setAttribute("user",user);
            request.getSession().setAttribute("shops",shops);
            request.getSession().setAttribute("addressList",addressList);
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
        return new ModelAndView("redirect:/Home/home.jsp",map);
    }

    @RequestMapping(value="ModifySelfInfo",method = RequestMethod.POST)
    public ModelAndView ModifySelfInfo(@ModelAttribute User model, HttpServletResponse response, ModelMap map, HttpServletRequest request) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);

        UserMapper mapper = session.getMapper(UserMapper.class);
        int i=mapper.updateUserInfo(model);
        session.commit();
        request.getSession().setAttribute("user",model);
        session.close();

        if(i>0)
            map.put("ModifySelfInfoMessage","Update Info Successfully!");
        else
            map.put("ModifySelfInfoMessage","Update Info Failed!");
        ModelAndView mv = new ModelAndView();
        return new ModelAndView("redirect:/User/ModifySelfInfo.jsp",map);
    }

    @RequestMapping(value="ModifySelfPwd",method = RequestMethod.POST)
    public ModelAndView ModifySelfPwd(HttpServletResponse response, @RequestParam("newPwd") String newPwd,
                                       @RequestParam("oldPwd") String oldPwd, ModelMap map,HttpServletRequest request) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");

        System.out.println(user.getPassword());

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

    @RequestMapping(value = "ModifySelfAddress",method = RequestMethod.POST)
    public ModelAndView ModifySelfAddress(@ModelAttribute Address address,HttpServletResponse response,HttpServletRequest request,ModelMap map) throws IOException
    {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");
        address.setEmail(user.getEmail());
        int i=mapper.insertAddress(address);
        if(i>0) {
            map.put("Message", "Add Address Successfully!");
            List<Address> addressList=mapper.showAllAddress(user.getEmail());
            map.addAttribute("addressList",addressList);
            session.commit();
            session.close();
        }
        else
            map.put("Message","Add Address Failed!");
        return new ModelAndView("redirect:/User/ModifySelfAddress.jsp",map);
    }
}
