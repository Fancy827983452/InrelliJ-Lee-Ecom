package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.dao.Utils;
import com.Ecom.mapper.OrderMapper;
import com.Ecom.mapper.ProductMapper;
import com.Ecom.mapper.UserMapper;
import com.Ecom.model.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class OrderController {
    @RequestMapping(value="ConfirmReceived",method= RequestMethod.POST)
    public ModelAndView ConfirmReceived(@RequestParam("order_id") String order_id,
                                        HttpServletResponse response, HttpServletRequest request, ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        User user=(User)request.getSession().getAttribute("user");
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        int result=orderMapper.ConfirmReceived(2,Integer.parseInt(order_id),user.getEmail());
        if(result>0) {
            List<Order> orderList=orderMapper.getOrder(user.getEmail());
            map.put("Message", "Confirm receipt Successfully!");
            request.getSession().setAttribute("orderList",orderList);
        }
        else
            map.put("Message","Confirm receipt Failed!");

        session.commit();
        session.close();
        return new ModelAndView("redirect:/User/SelfOrder.jsp",map);
    }

    @RequestMapping(value="ConfirmRefund",method= RequestMethod.POST)
    public ModelAndView ConfirmRefund(@RequestParam("order_id") String order_id,
                                        HttpServletResponse response, HttpServletRequest request, ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        User user=(User)request.getSession().getAttribute("user");
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        //获取个人所有交易记录
        List<Transaction> transactionList=orderMapper.getTransactions(user.getEmail());
        Transaction transaction=new Transaction();
        for(int i=0;i<transactionList.size();i++)
        {
            if(transactionList.get(i).getOrder_id()==Integer.parseInt(order_id))//判断是否为申请的订单号
            {
                transaction.setOrder_id(transactionList.get(i).getOrder_id());
                transaction.setCard_id(transactionList.get(i).getCard_id());
                transaction.setType(1);
                transaction.setMoney(transactionList.get(i).getMoney());
                transaction.setBalance(transactionList.get(i).getBalance()+transactionList.get(i).getMoney());
                //获取当前系统时间
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = new Date();
                String time=df.format(date).toString();
                transaction.setTime(time);
                transaction.setDetails("Refund:"+transactionList.get(i).getDetails());
            }
        }

        int result1=orderMapper.ConfirmReceived(4,Integer.parseInt(order_id),user.getEmail());
        int result2=orderMapper.InsertTransaction(transaction);

        if(result1>0 && result2>0) {
            session.commit();
            List<Order> orderList=orderMapper.getOrder(user.getEmail());
            map.put("Message", "Refund Successfully!");
            request.getSession().setAttribute("orderList",orderList);
        }
        else
            map.put("Message","Refund Failed!");

        session.close();
        return new ModelAndView("redirect:/User/SelfOrder.jsp",map);
    }

    //购物车结算
    @RequestMapping(value = "SettleAccount",method = RequestMethod.POST)
    public ModelAndView SettleAccount(@RequestParam("cart_id") String cart_ids,HttpServletResponse response,
                                          HttpServletRequest request,ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");

        String cart_id[]=cart_ids.split(",");
        int num=cart_id.length;
        ShoppingCart[] shoppingCartItem=new ShoppingCart[num];
        for(int i=0;i<num;i++)
        {
            shoppingCartItem[i]=mapper.getCartItem(user.getEmail(),Integer.parseInt(cart_id[i]));
            request.getSession().setAttribute("shoppingCartItem"+i,shoppingCartItem[i]);
        }
        session.close();
        map.put("num",num);
        request.getSession().setAttribute("shoppingCartItem",shoppingCartItem);
        return new ModelAndView("redirect:/User/SubmitOrder.jsp",map);
    }

    //提交订单
    @RequestMapping(value = "SubmitOrder",method = RequestMethod.POST)
    public ModelAndView SubmitOrder(@RequestParam("address_id")String address_id,@RequestParam("num")String num,
                                    @RequestParam("totalPrice") String totalPrice,
                                    HttpServletResponse response,HttpServletRequest request, ModelMap map) throws IOException {

        SqlSession session= MySqlSession.getMySession(response);
        User user=(User)request.getSession().getAttribute("user");
        UserMapper userMapper=session.getMapper(UserMapper.class);

        Order order[]=new Order[Integer.parseInt(num)];
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);
        int order_id=orderMapper.getMaxOrderID()+1;
        System.out.println(order_id);

        ShoppingCart[] shoppingCartItem=new ShoppingCart[Integer.parseInt(num)];
        for(int i=0;i<Integer.parseInt(num);i++) {
            shoppingCartItem[i] = (ShoppingCart) request.getSession().getAttribute("shoppingCartItem" + i);
            order[i]=new Order();
            order[i].setOrder_id(order_id);
            order[i].setEmail(user.getEmail());
            order[i].setShop_id(shoppingCartItem[i].getShop_id());
            order[i].setShop_name(shoppingCartItem[i].getShop_name());
            order[i].setProduct_id(shoppingCartItem[i].getProduct_id());
            order[i].setProduct_name(shoppingCartItem[i].getProduct_name());
            order[i].setProperty_name(shoppingCartItem[i].getProperty_name());
            float unit_price=shoppingCartItem[i].getUnit_price();
            order[i].setUnit_price(unit_price);
            int amount=shoppingCartItem[i].getAmount();
            order[i].setAmount(amount);
            int shipping_fee=0;
            order[i].setShipping_fee(shipping_fee);
            float actual_pay=unit_price*amount+shipping_fee;
            order[i].setActual_pay(actual_pay);
            order[i].setAddress_id(Integer.parseInt(address_id));
            Address address=userMapper.selectAddressByID(Integer.parseInt(address_id));
            order[i].setReceiver_name(address.getReceiver_name());
            order[i].setPhone(address.getPhone());
            order[i].setZip_code(address.getZip_code());
            order[i].setAddress(address.getAddress());
            order[i].setReceiver_name(address.getReceiver_name());
            //获取当前系统时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String time=df.format(date).toString();
            order[i].setTime(time);
            order[i].setStatus(0);
        }
        List<String> card_idList=userMapper.getCardID(user.getEmail());
        request.getSession().setAttribute("Order",order);
        request.getSession().setAttribute("card_idList",card_idList);
        session.close();
        map.put("totalPrice",totalPrice);
        return new ModelAndView("redirect:/User/Pay.jsp",map);
    }

    //验证支付密码
    @RequestMapping(value = "ConfirmPayPassword/{totalPrice:.+}",method = RequestMethod.POST)
    public ModelAndView ConfirmPayPassword(@PathVariable("totalPrice") Float totalPrice, @RequestParam("card_id") String card_id,
                                           @RequestParam("pay_password") String pay_password,
                                           HttpServletResponse response, HttpServletRequest request, ModelMap map) throws IOException {
        SqlSession session= MySqlSession.getMySession(response);
        UserMapper mapper = session.getMapper(UserMapper.class);
        User user =(User)request.getSession().getAttribute("user");
        OrderMapper orderMapper = session.getMapper(OrderMapper.class);

        int payPwd=user.getPay_password();
        if(payPwd==Integer.parseInt(pay_password))//判断支付密码是否正确
        {
            Order order[]=(Order[])request.getSession().getAttribute("Order");
            int result[]=new int[order.length];
            for(int i=0;i<order.length;i++)
            {
                //插入self_order表
                result[i]=orderMapper.insertOrder(order[i]);
            }
            //插入transaction表
            Transaction transaction=new Transaction();
            transaction.setOrder_id(order[0].getOrder_id());
            transaction.setCard_id(card_id);
            transaction.setType(0);
            transaction.setMoney(totalPrice);
            float balance=orderMapper.getBalance(user.getEmail());
            balance=balance-totalPrice;
            transaction.setBalance(balance);
            //获取当前系统时间
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            String time=df.format(date).toString();
            transaction.setTime(time);
            String Details=order[0].getOrder_id()+"-"+order[0].getShop_id()+"-"+order[0].getProduct_name();
            transaction.setDetails(Details);
            int result2=orderMapper.InsertTransaction(transaction);

            //删除购物车中提交的数据
            ShoppingCart[] shoppingCartItem=(ShoppingCart[])request.getSession().getAttribute("shoppingCartItem");
            int result3[]=new int[shoppingCartItem.length];
            int result4[]=new int[shoppingCartItem.length];
            int result5[]=new int[shoppingCartItem.length];
            for(int k=0;k<shoppingCartItem.length;k++)
            {
                result3[k]=mapper.deleteCartProduct(shoppingCartItem[k].getCart_id());
                //修改product_property表中商品的库存和销量
                result4[k]=orderMapper.updateProperty(shoppingCartItem[k].getAmount(),shoppingCartItem[k].getProduct_id(),shoppingCartItem[k].getProperty_name());

                //修改product表商品的总库存和销量
                result5[k]=orderMapper.updateProductSales(shoppingCartItem[k].getAmount(),shoppingCartItem[k].getProduct_id());
            }

            boolean a= Utils.notZero(result);
            boolean b= Utils.notZero(result3);
            boolean c= Utils.notZero(result4);
            boolean d= Utils.notZero(result4);
            if(a==true && result2>0 && b==true && c==true && d==true)
            {
                session.commit();
                List<Order> orderList=orderMapper.getOrder(user.getEmail());
                List<ShoppingCart> shoppingCartList=mapper.getCart(user.getEmail());
                map.put("Message","Pay Successfully!");
                request.getSession().setAttribute("orderList",orderList);
                request.getSession().setAttribute("shoppingCartList",shoppingCartList);
                request.getSession().removeAttribute("Order");
                request.getSession().removeAttribute("shoppingCartItem");
            }
        }
        else
        {
            map.put("totalPrice",totalPrice);
            map.put("Message","Wrong Pay Password!");
            return new ModelAndView("redirect:/User/Pay.jsp",map);
        }
        return new ModelAndView("redirect:/User/SelfOrder.jsp",map);
    }
}
