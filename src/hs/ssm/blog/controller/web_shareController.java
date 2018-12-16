package hs.ssm.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hs.ssm.blog.pojo.Share;
import hs.ssm.blog.service.ShowShareService;
import hs.ssm.blog.utils.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author hs
 * @date 2018/12/10 - 10:16
 */
@Controller
public class web_shareController {

    @Autowired
    private ShowShareService showShareService;
    @RequestMapping("/findShare")
    public String  findShare(Model model,@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
                             @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize){
        PageHelper.startPage(currentPage,pageSize);
        List<Share> shareList = showShareService.getShareList();
        PageInfo<Share> pageInfo = new PageInfo<Share>(shareList);
        model.addAttribute("pageInfo",pageInfo);
        return "select_web_share";
    }

    @RequestMapping("/toAddShare")
    public String toAddShare(){
        return "add_web_share";
    }

    @RequestMapping("/addShare")
    public String addShare(Share share, @RequestParam(value = "imageFile") MultipartFile imageFile,
                           HttpServletRequest request){
        //设置图片路径
        String image = UploadImage.uploadImage(imageFile, request);
        share.setImage(image);

        //设置添加时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        share.setCreatetime(date);

        showShareService.addShare(share);
        return "redirect:/findShare";
    }

    @RequestMapping("/deleteShare")
    public String deleteShare(Integer id){
        showShareService.deleteShare(id);
        return "redirect:/findShare";
    }
    @RequestMapping(value = "/findShareById")
    @ResponseBody
    public Share findShareById(Integer id){
        return showShareService.getShareById(id);
    }

    @RequestMapping("/editShare")
    public String updateShare(Share share,@RequestParam(value = "imageFile",required = false) MultipartFile imageFile,
                              HttpServletRequest request){
        String imagePath = UploadImage.uploadImage(imageFile, request);
        share.setImage(imagePath);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(new Date());
        share.setCreatetime(date);

        showShareService.updateShare(share);
        return "redirect:/findShare";
    }
}
