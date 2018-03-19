package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.dao.UploadImageHelper;
import com.Ecom.dao.Utils;
import com.Ecom.mapper.ProductMapper;
import com.Ecom.mapper.ShopMapper;
import com.Ecom.model.*;
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
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ProductController {

    @RequestMapping(value="AddProduct",method= RequestMethod.POST)
    public ModelAndView AddProduct(HttpServletResponse response, HttpServletRequest request, ModelMap map) throws Exception {

        SqlSession session = MySqlSession.getMySession(response);
        ShopMapper shopMapper = session.getMapper(ShopMapper.class);
        ProductMapper productMapper = session.getMapper(ProductMapper.class);
        User user = (User) request.getSession().getAttribute("user");
        Shop myShop = shopMapper.selectShop(user.getEmail());
        UploadImageHelper.addProductPicture(request);

        //获取shop_id
        int shop_id = shopMapper.selectShop(user.getEmail()).getShop_id();

        //获取product_id
        int product_id = productMapper.getProduct_ID(shop_id) + 1;

        //获取当前系统时间
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String add_date = df.format(date).toString();

        //获取product_name
        String product_name = UploadImageHelper.itemlist.get(0).get("product_name").toString();

        //获取category_id
        int category_id = Integer.parseInt(UploadImageHelper.itemlist.get(1).get("category_id").toString());

        //获取propertyNum
        int propertyNum = Integer.parseInt(UploadImageHelper.itemlist.get(2).get("propertyNum").toString());

        int stock = 0;
        //读取property内容
        ProductProperty[] productProperties = new ProductProperty[propertyNum];
        int[] addPropertyResult = new int[propertyNum];
        for (int i = 0; i < productProperties.length; i++) {
            productProperties[i] = new ProductProperty();
            productProperties[i].setProduct_id(product_id);
            productProperties[i].setProperty_name(UploadImageHelper.itemlist.get(3 * i + 3).get("property_name" + i).toString());
            productProperties[i].setUnit_price(Float.parseFloat(UploadImageHelper.itemlist.get(3 * i + 4).get("unit_price" + i).toString()));
            productProperties[i].setStock(Integer.parseInt(UploadImageHelper.itemlist.get(3 * i + 5).get("stock" + i).toString()));
            //计算库存
            stock += productProperties[i].getStock();
        }

        //获取imageNum
        int imageNum = Integer.parseInt(UploadImageHelper.itemlist.get(2 + propertyNum * 3 + 1).get("imageNum").toString());

        //获取details
        String details = UploadImageHelper.itemlist.get(2 + propertyNum * 3 + 1 + 1).get("details").toString();

        //读取image
        ProductPicture[] productPictures = new ProductPicture[imageNum];
        int[] addProductPictureResult = new int[imageNum];
        for (int i = 0; i < imageNum; i++) {
            productPictures[i] = new ProductPicture();
            productPictures[i].setProduct_id(product_id);
            productPictures[i].setFile(UploadImageHelper.picturelist.get(i).get("picture"));
            productPictures[i].setSequence(i+1);
        }

        Product product = new Product();
        product.setProduct_id(product_id);
        product.setShop_id(shop_id);
        product.setProduct_name(product_name);
        product.setCategory_id(category_id);
        product.setUnit_price(productProperties[0].getUnit_price());
        product.setDetails(details);
        product.setAdd_date(add_date);
        product.setStock(stock);
        //由于product_id是FK，所以要先插入商品表
        int addProductResult = productMapper.addProduct(product);
        if(addProductResult>0) {
            session.commit();
        }

        //插入property表
        for (int i = 0; i < productProperties.length; i++)
            addPropertyResult[i] = productMapper.addProperty(productProperties[i]);

        //插入product_picture表
        for(int i=0;i<productPictures.length;i++)
            addProductPictureResult[i] = productMapper.addProductPicture(productPictures[i]);

        int length=productProperties.length>=productPictures.length?productProperties.length:productPictures.length;
        Boolean check[]=new Boolean[length];
        for(int i=0;i<productProperties.length;i++) {
            if (addPropertyResult[i] > 0)
            {
                for(int j=0;j<productPictures.length;j++) {
                    if (addProductPictureResult[j] > 0) {
                        check[j] = true;
                    }
                    else
                        check[j] = false;
                }
                check[i]=true;
            }
            else
                check[i] = false;
        }

        //判断所有插入是否都成功
        boolean bool=Utils.isAllTrue(check);

        if(bool==true) {
            session.commit();
            map.put("Message", "Add Product Successfully!");
        }
        else
            map.put("Message","Add Product Failed!");

        session.close();
        //清空两个list
        UploadImageHelper.itemlist.clear();
        UploadImageHelper.picturelist.clear();
        return new ModelAndView("redirect:/Shop/AddProduct.jsp",map);
    }

    @RequestMapping(value="AddProductCategory",method= RequestMethod.POST)
    public ModelAndView AddProductCategory(@RequestParam("category_name") String category_name, HttpServletResponse response,
                                           HttpServletRequest request, ModelMap map) throws IOException {

        System.out.println("Jump to the controller");
        SqlSession session= MySqlSession.getMySession(response);
        ShopMapper shopMapper = session.getMapper(ShopMapper.class);
        ProductMapper productMapper = session.getMapper(ProductMapper.class);
        User user=(User)request.getSession().getAttribute("user");
        Shop myShop=shopMapper.selectShop(user.getEmail());
        int i=productMapper.addProductCategory(myShop.getShop_id(),category_name);
        session.commit();
        System.out.println("i="+i);
        if(i>0)
        {
            List<ProductCategory> categoryNames=productMapper.getCategory(myShop.getShop_id());//获取所有的分类名
            request.getSession().setAttribute("categoryNames",categoryNames);
            map.put("Message","Add Category Successfully!");
        }
        else
            map.put("Message","Add Category Failed!");
        session.close();
        return new ModelAndView("redirect:/Shop/AddProduct.jsp",map);
    }
}
