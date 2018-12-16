package hs.ssm.blog.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @author hs
 * @date 2018/12/8 - 14:57
 */
public class UploadImage {

    public static String  uploadImage(MultipartFile fileName ,HttpServletRequest request){

        //获取项目物理路径
        String rootPath = request.getSession().getServletContext().getRealPath("");
        String path = "";
        if(!fileName.isEmpty()){
            //生成UUID作为文件名
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            //获取文件类型
            String contentType = fileName.getContentType();
            //获取文件后缀名
            String imageName = contentType.substring(contentType.indexOf("/") + 1);
            path = "upload/"+uuid+"."+imageName;
            //将文件上传到该路径   项目路径+文件相对路径  相当于创建一个文件
            try {
                fileName.transferTo(new File(rootPath+"/"+path));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        //返回图片的路径
        return path;
    }


}
