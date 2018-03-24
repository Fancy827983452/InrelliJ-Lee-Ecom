package com.Ecom.mapper;

import com.Ecom.model.Shop;
import com.Ecom.model.ShoppingCart;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

public interface ShopMapper {

    @Select("select * from shop where email=#{email}")
    public Shop selectShop(String email);

    @Insert("insert into shop(email,shop_name,type,business_license,establish_date,description,status) " +
            "values(#{email},#{shop_name},#{type},#{business_license},#{establish_date},#{description},#{status})")
    public int registerShop(Shop shop);

    @Select("select * from shop where shop_name like #{keyword}")
    List<Shop> getShopsByKeyword(String keyword);

    @Insert("insert into shopping_cart(email,product_id,property_name,amount) values(#{email},#{product_id},#{property_name},1)")
    public int addToCart(ShoppingCart cart);

    @Select("select * from shopping_cart where email=#{email} and product_id=#{product_id} and property_name=#{property_name}")
    ShoppingCart checkRepeatProduct(ShoppingCart cart);

    @Update("update shopping_cart set amount=#{amount} where cart_id=#{cart_id}")
    int refreshProductNum(ShoppingCart cart);
}
