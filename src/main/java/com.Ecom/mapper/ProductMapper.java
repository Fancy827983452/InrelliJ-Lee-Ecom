package com.Ecom.mapper;

import com.Ecom.model.*;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ProductMapper {

    @Select("select * from product_category where shop_id=#{shop_id}")
    public List<ProductCategory> getCategory(int shop_id);

    @Select("select category_name from product_category where category_id=#{category_id}")
    public String getCategoryName(int category_id);

    @Insert("insert into product_category(shop_id,category_name) values(#{0},#{1})")
    public int addProductCategory(int shop_id,String category_name);

    @Insert("insert into product(product_id,shop_id,product_name,category_id,unit_price,details,add_date,stock) " +
            "values(#{product_id},#{shop_id},#{product_name},#{category_id},#{unit_price},#{details},#{add_date},#{stock})")
    public int addProduct(Product product);

    @Insert("insert into product_property(product_id,property_name,stock,unit_price) " +
            "values(#{product_id},#{property_name},#{stock},#{unit_price})")
    public int addProperty(ProductProperty productProperty);

    @Insert("insert into product_picture(product_id,file,sequence) values(#{product_id},#{file},#{sequence})")
    public int addProductPicture(ProductPicture productPicture);

    //修改product信息
    @Update("update product set product_name=#{product_name},category_id=#{category_id},unit_price=#{unit_price},details=#{details}," +
            "stock=#{stock} where product_id=#{product_id}")
    public int updateProduct(Product product);

    //修改property信息
    @Update("update product_property set property_name=#{property_name},stock=#{stock},unit_price=#{unit_price} where product_id=#{product_id} and property_id=#{property_id}")
    public int updateProperty(ProductProperty productProperty);

    //修改productPicture信息
    @Update("update product_picture set file=#{file},sequence=#{sequence} where product_id=#{product_id} and picture_id=#{picture_id}")
    public int updateProductPicture(ProductPicture productPicture);

    //获取属性个数
    @Select("select count(*) from product_property where product_id=#{product_id}")
    public int getPropertyCount(int product_id);

    //获取属性
    @Select("select * from product_property where product_id=#{product_id}")
    public List<ProductProperty> getProperty(int product_id);

    //获取图片个数
    @Select("select count(*) from product_picture where product_id=#{product_id}")
    public int getPictureCount(int product_id);

    //获取图片
    @Select("select * from product_picture where product_id=#{0} and sequence=#{1}")
    public ProductPicture getOnePicture(int product_id,int sequence);

    @Select("select ifnull(max(sequence),0) from product_picture where product_id=#{product_id}")
    public int getMaxSequence(int product_id);

    @Select("select ifnull(max(product_id),0) from product")
    public int getProduct_ID();

    @Select("select * from product where shop_id=#{shop_id}")
    public List<Product> getProductListByID(int shop_id);

    @Select("select * from product where status=0")
    public List<Product> getProductList();

    @Select("select * from product_picture where product_id=#{product_id}")
    public List<ProductPicture> getProductPictureList(int product_id);

    @Select("select * from product_picture where product_id = #{product_id} and sequence = #{sequence}")
    public ProductPicture getProductPictureBySequence(ProductPicture productPicutre);

    @Select("select * from product where product_id=#{product_id}")
    Product getProductById(int product_id);

    //根据关键词搜索
    @Select("select * from product where product_name like #{keyword}")
    List<Product> getProductsByKeyword(String keyword);

    //根据店铺名搜索
    @Select("select product.* from product join " +
            "(select * from shop where SHOP_NAME like #{keyword}) as t1 " +
            "on product.SHOP_ID = t1.SHOP_ID")
    List<Product> getProductsByShopName(String keyword);

    //删除product表中数据
    @Delete("delete from product where product_id=#{product_id}")
    public int deleteFromProduct(int product_id);

    //删除product_picture表中数据
    @Delete("delete from product_picture where product_id=#{product_id}")
    public int deleteFromProductPicture(int product_id);

    //删除product_property表中数据
    @Delete("delete from product_property where product_id=#{product_id}")
    public int deleteFromProductProperty(int product_id);

    //获取商品属性
    @Select("select * from product_property where product_id=#{product_id}")
    List<ProductProperty> getPropertiesById(int product_id);

    //加入购物车
    @Insert("insert into shopping_cart(email,product_id,property_name,amount) values(#{email},#{product_id},#{property_name},#{amount})")
    int addProduct2Cart(ShoppingCart shoppingCart);

}
