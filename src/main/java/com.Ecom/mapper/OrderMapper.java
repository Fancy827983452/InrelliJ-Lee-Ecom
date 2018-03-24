package com.Ecom.mapper;

import com.Ecom.model.Order;
import com.Ecom.model.Transaction;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import java.util.List;

public interface OrderMapper {
    //获取订单信息
    @Select("select t3.*,file,sequence from product_picture join " +
            "(select t2.*,RECEIVER_NAME,PHONE,ZIP_CODE,ADDRESS from address join " +
            "(select t1.*,product.PRODUCT_NAME from product join " +
            "(select self_order.*,shop.SHOP_NAME from self_order join shop on self_order.SHOP_ID=shop.SHOP_ID)as t1 " +
            "on product.PRODUCT_ID=t1.PRODUCT_ID)as t2 " +
            "on address.ADDRESS_ID=t2.ADDRESS_ID)as t3 " +
            "on product_picture.PRODUCT_ID=t3.PRODUCT_ID " +
            "where t3.EMAIL=#{email} and SEQUENCE=1")
    public List<Order> getOrder(String email);

    //发货（1）/确认收货（2）/交易完成（3）/退款（4）
    @Update("update self_order set status=#{0} where order_id=#{1} and email=#{2}")
    public int ConfirmReceived(int status,int order_id,String email);

    //退款
    @Insert("insert into transaction(order_id,card_id,type,money,balance,time,details) " +
            "values(#{order_id},#{card_id},#{type},#{money},#{balance},#{time},#{details})")
    public int Refund(Transaction transaction);

    //获取个人交易记录
    @Select("SELECT transaction.*,EMAIL FROM transaction join user_bank_card on transaction.CARD_ID=user_bank_card.CARD_ID " +
            "where EMAIL=#{email}")
    public List<Transaction> getTransactions(String email);
}
