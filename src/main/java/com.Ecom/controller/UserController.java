package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.dao.UploadImageHelper;
import com.Ecom.mapper.ProductMapper;
import com.Ecom.mapper.ShopMapper;
import com.Ecom.mapper.UserMapper;
import com.Ecom.model.Address;
import com.Ecom.model.ProductCategory;
import com.Ecom.model.Shop;
import com.Ecom.model.User;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.Ecom.model.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            Shop shopInfo=shopMapper.selectShop(email);
            List<Address> addressList=mapper.showAllAddress(email);
            ProductMapper productMapper = session.getMapper(ProductMapper.class);
            List<ProductCategory> categoryNames=null;
            List<Product> productList=null;
            if(shopInfo!=null) {
                int shop_id=shopMapper.selectShop(email).getShop_id();
                categoryNames = productMapper.getCategory(shop_id);//获取所有的分类名
                productList=productMapper.getProductList(shop_id);//获取所有商品
            }
            session.close();
            map.put("Message",LoginMessage);
            request.getSession().setAttribute("user",user);
            request.getSession().setAttribute("shopInfo",shopInfo);
            request.getSession().setAttribute("addressList",addressList);
            request.getSession().setAttribute("categoryNames",categoryNames);
            request.getSession().setAttribute("productList",productList);
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

    @RequestMapping(value = "AddSelfAddress",method = RequestMethod.POST)
    public ModelAndView AddSelfAddress(@ModelAttribute Address address,HttpServletResponse response,HttpServletRequest request,ModelMap map) throws IOException
    {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");
        address.setEmail(user.getEmail());
        int i=mapper.insertAddress(address);
        session.commit();
        List<Address> addressList=mapper.showAllAddress(user.getEmail());
        if(i>0) {
            map.put("Message", "Add Address Successfully!");
            request.getSession().setAttribute("addressList",addressList);
        }
        else
            map.put("Message","Add Address Failed!");
        session.close();
        return new ModelAndView("redirect:/User/ManageSelfAddress.jsp",map);
    }

    @RequestMapping(value = "ModifySelfAddress",method = RequestMethod.POST)
    public ModelAndView ModifySelfAddress(@RequestParam("receiver_name") String receiver_name,@RequestParam("address") String address,
            @RequestParam("phone") String phone,@RequestParam("zip_code") int zip_code,@RequestParam("address_id") String address_id,
            HttpServletResponse response,HttpServletRequest request,ModelMap map) throws IOException{
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);

        Address address1=new Address();
        User user =(User)request.getSession().getAttribute("user");
        address1.setEmail(user.getEmail());
        address1.setReceiver_name(receiver_name);
        address1.setAddress(address);
        address1.setPhone(phone);
        address1.setZip_code(zip_code);
        address1.setAddress_id(Integer.parseInt(address_id));

        int i=mapper.updateAddress(address1);
        session.commit();
        if(i>0) {
            List<Address> addressList=mapper.showAllAddress(address1.getEmail());
            map.put("Message", "Modify Address Successfully!");
            request.getSession().setAttribute("addressList",addressList);
        }
        else
        {
            map.put("Message", "Modify Address Failed!");
        }
        session.close();
        return new ModelAndView("redirect:/User/ManageSelfAddress.jsp",map);
    }

    @RequestMapping(value = "getSelectedSelfAddress",method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView getSelectedSelfAddress(@RequestParam("check") String id,HttpServletResponse response,HttpServletRequest request,ModelMap map) throws IOException
    {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);

        //根据ID获取数据表中这条ID的整条记录
        Address address1=mapper.selectAddressByID(Integer.parseInt(id));
        request.getSession().setAttribute("address1",address1);
        session.close();

        map.put("address_id",id);
        return new ModelAndView("redirect:/User/ModifySelfAddress.jsp",map);
    }

    @RequestMapping(value = "deleteSelectedSelfAddress",method = RequestMethod.POST)
    public ModelAndView deleteSelectedSelfAddress(@RequestParam("address_id") String address_id,HttpServletResponse response,
                                                  HttpServletRequest request,ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");
        int i=mapper.deleteAddress(Integer.parseInt(address_id));
        session.commit();
        if(i>0) {
            List<Address> addressList=mapper.showAllAddress(user.getEmail());
            map.put("Message", "Delete Address Successfully!");
            request.getSession().setAttribute("addressList",addressList);
        }
        else
        {
            map.put("Message", "Delete Address Failed!");
        }
        session.close();
        return new ModelAndView("redirect:/User/ManageSelfAddress.jsp",map);
    }

    @RequestMapping(value = "SetDefaultSelfAddress",method = RequestMethod.POST)
    public ModelAndView SetDefaultSelfAddress(@RequestParam("address_id") String address_id,HttpServletResponse response,
                                                  HttpServletRequest request,ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");

        int exist=mapper.checkDefaultAddressExist(user.getEmail());
        if(exist!=0)//数据库中有默认地址
        {
            int clearResult=mapper.clearDefaultAddress(user.getEmail());
            session.commit();
        }
        int result=mapper.setDefaultAddress(Integer.parseInt(address_id),user.getEmail());
        session.commit();

        if(result>0) {
            List<Address> addressList=mapper.showAllAddress(user.getEmail());
            map.put("Message", "Set Default Address Successfully!");
            request.getSession().setAttribute("addressList",addressList);
        }
        else
        {
            map.put("Message", "Set Default Address Failed!");
        }
        session.close();
        return new ModelAndView("redirect:/User/ManageSelfAddress.jsp",map);
    }

    //显示头像
    @RequestMapping(value = "userimage/{email}/image",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView image(@PathVariable String email,HttpServletResponse response,HttpServletRequest request){
        try{
            SqlSession session= MySqlSession.getMySession(response);
            UserMapper mapper = session.getMapper(UserMapper.class);
            User user = mapper.selectUser(email);
            if (user.getProfile()!=null) {
                byte[] imgByte = user.getProfile();
                UploadImageHelper.showImg(imgByte, response, request);
            }
            else
                System.out.println("No user profile!");
        }catch (Exception e){
            e.printStackTrace();
        }
        return new ModelAndView("redirect:userimage.jsp");
    }

    //添加头像
    @RequestMapping(value = "addUserProfile",method = RequestMethod.POST)
    public ModelAndView addUserProfile(HttpServletRequest request,HttpServletResponse response,ModelMap map){
        try{
            SqlSession session= MySqlSession.getMySession(response);
            UserMapper mapper = session.getMapper(UserMapper.class);
            User user =(User)request.getSession().getAttribute("user");

            byte[] imgByte = UploadImageHelper.addProductPicture(request);
            user.setProfile(imgByte);

            //通过SQL语句的返回值，判断是否插入成功
            int result = mapper.addUserProfile(user);
            if(result>0) {
                map.put("ModifyProfileMessage", "Modify Profile Successfully!");
            }
            else
            {
                map.put("ModifyProfileMessage", "Modify Profile Failed!");
            }
            //确认执行，没有commit这一句，数据库不会更新
            session.commit();
            session.close();
        }catch (Exception e){
            e.printStackTrace();
        }
         return new ModelAndView("redirect:/User/ModifySelfPic.jsp",map);
    }
}
