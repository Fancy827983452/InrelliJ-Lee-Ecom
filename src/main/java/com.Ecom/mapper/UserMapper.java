package com.Ecom.mapper;

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
}
