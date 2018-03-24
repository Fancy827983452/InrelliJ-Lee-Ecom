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

    @RequestMapping(value="AddToCart",method= RequestMethod.POST)
    public ModelAndView AddToCart(@RequestParam("product_id") int product_id, @RequestParam("property_name") String property_name,
                                  HttpServletResponse response, HttpServletRequest request, ModelMap map) throws IOException {

        System.out.println("property_name="+property_name);

        SqlSession session= MySqlSession.getMySession(response);
        ShopMapper mapper = session.getMapper(ShopMapper.class);
        UserMapper userMapper = session.getMapper(UserMapper.class);
        ProductMapper productMapper=session.getMapper(ProductMapper.class);
        User user=(User)request.getSession().getAttribute("user");
        ShoppingCart shoppingCart=new ShoppingCart();
        shoppingCart.setEmail(user.getEmail());
        shoppingCart.setProduct_id(product_id);
        shoppingCart.setProperty_name(property_name);
        int i=mapper.addToCart(shoppingCart);

        if(i>0) {
            List<ShoppingCart> shoppingCartList=userMapper.getCart(user.getEmail());
            List<ProductProperty> productPropertyList=productMapper.getPropertiesById(product_id);
            request.getSession().setAttribute("shoppingCartList",shoppingCartList);
            map.put("product_id",product_id);
            map.put("size",productPropertyList.size());
            map.put("Message", "Add product to cart Successfully!");
        }
        else
            map.put("Message","Add product to cart Failed!");

        session.commit();
        session.close();

        return new ModelAndView("redirect:/Shop/ProductInfo.jsp",map);
    }
}
