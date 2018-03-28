package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.mapper.ProductMapper;
import com.Ecom.mapper.ShopMapper;
import com.Ecom.model.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
public class HomeController {

    @RequestMapping(value = "ShowProducts",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView ShowProducts(HttpServletRequest request, HttpServletResponse response) throws Exception{
        SqlSession sqlSession= MySqlSession.getMySession(response);
        ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);
        ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);

        //获取所有在售商品
        List<Product> productList = productMapper.getProductList();
        request.getSession().setAttribute("productListAll",productList);

        return new ModelAndView("redirect:/Home/home.jsp");
    }
}
