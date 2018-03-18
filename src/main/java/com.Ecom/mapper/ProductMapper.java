package com.Ecom.mapper;

import com.Ecom.model.Product;
import com.Ecom.model.ProductCategory;
import com.Ecom.model.ProductPicture;
import com.Ecom.model.ProductProperty;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ProductMapper {

    @Select("select * from product_category where shop_id=#{shop_id}")
    public List<ProductCategory> getCategory(int shop_id);

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

    @Select("select ifnull(max(product_id),0) from product where shop_id=#{shop_id}")
    public int getProduct_ID(int shop_id);

}
