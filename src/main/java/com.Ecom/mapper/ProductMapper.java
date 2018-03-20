package com.Ecom.mapper;

import com.Ecom.model.Product;
import com.Ecom.model.ProductCategory;
import com.Ecom.model.ProductPicture;
import com.Ecom.model.ProductProperty;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

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

    //获取属性个数
    @Select("select count(*) from product_property where product_id=#{product_id}")
    public int getPropertyCount(int product_id);

    //获取属性
    @Select("select * from product_property where product_id=#{product_id}")
    public List<ProductProperty> getProperty(int product_id);

    @Insert("insert into product_picture(product_id,file,sequence) values(#{product_id},#{file},#{sequence})")
    public int addProductPicture(ProductPicture productPicture);

    @Select("select * from product_picture where product_id = #{product_id} and sequence = #{sequence}")
    ProductPicture getProductPicture(ProductPicture productPicture);

    //获取图片个数
    @Select("select count(*) from product_picture where product_id=#{product_id}")
    public int getPictureCount(int product_id);

    //获取图片
    @Select("select * from product_picture where product_id=#{product_id}")
    public List<ProductPicture> getPicture(int product_id);

    @Select("select ifnull(max(product_id),0) from product where shop_id=#{shop_id}")
    public int getProduct_ID(int shop_id);

    @Select("select * from product where shop_id=#{shop_id}")
    public List<Product> getProductList(int shop_id);

    @Select("select * from product_picture where product_id=#{product_id}")
    public List<ProductPicture> getProductPictureList(int product_id);

    @Select("select * from product_picture where product_id = #{product_id} and sequence = #{sequence}")
    public ProductPicture getProductPictureBySequence(ProductPicture productPicutre);

    //删除product表中数据
    @Delete("delete from product where product_id=#{product_id}")
    public int deleteFromProduct(int product_id);

    //删除product_picture表中数据
    @Delete("delete from product_picture where product_id=#{product_id}")
    public int deleteFromProductPicture(int product_id);

    //删除product_property表中数据
    @Delete("delete from product_property where product_id=#{product_id}")
    public int deleteFromProductProperty(int product_id);

}
