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
import org.springframework.web.bind.annotation.PathVariable;
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

    @RequestMapping(value = "AddProduct", method = RequestMethod.POST)
    public ModelAndView AddProduct(HttpServletResponse response, HttpServletRequest request, ModelMap map) throws Exception {

        SqlSession session = MySqlSession.getMySession(response);
        ShopMapper shopMapper = session.getMapper(ShopMapper.class);
        ProductMapper productMapper = session.getMapper(ProductMapper.class);
        User user = (User) request.getSession().getAttribute("user");
        Shop myShop = shopMapper.selectShop(user.getEmail());
        UploadImageHelper.addProductPicture(request);

        //获取shop_id
        int shop_id = myShop.getShop_id();

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
            productPictures[i].setSequence(i + 1);
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
        if (addProductResult > 0) {
            session.commit();
        }

        //插入property表
        for (int i = 0; i < productProperties.length; i++)
            addPropertyResult[i] = productMapper.addProperty(productProperties[i]);

        //插入product_picture表
        for (int i = 0; i < productPictures.length; i++)
            addProductPictureResult[i] = productMapper.addProductPicture(productPictures[i]);

        int length = productProperties.length >= productPictures.length ? productProperties.length : productPictures.length;
        Boolean check[] = new Boolean[length];
        for (int i = 0; i < productProperties.length; i++) {
            if (addPropertyResult[i] > 0) {
                for (int j = 0; j < productPictures.length; j++) {
                    if (addProductPictureResult[j] > 0) {
                        check[j] = true;
                    } else
                        check[j] = false;
                }
                check[i] = true;
            } else
                check[i] = false;
        }

        //判断所有插入是否都成功
        boolean bool = Utils.isAllTrue(check);

        if (bool == true) {
            session.commit();
            map.put("Message", "Add Product Successfully!");
            //存取图片
            List <ProductPicture> productPictureList = productMapper.getProductPictureList(product_id);
            //存取商品
            List <Product> productList = productMapper.getProductList(shop_id);
            request.getSession().setAttribute("productList", productList);
        } else
            map.put("Message", "Add Product Failed!");

        session.close();
        return new ModelAndView("redirect:/Shop/AddProduct.jsp", map);
    }

    @RequestMapping(value = "AddProductCategory", method = RequestMethod.POST)
    public ModelAndView AddProductCategory(@RequestParam("category_name") String category_name, HttpServletResponse response,HttpServletRequest request, ModelMap map) throws IOException {
        SqlSession session = MySqlSession.getMySession(response);
        ShopMapper shopMapper = session.getMapper(ShopMapper.class);
        ProductMapper productMapper = session.getMapper(ProductMapper.class);
        User user = (User) request.getSession().getAttribute("user");
        Shop myShop = shopMapper.selectShop(user.getEmail());
        int i = productMapper.addProductCategory(myShop.getShop_id(), category_name);
        session.commit();
        if (i > 0) {
            List <ProductCategory> categoryNames = productMapper.getCategory(myShop.getShop_id());//获取所有的分类名
            request.getSession().setAttribute("categoryNames", categoryNames);
            map.put("Message", "Add Category Successfully!");
        } else
            map.put("Message", "Add Category Failed!");
        session.close();
        return new ModelAndView("redirect:/Shop/AddProduct.jsp", map);
    }

    //显示指定位置的图片
    @RequestMapping(value = "productimage/{product_id}/{sequence}", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView image(@PathVariable int product_id, @PathVariable int sequence,HttpServletResponse response, HttpServletRequest request) {
        try {
            SqlSession session = MySqlSession.getMySession(response);
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            ProductPicture productPicture = mapper.getOnePicture(product_id,sequence);
            byte[] imgByte = productPicture.getFile();
            UploadImageHelper.showImg(imgByte, response, request);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("redirect:productimage.jsp");
    }

    @RequestMapping(value = "deleteProduct",method = RequestMethod.POST)
    public ModelAndView deleteProduct(@RequestParam("product_id") String product_id,HttpServletResponse response,HttpServletRequest request,ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        //需要删除三个表中的数据：product表、product_picture表、product_property表
        ProductMapper productMapper=session.getMapper(ProductMapper.class);

        int deleteFromProductPictureResult=productMapper.deleteFromProductPicture(Integer.parseInt(product_id));
        int deleteFromProductPropertyResult=productMapper.deleteFromProductProperty(Integer.parseInt(product_id));
        int deleteFromProductResult=productMapper.deleteFromProduct(Integer.parseInt(product_id));
        if(deleteFromProductPictureResult>0 && deleteFromProductPropertyResult>0 && deleteFromProductResult>0)
        {
            session.commit();
            map.put("Message", "Delete Product Successfully!");
            ShopMapper shopMapper = session.getMapper(ShopMapper.class);
            User user = (User) request.getSession().getAttribute("user");
            int shop_id = shopMapper.selectShop(user.getEmail()).getShop_id();
            List <Product> productList = productMapper.getProductList(shop_id);
            request.getSession().setAttribute("productList", productList);
        }
        else
        {
            map.put("Message", "Delete Product Failed!");
        }
        session.close();
        return new ModelAndView("redirect:/Shop/ProductManagement.jsp",map);
    }

    @RequestMapping(value = "getParameters",method = RequestMethod.POST)
    public ModelAndView getParameters(@RequestParam("product_id") String product_id,HttpServletResponse response,HttpServletRequest request,ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);

        ProductMapper productMapper=session.getMapper(ProductMapper.class);
        List<ProductPicture> productPictureList=productMapper.getProductPictureList(Integer.parseInt(product_id));
        List<ProductProperty> productPropertyList=productMapper.getProperty(Integer.parseInt(product_id));

        int pictureCount=productMapper.getPictureCount(Integer.parseInt(product_id));
        int propertyCount=productMapper.getPropertyCount(Integer.parseInt(product_id));

        //指定商品的属性和图片
        request.getSession().setAttribute("productPropertyList", productPropertyList);
        request.getSession().setAttribute("productPictureList", productPictureList);
        map.addAttribute("product_id",product_id);
        map.addAttribute("pictureCount",pictureCount);
        map.addAttribute("propertyCount",propertyCount);

        return new ModelAndView("redirect:/Shop/EditProduct.jsp",map);
    }

    @RequestMapping(value = "EditProduct/{product_id}", method = RequestMethod.POST)
    public ModelAndView AddProduct(@PathVariable int product_id,HttpServletResponse response, HttpServletRequest request, ModelMap map) throws Exception {

        SqlSession session = MySqlSession.getMySession(response);
        ShopMapper shopMapper = session.getMapper(ShopMapper.class);
        ProductMapper productMapper = session.getMapper(ProductMapper.class);
        User user = (User) request.getSession().getAttribute("user");
        Shop myShop = shopMapper.selectShop(user.getEmail());
        UploadImageHelper.addProductPicture(request);

        System.out.println(UploadImageHelper.itemlist);

        //获取shop_id
        int shop_id = myShop.getShop_id();

        //获取product_name
        String product_name = UploadImageHelper.itemlist.get(0).get("product_name").toString();

        //获取category_id
        int category_id = Integer.parseInt(UploadImageHelper.itemlist.get(1).get("category_id").toString());

        List<ProductProperty> productPropertyList=productMapper.getProperty(product_id);
        List<ProductPicture> productPictureList=productMapper.getProductPictureList(product_id);

        //获取propertyNum
       int propertyNum1 = Integer.parseInt(UploadImageHelper.itemlist.get(2).get("propertyNum").toString());
        int propertyNum = productPropertyList.size();

        //获取imageNum
        int imageNum=productPictureList.size();
       int imageNum1 = Integer.parseInt(UploadImageHelper.itemlist.get(2 + propertyNum * 4 + 1).get("imageNum").toString());

        System.out.println("propertyNum= "+propertyNum);
        System.out.println("imageNum= "+imageNum);

        int stock = 0;
        //读取property内容
        ProductProperty[] productProperties = new ProductProperty[propertyNum];
        int[] updatePropertyResult = new int[propertyNum];
        int property_id[]=new int[propertyNum];
        for (int i = 0; i < productProperties.length; i++) {
            productProperties[i] = new ProductProperty();
            productProperties[i].setProduct_id(product_id);
            //获取property_id
            property_id[i]= Integer.parseInt(UploadImageHelper.itemlist.get(4 * i + 3).get("property_id"+i).toString());
            productProperties[i].setProperty_id(property_id[i]);
            productProperties[i].setProperty_name(UploadImageHelper.itemlist.get(4 * i + 4).get("property_name" + i).toString());
            productProperties[i].setUnit_price(Float.parseFloat(UploadImageHelper.itemlist.get(4 * i + 5).get("unit_price" + i).toString()));
            productProperties[i].setStock(Integer.parseInt(UploadImageHelper.itemlist.get(4 * i + 6).get("stock" + i).toString()));
            //计算库存
            stock += productProperties[i].getStock();
        }

        //读取image
        ProductPicture[] productPictures = new ProductPicture[imageNum];
        int[] updateProductPictureResult = new int[imageNum];
        int sequence[]=new int[imageNum];
        int picture_id[]=new int[imageNum];
        for (int i = 0; i < imageNum; i++) {
            if(i>=UploadImageHelper.picturelist.size())//如果i>=图片的数量（说明之前已经完成图片的修改了），就跳出循环
                break;
            productPictures[i] = new ProductPicture();
            productPictures[i].setProduct_id(product_id);
            productPictures[i].setFile(UploadImageHelper.picturelist.get(i).get("picture"));

            //获取最大sequence
            int maxSequence=productMapper.getMaxSequence(product_id);

            //获取sequence
            String seq=UploadImageHelper.itemlist.get(2 + propertyNum * 4 + 1 + i+1).get("sequence"+i).toString();
            sequence[i]= Integer.parseInt(seq);
            if(sequence[i]>maxSequence)//如果比目前最大的sequence还要大，就弹窗提示
            {
                map.put("Message","You cannot edit the sequence of the product picture which is not existed!");
                return new ModelAndView("redirect:/Shop/ProductManagement.jsp", map);
            }
            else
                productPictures[i].setSequence(sequence[i]);
            //获取picture_id
            for(int j=0;j<imageNum;j++)
            {
                if(productPictureList.get(j).getSequence()==sequence[i])
                    picture_id[i]=productPictureList.get(j).getPicture_id();
            }
//            picture_id[i]= Integer.parseInt(UploadImageHelper.itemlist.get(2 + propertyNum * 4 + 3).get("picture_id"+i).toString());
            productPictures[i].setPicture_id(picture_id[i]);
        }

        //获取details
        String details = UploadImageHelper.itemlist.get(2 + propertyNum * 4 +1 + UploadImageHelper.picturelist.size() +1 ).get("details").toString();

        Product product = new Product();
        product.setProduct_id(product_id);
        product.setProduct_name(product_name);
        product.setCategory_id(category_id);
        product.setUnit_price(productProperties[0].getUnit_price());
        product.setDetails(details);
        product.setStock(stock);

        int updateProductResult = productMapper.updateProduct(product);
        if (updateProductResult > 0) {
            session.commit();
        }

        //更新property表
        for (int i = 0; i < productProperties.length; i++)
            updatePropertyResult[i] = productMapper.updateProperty(productProperties[i]);

        //当进行图片修改时
        if(UploadImageHelper.picturelist.size()>0) {
            //更新product_picture表
            for (int i = 0; i < UploadImageHelper.picturelist.size(); i++)
                updateProductPictureResult[i] = productMapper.updateProductPicture(productPictures[i]);
        }

        int length = productProperties.length >= productPictures.length ? productProperties.length : productPictures.length;
        Boolean check[] = new Boolean[length];
        for (int i = 0; i < productProperties.length; i++) {
                if (updatePropertyResult[i] > 0) {
                    if(UploadImageHelper.picturelist.size()>0) {//当有图片需要修改时
                        for (int j = 0; j < UploadImageHelper.picturelist.size(); j++) {
                            if (updateProductPictureResult[j] == 0) {
                                check[j] = false;
                            } else
                                check[j] = true;
                        }
                    }
                    check[i] = true;
                }
                else
                    check[i] = false;
        }

        //判断所有插入是否都成功
        boolean bool = Utils.isAllTrue(check);

        if (bool == true) {
            session.commit();
            map.put("Message", "Edit Product Successfully!");
            //存取商品
            List <Product> productList = productMapper.getProductList(shop_id);
            request.getSession().setAttribute("productList", productList);
        } else
            map.put("Message", "Edit Product Failed!");

        session.close();
        return new ModelAndView("redirect:/Shop/ProductManagement.jsp", map);
    }

    @RequestMapping(value="/productinfo/{product_id}",method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView productinfo(@PathVariable int product_id,HttpServletResponse response,ModelMap map){
        int size = 0;
        try {
            SqlSession sqlSessions= MySqlSession.getMySession(response);
            ProductMapper productMapper = sqlSessions.getMapper(ProductMapper.class);
            List<ProductPicture> productPictures = productMapper.getProductPictureList(product_id);
            size = productPictures.size();
            System.out.println(productPictures.size());
        }catch (Exception e){
            e.printStackTrace();
        }

        map.addAttribute("product_id",product_id);
        map.addAttribute("size",size);

        return new ModelAndView("redirect:/Shop/ProductInfo.jsp",map);
    }

    @RequestMapping(value = "searchProduct",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView searchProduct(HttpServletRequest request,ModelMap map){
        try{
            String keyword = request.getParameter("keyword");
            keyword = "%"+keyword+"%";

            map.addAttribute("keyword",keyword);
        }catch (Exception e){
            e.printStackTrace();
        }

        return new ModelAndView("redirect:/Home/SearchCommodity.jsp",map);
    }

    @RequestMapping(value = "addProduct2Cart/{product_id}",method = {RequestMethod.POST,RequestMethod.GET})
    public ModelAndView addProduct2Cart(HttpServletRequest request,ModelMap map,HttpServletResponse response,@PathVariable int product_id){
        try {
            int size = 0;

            //加入购物车
            String email = request.getParameter("email");
            String propertyName = request.getParameter("propertyName");
            ShoppingCart shoppingCart = new ShoppingCart();
            shoppingCart.setProperty_name(propertyName);
            shoppingCart.setEmail(email);
            shoppingCart.setAmount(1);
            shoppingCart.setProduct_id(product_id);

            SqlSession sqlSessions= MySqlSession.getMySession(response);
            ProductMapper productMapper = sqlSessions.getMapper(ProductMapper.class);

            productMapper.addProduct2Cart(shoppingCart);

            //为了跳回原界面，再读一次
            List<ProductPicture> productPictures = productMapper.getProductPictureList(product_id);
            size = productPictures.size();
            System.out.println(productPictures.size());
            map.addAttribute("product_id",product_id);
            map.addAttribute("size",size);
        }catch (Exception e){
            e.printStackTrace();
        }



        return new ModelAndView("redirect:/Shop/ProductInfo.jsp",map);
    }
}

