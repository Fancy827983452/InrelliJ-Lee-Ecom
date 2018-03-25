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

    //获取重复元素重复了几次
    public int[] getRepeatNum(Map<Object,Object> map)
    {
        Object keys[]=getKeys(map);
        Object values[]=getValues(map);
        int size=map.size();
        int repeatNum[]=new int[size];
        for(int i=0;i<size;i++)
        {
            repeatNum[i]=0;
            for(int j=i+1;j<size;j++)
            {
                if(values[i].equals(values[j]))
                {
                    repeatNum[i]++;
                }
            }
        }
        repeatNum=removeZero(repeatNum);
        return repeatNum;
    }

    public int[] removeZero(int[] a) {
        int j = 0;
        // 这个for循环计算出你传入的这个数组去掉0后的长度
        for (int i = 0; i < a.length; i++) {
            if (a[i] != 0) {
                j++;
            }
        }
        // 定义数组的长度
        int[] newarr = new int[j];
        j = 0;
        // 将不为零的copy到新数组中去
        for (int i = 0; i < a.length; i++) {
            if (a[i] != 0) {
                newarr[j] = a[i];
                j++;
            }
        }
        return newarr;
    }

    //去除map中value相同的元素，保留key最小的那个值
    public Map<Object,Object> RemoveRepFromMap(Map<Object,Object> map)
    {
        Object keys[]=getKeys(map);
        Object values[]=getValues(map);
        int size=map.size();
        int index[]=new int[size];
        for(int i=0;i<size;i++)
        {
            for(int j=i+1;j<size;j++)
            {
                if(values[i].equals(values[j]))
                {
                    index[i]=Integer.parseInt(keys[j].toString());
                }
            }
        }
        for(int i=0;i<index.length;i++)
        {
            if(index[i]!=0)
                map.remove(index[i]);
        }
        return map;
    }

    public Object[] getKeys(Map<Object,Object> map)
    {
        Iterator iter = map.entrySet().iterator();
        Object keys[]=new Object[map.size()];
        int i=0;
        while (iter.hasNext()) {
            Map.Entry entry = (Map.Entry) iter.next();
            Object key = entry.getKey();
            keys[i]=key;
            i++;
        }
        return keys;
    }

    public Object[] getValues(Map<Object,Object> map)
    {
        Iterator iter = map.entrySet().iterator();
        Object values[]=new Object[map.size()];
        int i=0;
        while (iter.hasNext()) {
            Map.Entry entry = (Map.Entry) iter.next();
            Object value = entry.getValue();
            values[i]=value;
            i++;
        }
        return values;
    }

    public static void main(String[] args) {
        Map<Object,Object> map=new HashMap<Object,Object>();
        map.put(1,"123");
        map.put(2,"123");
        map.put(3,"789's Shop");
        map.put(4,"789's Shop");

        Utils utils=new Utils();
        int []a=utils.getRepeatNum(map);
        map=utils.RemoveRepFromMap(map);
        System.out.println(map);
        for(int i=0;i< a.length;i++)
            System.out.println(a[i]);
    }
}
