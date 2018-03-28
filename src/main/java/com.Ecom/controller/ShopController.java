package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.dao.UploadImageHelper;
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
import org.springframework.web.bind.annotation.*;
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
    public ModelAndView ShopRegister(HttpServletResponse response,
                                     HttpServletRequest request,ModelMap map) throws IOException {
        try{
            SqlSession session= MySqlSession.getMySession(response);
            ShopMapper mapper = session.getMapper(ShopMapper.class);
            Shop shop = new Shop();

            byte[] imgByte = UploadImageHelper.addProductPicture(request);

            String email = UploadImageHelper.itemlist.get(0).get("email").toString();
            String shopName = UploadImageHelper.itemlist.get(1).get("shop_name").toString();
            int type = Integer.parseInt(UploadImageHelper.itemlist.get(2).get("type").toString());
            String description = UploadImageHelper.itemlist.get(3).get("description").toString();

            //没有使用imgByte来检测，防止选中company添加文件之后，再选择个人
            if (type == 1){
                shop.setBusiness_license(imgByte);
            }

            shop.setEmail(email);
            shop.setShop_name(shopName);
            shop.setType(type);
            shop.setDescription(description);

            //获取当前系统时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String Establish_date=df.format(date).toString();
            shop.setEstablish_date(Establish_date);
            shop.setStatus(0);//设置店铺状态为待审核


            //通过SQL语句的返回值，判断是否插入成功
            int result = mapper.registerShop(shop);
            if(result>0) {
                request.getSession().setAttribute("shopInfo",shop);
                map.put("ShopRegisterMessage", "Shop Register Successfully!");
            }
            else
                map.put("ShopRegisterMessage","Shop Register Failed!");
            //确认执行，没有commit这一句，数据库不会更新
            session.commit();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
        }

        return new ModelAndView("redirect:/Shop/ShopIndex.jsp",map);
    }

    @RequestMapping(value = "ShopApprove/{shop_id}", method = RequestMethod.POST)
    public ModelAndView ShopCheck(@PathVariable int shop_id, HttpServletResponse response, HttpServletRequest request, ModelMap map) throws IOException{
        SqlSession sqlSession= MySqlSession.getMySession(response);
        ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);

        int result = shopMapper.approveShop(shop_id);
        if (result > 0){
            map.put("Message", "Approve Success!");
        }else {
            map.put("Message", "Approve Failed!");
        }
        sqlSession.commit();
        sqlSession.close();

        return new ModelAndView("redirect:/Admin/Check.jsp",map);
    }

    @RequestMapping(value = "ShopDisapprove/{shop_id}", method = RequestMethod.POST)
    public ModelAndView ShopCheck(@PathVariable int shop_id, HttpServletResponse response,  ModelMap map) throws IOException{
        SqlSession sqlSession= MySqlSession.getMySession(response);
        ShopMapper shopMapper = sqlSession.getMapper(ShopMapper.class);

        int result = shopMapper.disapproveShop(shop_id);
        if (result > 0){
            map.put("Message", "Disapprove Success!");
        }else {
            map.put("Message", "Disapprove Failed!");
        }
        sqlSession.commit();
        sqlSession.close();

        return new ModelAndView("redirect:/Admin/Check.jsp",map);
    }
}
