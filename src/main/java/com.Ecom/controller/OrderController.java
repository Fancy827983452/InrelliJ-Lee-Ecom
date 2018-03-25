package com.Ecom.controller;

import com.Ecom.dao.MySqlSession;
import com.Ecom.mapper.OrderMapper;
import com.Ecom.mapper.UserMapper;
import com.Ecom.model.Order;
import com.Ecom.model.ShoppingCart;
import com.Ecom.model.Transaction;
import com.Ecom.model.User;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
                transaction.setBalance(transactionList.get(i).getBalance());
                //获取当前系统时间
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = new Date();
                String time=df.format(date).toString();
                transaction.setTime(time);
                transaction.setDetails("Refund:"+transactionList.get(i).getDetails());
            }
        }

        int result1=orderMapper.ConfirmReceived(4,Integer.parseInt(order_id),user.getEmail());
        int result2=orderMapper.Refund(transaction);

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
        return new ModelAndView("redirect:/User/SubmitOrder.jsp");
    }
}
