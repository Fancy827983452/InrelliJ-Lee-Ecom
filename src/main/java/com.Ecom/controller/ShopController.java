package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.mapper.ProductMapper;
import com.Ecom.mapper.ShopMapper;
import com.Ecom.mapper.UserMapper;
import com.Ecom.model.ProductProperty;
import com.Ecom.model.Shop;
import com.Ecom.model.ShoppingCart;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ShopController {
    @RequestMapping(value="ShopRegister",method= RequestMethod.POST)
    public ModelAndView ShopRegister(@ModelAttribute Shop shopModel, HttpServletResponse response,
                                     HttpServletRequest request,ModelMap map) throws IOException {

        SqlSession session= MySqlSession.getMySession(response);
        ShopMapper mapper = session.getMapper(ShopMapper.class);

        //获取当前系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String Establish_date=df.format(date).toString();
        shopModel.setEstablish_date(Establish_date);
        shopModel.setStatus(0);//设置店铺状态为待审核
        int i=mapper.registerShop(shopModel);

        if(i>0) {
            request.getSession().setAttribute("shopInfo",shopModel);
            map.put("ShopRegisterMessage", "Shop Register Successfully!");
        }
        else
            map.put("ShopRegisterMessage","Shop Register Failed!");

        session.commit();
        session.close();

        return new ModelAndView("redirect:/Shop/ShopIndex.jsp",map);
    }
}
