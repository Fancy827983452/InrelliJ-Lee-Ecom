package com.Ecom.dao;

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

    @Delete("delete from user where email=#{email}")
    public int delete(String email);

    @Select("select * from user where email=#{email}")
    public User showDetails(String email);

    @Select("select * from user")
    public List<User> showAll();
}
