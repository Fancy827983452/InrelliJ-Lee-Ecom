package com.Ecom.mapper;

import com.Ecom.model.Shop;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ShopMapper {

    @Select("select * from shop where email=#{email}")
    public Shop selectShop(String email);

    @Select("select count(*) from shop where email=#{email}")
    public int checkShopExist(String email);

    @Insert("insert into shop(email,shop_name,type,business_license,establish_date,status) " +
            "values(#{email},#{shop_name},#{type},#{business_license},#{establish_date},#{status})")
    public int registerShop(Shop shop);
}
