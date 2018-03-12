package com.Ecom.controller;

import com.Ecom.dao.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;

@Controller
public class DeleteController {
    @RequestMapping(value="delete",method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView update(@RequestParam("email") String email, HttpServletResponse response, ModelMap map) throws IOException {
        response.setContentType("text/html;charset=utf-8");
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession(true);

        UserMapper mapper = session.getMapper(UserMapper.class);
        int i=mapper.delete(email);
        session.close();
        ModelAndView mv = new ModelAndView();
        if(i==1) {
            map.put("Message", "Delete Successfully!");
            return new ModelAndView("redirect:index.jsp", map);
        }
        else
        {
            map.put("Message", "Delete Failed!");
            return new ModelAndView("redirect:index.jsp", map);
        }
    }
}
