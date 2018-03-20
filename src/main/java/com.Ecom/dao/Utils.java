package com.Ecom.dao;

import com.Ecom.mapper.ProductMapper;
import com.Ecom.model.ProductPicture;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

public class Utils {
    public static boolean isAllTrue(Boolean[] bools)
    {
        List<Boolean> boolList = Arrays.asList(bools);
        if (boolList.contains(false))
        {
            return false;
        }

        return true;
    }

    //获取商品的一个图片
    public static ProductPicture selectProductPicture(int product_id,int sequence, HttpServletResponse response) throws IOException {
        SqlSession session = MySqlSession.getMySession(response);
        ProductMapper mapper = session.getMapper(ProductMapper.class);
        ProductPicture productPicutre = new ProductPicture();
        productPicutre.setProduct_id(product_id);
        productPicutre.setSequence(sequence);
        return mapper.getProductPictureBySequence(productPicutre);
    }

    public List<ProductPicture> getProductPictures(int product_id,HttpServletResponse response) throws IOException {
        SqlSession session = MySqlSession.getMySession(response);
        ProductMapper mapper = session.getMapper(ProductMapper.class);
        return mapper.getProductPictureList(product_id);
    }
}
