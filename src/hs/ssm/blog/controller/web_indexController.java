package hs.ssm.blog.controller;

import hs.ssm.blog.pojo.Indexnews;
import hs.ssm.blog.pojo.Indexshare;
import hs.ssm.blog.pojo.Indextuijian;
import hs.ssm.blog.service.ShowIndexService;
import hs.ssm.blog.utils.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @author hs
 * @date 2018/12/7 - 9:59
 */
@Controller
public class web_indexController {

    @Autowired
    private ShowIndexService showIndexService;

    @RequestMapping("/webIndex")
    public String toWebIndex2(){

        return "index2";
    }

    @RequestMapping("/findIndexshare")
    public String toFindIndexshare(Model model){
        List<Indexshare> indexshareList = showIndexService.getIndexshare();
        model.addAttribute("indexshareList",indexshareList);
        return "select_web_indexshare";
    }

    @RequestMapping("/addIndexshare")
    public String addIndexshare(Indexshare indexshare, @RequestParam(value = "imageFile") MultipartFile imageFile,
                                HttpServletRequest request){
        //设置图片路径
        String image = UploadImage.uploadImage(imageFile, request);
        indexshare.setImage(image);

        //设置添加时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        indexshare.setCreatetime(date);


        showIndexService.addIndexshare(indexshare);
        return "redirect:/findIndexshare";
    }

    @RequestMapping("/toAddIndexshare")
    public String toAddIndexshare(){
        return "add_web_indexshare";
    }


    @RequestMapping("/findIndextuijian")
    public String findIndextuijian(Model model){
        List<Indextuijian> indextuijianList = showIndexService.getIndextuijianList();
        model.addAttribute("indextuijianList",indextuijianList);
        return "select_web_indextuijian";
    }
    @RequestMapping("/toAddIndextuijian")
    public String toAddIndextuijian(){
        return "add_web_indextuijian";
    }

    @RequestMapping("/addIndextuijian")
    public String addIndextuijian(Indextuijian indextuijian, @RequestParam(value = "imageFile") MultipartFile imageFile,
                                  HttpServletRequest request){
        //设置图片路径
        String image = UploadImage.uploadImage(imageFile, request);
        indextuijian.setImage(image);

        //设置添加时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        indextuijian.setCreatetime(date);

        showIndexService.addIndextuijian(indextuijian);
        return "redirect:/findIndextuijian";
    }

    @RequestMapping("/findIndexnews")
    public String findIndexnews(Model model){
        List<Indexnews> indexnewsList = showIndexService.getIndexnewsList();
        model.addAttribute("indexnewsList",indexnewsList);
        return "select_web_indexnews";
    }

    @RequestMapping("/toAddIndexnews")
    public String toAddIndexnews(){
        return "add_web_indexnews";
    }

    @RequestMapping("/addIndexnews")
    public String addIndexnews(Indexnews indexnews, @RequestParam(value = "imageFile") MultipartFile imageFile,
                               HttpServletRequest request){
        //设置图片路径
        String image = UploadImage.uploadImage(imageFile, request);
        indexnews.setImage(image);

        //设置添加时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        indexnews.setCreatetime(date);

        showIndexService.addIndexnews(indexnews);
        return "redirect:/findIndexnews";
    }

    @RequestMapping("/deleteIndexshare")
    public String deleteIndexshare(Integer id){
        showIndexService.deleteIndexshare(id);
        return "redirect:/findIndexshare";
    }
    @RequestMapping("/deleteIndextuijian")
    public String deleteIndextuijian(Integer id){
        showIndexService.deleteIndextuijian(id);
        return "redirect:/findIndextuijian";
    }
    @RequestMapping("/deleteIndexnews")
    public String deleteIndexnews(Integer id){
        showIndexService.deleteIndexnews(id);
        return "redirect:/findIndexnews";
    }

    @RequestMapping("/findIndexshareById")
    @ResponseBody
    public Indexshare findIndexshareById(Integer id){
        Indexshare indexshare = showIndexService.getIndexshareById(id);
        return indexshare;
    }
    @RequestMapping("/findIndextuijianById")
    @ResponseBody
    public Indextuijian findIndextuijianById(Integer id){
        Indextuijian indextuijian = showIndexService.getIndextuijianById(id);
        return indextuijian;
    }
    @RequestMapping("/findIndexnewsById")
    @ResponseBody
    public Indexnews findIndexnewsById(Integer id){
        Indexnews indexnews = showIndexService.getIndexnewsById(id);
        return indexnews;
    }

    @RequestMapping("/editIndexshare")
    public String editIndexshare(Indexshare indexshare,@RequestParam(value = "imageFile",required = false) MultipartFile imageFile,
                                 HttpServletRequest request){
        String imagePath = UploadImage.uploadImage(imageFile, request);
        indexshare.setImage(imagePath);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(new Date());
        indexshare.setCreatetime(date);

        showIndexService.updateIndexshare(indexshare);
        return "redirect:/findIndexshare";
    }
    @RequestMapping("/editIndextuijian")
    public String editIndextuijian(Indextuijian indextuijian,@RequestParam(value = "imageFile",required = false) MultipartFile imageFile,
                                 HttpServletRequest request){
        String imagePath = UploadImage.uploadImage(imageFile, request);
        indextuijian.setImage(imagePath);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(new Date());
        indextuijian.setCreatetime(date);

        showIndexService.updateIndextuijian(indextuijian);
        return "redirect:/findIndextuijian";
    }
    @RequestMapping("/editIndexnews")
    public String editIndexnews(Indexnews indexnews,@RequestParam(value = "imageFile",required = false) MultipartFile imageFile,
                                 HttpServletRequest request){
        String imagePath = UploadImage.uploadImage(imageFile, request);
        indexnews.setImage(imagePath);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(new Date());
        indexnews.setCreatetime(date);

        showIndexService.updateIndexnews(indexnews);
        return "redirect:/findIndexnews";
    }

}
