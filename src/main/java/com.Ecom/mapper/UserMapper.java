package com.Ecom.mapper;

import com.Ecom.model.Address;
import com.Ecom.model.ShoppingCart;
import com.Ecom.model.User;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface UserMapper {
    @Select("select email, password from user where email = #{email} and password =#{password}")
    public User checkLogin(User user);

    @Insert("insert into user(email,name,password,role,actual_name,phone,gender,status) " +
            "values(#{email},#{name},#{password},#{role},#{actual_name},#{phone},#{gender},#{status})")
    public int register(User user);

    @Update("update user set name=#{name},actual_name=#{actual_name},gender=#{gender},phone=#{phone} where email=#{email}")
    public int updateUserInfo(User user);

    //含有多个参数时，由于不能使用名称匹配，故用数字表示
    @Update("update user set password=#{0} where email=#{1} and password=#{2}")
    public int updatePwd(String newPwd,String email,String oldPwd);

    @Update("update user set pay_password=#{0} where email=#{1} and pay_password=#{2}")
    public int updatePayPwd(int newPwd,String email,int oldPwd);

    @Update("update user set pay_password=#{0} where email=#{1}")
    public int setPayPwd(int newPwd,String email);

    @Delete("delete from user where email=#{email}")
    public int deleteUser(String email);

    @Select("select * from user where email=#{email}")
    public User selectUser(String email);

    @Select("select * from user")
    public List<User> showAll();

    @Select("select * from user where email=#{email}")
    public User getUserByEmail(String email);

    @Insert("insert into address(email,receiver_name,phone,zip_code,address) " +
            "values(#{email},#{receiver_name},#{phone},#{zip_code},#{address})")
    public int insertAddress(Address address);

    @Select("select * from address where email=#{email}")
    public List<Address> showAllAddress(String email);

    @Select("select * from address where address_id=#{address_id}")
    public Address selectAddressByID(int address_id);

    @Update("update address set receiver_name=#{receiver_name},phone=#{phone},zip_code=#{zip_code},address=#{address} " +
            "where address_id=#{address_id}")
    public int updateAddress(Address address);

    @Delete("delete from address where address_id=#{address_id}")
    public int deleteAddress(int address_id);

    //判断数据库中是否已有默认地址
    @Select("select count(*) from address where default_address=1 and email=#{email}")
    public int checkDefaultAddressExist(String email);

    //将之前的默认取消
    @Update("update address set default_address=0 where default_address=1 and email=#{email};")
    public int clearDefaultAddress(String email);

    //设置新的默认地址
    @Update("update address set default_address=1 where address_id=#{0} and email=#{1};")
    public int setDefaultAddress(int address_id,String email);

    //插入头像
    @Update("update user set profile=#{profile} where email=#{email}")
    public int addUserProfile(User user);

    //获取购物车数据
    @Select("select t3.*,SHOP_NAME from(" +
            "select t2.*,UNIT_PRICE from(" +
            "select t1.*,file,SEQUENCE from (" +
            "select CART_ID,EMAIL,product.shop_id,shopping_cart.PRODUCT_ID,PRODUCT_NAME,PROPERTY_NAME,AMOUNT from shopping_cart " +
            "join product on shopping_cart.PRODUCT_ID=product.PRODUCT_ID where email=#{0})as t1 " +
            "join product_picture on t1.PRODUCT_ID=product_picture.PRODUCT_ID)as t2 " +
            "join product_property on product_property.PROPERTY_NAME=t2.PROPERTY_NAME)as t3 " +
            "join shop on shop.SHOP_ID=t3.shop_id " +
            "where t3.email=#{0} and t3.SEQUENCE=1")
    public List<ShoppingCart> getCart(String email);

    @Insert("insert into shopping_cart(email,product_id,property_name,amount) values(#{email},#{product_id},#{property_name},1)")
    public int addToCart(ShoppingCart cart);

    @Select("select * from shopping_cart where email=#{email} and product_id=#{product_id} and property_name=#{property_name}")
    ShoppingCart checkRepeatProduct(ShoppingCart cart);

    @Update("update shopping_cart set amount=#{amount} where cart_id=#{cart_id}")
    int refreshProductNum(ShoppingCart cart);

    @Delete("delete from shopping_cart where cart_id=#{cart_id}")
    public int deleteCartProduct(int cart_id);

    //获取购物车某条数据
    @Select("select t3.*,SHOP_NAME from(" +
            "select t2.*,UNIT_PRICE from(" +
            "select t1.*,file,SEQUENCE from (" +
            "select CART_ID,EMAIL,product.shop_id,shopping_cart.PRODUCT_ID,PRODUCT_NAME,PROPERTY_NAME,AMOUNT from shopping_cart " +
            "join product on shopping_cart.PRODUCT_ID=product.PRODUCT_ID where email=#{0})as t1 " +
            "join product_picture on t1.PRODUCT_ID=product_picture.PRODUCT_ID)as t2 " +
            "join product_property on product_property.PROPERTY_NAME=t2.PROPERTY_NAME)as t3 " +
            "join shop on shop.SHOP_ID=t3.shop_id " +
            "where t3.email=#{0} and t3.SEQUENCE=1 and t3.cart_id=#{1};")
    public ShoppingCart getCartItem(String email,int cart_id);
}
