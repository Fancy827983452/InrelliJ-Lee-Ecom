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

    @Select("select * from shop where status=0")
    List<Shop> getUnCheckedShops();

    //店铺过审
    @Update("UPDATE shop SET STATUS=1 WHERE SHOP_ID=#{0}")
    int approveShop(int shop_id);

    //店铺不过审
    @Update("UPDATE shop SET STATUS=2 WHERE SHOP_ID=#{0}")
    int disapproveShop(int shop_id);
}
