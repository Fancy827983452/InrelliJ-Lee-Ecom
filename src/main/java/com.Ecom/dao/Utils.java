package com.Ecom.dao;

import com.Ecom.mapper.ProductMapper;
import com.Ecom.model.ProductPicture;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

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

    //去除map中value相同的元素，保留key最小的那个值
    public static Map<Integer,String> RemoveRepFromMap(Map<Integer,String> map){

        Set<Map.Entry<Integer,String>> set = map.entrySet();
        List<Map.Entry<Integer,String>> list = new ArrayList<Map.Entry<Integer,String>>(set);

        //重载compare函数  对list集合进行排序，根据value值进行排序，
        Collections.sort(list,new Comparator<Map.Entry<Integer,String>>(){
            public int compare(Map.Entry<Integer,String> entry1, Map.Entry<Integer,String> entry2){
                return Integer.valueOf(entry1.getValue().hashCode()-entry2.getValue().hashCode());
            }
        });

        for(int i=0;i<list.size();i++)
        {//删除重复的元素
            Integer key = list.get(i).getKey();
            String value = list.get(i).getValue();

            int j=i+1;//map中的下一个
            if(j<list.size()){
                Integer next_key = list.get(j).getKey();
                String next_value = list.get(j).getValue();

                if(value == next_value){
                    if(key.hashCode() < next_key.hashCode()) {
                        map.remove(next_key);
                    }list.remove(j);
                }else{
                    map.remove(key);list.remove(i);
                }
                i--;
            }
        }
        return map;
    }

    public static boolean notZero(int[] a) {
        for (int i = 0; i < a.length; i++) {
            if (a[i] != 0) {
                continue;
            }
            else
                return false;
        }
        return true;//不为0
    }
}
