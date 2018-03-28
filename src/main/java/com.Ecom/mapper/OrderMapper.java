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

    //插入交易记录
    @Insert("insert into transaction(order_id,card_id,type,money,balance,time,details) " +
            "values(#{order_id},#{card_id},#{type},#{money},#{balance},#{time},#{details})")
    public int InsertTransaction(Transaction transaction);

    //获取个人交易记录
    @Select("SELECT transaction.*,EMAIL FROM transaction join user_bank_card on transaction.CARD_ID=user_bank_card.CARD_ID " +
            "where EMAIL=#{email}")
    public List<Transaction> getTransactions(String email);

    @Select("select ifnull(max(order_id),0) FROM self_order")
    public int getMaxOrderID();

    @Insert("insert into self_order(order_id,email,shop_id,product_id,property_name,unit_price,amount,shipping_fee,actual_pay,address_id,time,status) " +
            "values(#{order_id},#{email},#{shop_id},#{product_id},#{property_name},#{unit_price},#{amount},#{shipping_fee},#{actual_pay},#{address_id},#{time},#{status})")
    public int insertOrder(Order order);

    //获取余额
    //*如果该用户初始未购买过任何商品，则将余额设为一个默认值1000（待改）
    @Select("SELECT ifnull(max(BALANCE),1000) FROM transaction join user_bank_card on transaction.CARD_ID=user_bank_card.CARD_ID " +
            "where EMAIL=#{email} order by Time desc limit 1")
    public float getBalance(String email);
}
