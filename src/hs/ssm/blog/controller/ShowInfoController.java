package hs.ssm.blog.controller;

import hs.ssm.blog.mapper.ShareMapper;
import hs.ssm.blog.pojo.*;
import hs.ssm.blog.service.ShowIndexService;
import hs.ssm.blog.service.ShowShareService;
import hs.ssm.blog.service.ShowStudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author hs
 * @date 2018/12/4 - 14:22
 */
@Controller
public class ShowInfoController {
    @Autowired
    private ShowIndexService showIndexService;

    @Autowired
    private ShowShareService showShareService;

    @Autowired
    private ShowStudyService showStudyService;

    /*@RequestMapping(value = "/info")
    public String toInfo(){
        return "info";
    }*/

    @RequestMapping(value = "/indexShareInfo")
    public String IndexShareInfo(Model model , int indexShareId){
        //先更新数据库
        //根据id更新访问量
        showIndexService.updateIndexsharePageview(indexShareId);
        //再查询访问量
        Indexshare indexshare = showIndexService.getIndexshareById(indexShareId);
        model.addAttribute("message",indexshare);
        return "info";
    }

    @RequestMapping(value = "/indextuijianInfo")
    public String IndexTuijianInfo(Model model , int indextuijianId){
        //根据id更新访问量
        showIndexService.updateIndextuijianPageview(indextuijianId);
        //再查询访问量
        Indextuijian indextuijian = showIndexService.getIndextuijianById(indextuijianId);
        model.addAttribute("message",indextuijian);
        return "info";
    }


    @RequestMapping(value = "/indexnewsInfo")
    public String IndexnewsInfo(Model model , int indexnewsId){
        //根据id更新访问量
        showIndexService.updateIndexnewsPageview(indexnewsId);
        //再查询访问量
        Indexnews indexnews = showIndexService.getIndexnewsById(indexnewsId);
        model.addAttribute("message",indexnews);
        return "info";
    }

    @RequestMapping(value = "/shareInfo")
    public String ShareInfo(Model model , int shareId){
        //根据id更新访问量
        showShareService.updateSharePageview(shareId);
        //再查询访问量
        Share share = showShareService.getShareById(shareId);
        model.addAttribute("message",share);
        return "info";
    }


    @RequestMapping(value = "/studyInfo")
    public String StudyInfo(Model model , int studyId){
        //根据id更新访问量
        showStudyService.updateStudyPageview(studyId);
        //再查询访问量
        Study study = showStudyService.getStudyById(studyId);
        model.addAttribute("message",study);
        return "info";
    }


    @RequestMapping(value = "/addIndexshareClick")
    @ResponseBody
    public Indexshare addIndexshareClick(Integer id){
        showIndexService.updateIndexshareClick(id);
        Indexshare indexshareById = showIndexService.getIndexshareById(id);
        return indexshareById;
    }

    @RequestMapping("/addIndexnewsClick")
    @ResponseBody
    public Indexnews addIndexnewsClick(Integer id){
        showIndexService.updateIndexnewsClick(id);
        Indexnews indexnewsById = showIndexService.getIndexnewsById(id);
        return indexnewsById;
    }
    @RequestMapping("/addIndextuijianClick")
    @ResponseBody
    public Indextuijian addIndextuijianClick(Integer id){
        showIndexService.updateIndextuijianClick(id);
        Indextuijian indextuijianById = showIndexService.getIndextuijianById(id);
        return indextuijianById;
    }
    @RequestMapping("/addShareClick")
    @ResponseBody
    public Share addShareClick(Integer id){
        showShareService.updateShareClick(id);
        Share shareById = showShareService.getShareById(id);
        return shareById;
    }
    @RequestMapping("/addStudyClick")
    @ResponseBody
    public Study addStudyClick(Integer id){
        showStudyService.updateStudyClick(id);
        Study studyById = showStudyService.getStudyById(id);
        return studyById;
    }

}
