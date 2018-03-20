package com.Ecom.dao;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UploadImageHelper {

    //ArrayList用于存储非文件类型的其他数据，使用Map类，String用作key，object当value方便进行转换
    public static ArrayList <Map <String, Object>> itemlist= new ArrayList <Map <String, Object>>();

    //另一个ArrayList用于对多个图片文件进行存储，方便添加
    public static ArrayList <Map <String, byte[]>> picturelist = new ArrayList <Map <String, byte[]>>();

    //插入商品的图片
    public static void addProductPicture(HttpServletRequest request) throws Exception {
            //FileInputStream获取传来文件的输入流
            FileInputStream fis = null;
            //字节数组用于存储输入流
            byte[] imgByte = null;

            //apache common file upload 库的方法，获取相应的图片数据,需要在dependency中添加org.apache.commons.fileupload
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List <FileItem> parseRequest = upload.parseRequest(request);

            if (parseRequest != null) {
                for (FileItem item : parseRequest) {
                    //添加计数器 为图片计数，方便之后通过顺序调取
                    //int imgNum = 0;
                    //判断是否为普通字段数据
                    if (item.isFormField()) {
                        Map <String, Object> rowData = new HashMap <String, Object>();
                        rowData.put(item.getFieldName(), new String(item.get(), "UTF-8"));
                        itemlist.add(rowData);
                    } else {
                        //是文件上传，获取文件的名字
                        fis = (FileInputStream) item.getInputStream();
                        //获取流大小，确定byte数组大小
                        imgByte = new byte[fis.available()];
                        //输入流
                        fis.read(imgByte);

                        //存储进arraylist中
                        Map <String, byte[]> imgData = new HashMap <String, byte[]>();
                        imgData.put("picture", imgByte);
                        picturelist.add(imgData);
                    }
                }
            }
        }

    public static void showImg(byte[] imgByte, HttpServletResponse response,HttpServletRequest request) throws IOException {
        if (imgByte.length!=0) {
            response.setContentType("image/jpeg");
            OutputStream outputStream = response.getOutputStream();

            outputStream.write(imgByte);
            outputStream.flush();
            outputStream.close();
        }
    }
}
