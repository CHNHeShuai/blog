package hs.ssm.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hs.ssm.blog.pojo.Share;
import hs.ssm.blog.pojo.Study;
import hs.ssm.blog.service.ShowShareService;
import hs.ssm.blog.service.ShowStudyService;
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
 * @date 2018/12/10 - 10:31
 */
@Controller
public class web_studyController {
    @Autowired
    private ShowStudyService showStudyService;
    @RequestMapping("/findStudy")
    public String  findShare(Model model,@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
                             @RequestParam(value = "pageSize",defaultValue = "10") Integer pageSize){
        PageHelper.startPage(currentPage,pageSize);
        List<Study> studyList = showStudyService.getStudyList();
        PageInfo<Study> pageInfo = new PageInfo<Study>(studyList);
        model.addAttribute("pageInfo",pageInfo);
        return "select_web_study";
    }

    @RequestMapping("/toAddStudy")
    public String toAddShare(){
        return "add_web_study";
    }

    @RequestMapping("/addStudy")
    public String addShare(Study study, @RequestParam(value = "imageFile") MultipartFile imageFile,
                           HttpServletRequest request){
        //设置图片路径
        String image = UploadImage.uploadImage(imageFile, request);
        study.setImage(image);

        //设置添加时间
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        study.setCreatetime(date);

        showStudyService.addStudy(study);
        return "redirect:/findStudy";
    }

    @RequestMapping("/deleteStudy")
    public String deleteStudy(Integer id){
        showStudyService.deleteStudy(id);
        return "redirect:/findStudy";
    }

    @RequestMapping("/findStudyById")
    @ResponseBody
    public Study findStudyById(Integer id){
        return showStudyService.getStudyById(id);
    }

    @RequestMapping("/editStudy")
    public String updateStudy(Study study,@RequestParam(value = "imageFile",required = false) MultipartFile imageFile,
                              HttpServletRequest request){
        String imagePath = UploadImage.uploadImage(imageFile, request);
        study.setImage(imagePath);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String date = sdf.format(new Date());
        study.setCreatetime(date);

        showStudyService.updateStudy(study);
        return "redirect:/findStudy";
    }
}
