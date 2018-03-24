package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.mapper.ProductMapper;
import com.Ecom.mapper.UserMapper;
import com.Ecom.model.ProductProperty;
import com.Ecom.model.ShoppingCart;
import com.Ecom.model.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderController {
    @RequestMapping(value="SettleAccount",method= RequestMethod.POST)
    public ModelAndView SettleAccount(HttpServletResponse response, HttpServletRequest request, ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper userMapper = session.getMapper(UserMapper.class);


//        if(result>0) {
//
//            map.put("Message", "Add product to cart Successfully!");
//        }
//        else
//            map.put("Message","Add product to cart Failed!");
//
//        session.commit();
//        session.close();
        return new ModelAndView("redirect:/Shop/ProductInfo.jsp",map);
    }
}
