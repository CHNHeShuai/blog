package hs.ssm.blog.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hs.ssm.blog.pojo.*;
import hs.ssm.blog.service.ClickOrderService;
import hs.ssm.blog.service.ShowIndexService;
import hs.ssm.blog.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author hs
 * @date 2018/12/3 - 20:33
 */
@Controller
public class ShowIndexController {
    @Autowired
    private ClickOrderService clickOrderService;
    @Autowired
    private ShowIndexService showIndexService;
    @Autowired
    private UsersService usersService;
    @RequestMapping(value = "/")
    public String showIndex(Model model, HttpSession session)                              {
        List<Indexshare> indexshareList = null;
        List<Indextuijian> indextuijianList = null;
        List<Indexnews> indexnewsList = null;
        Users user = null;
        try {
            //获取首页分享的内容
            indexshareList = showIndexService.getIndexshare();
            //获取首页推荐的内容
            indextuijianList = showIndexService.getIndextuijianList();
            //获取首页新闻内容
            indexnewsList = showIndexService.getIndexnewsList();
            //获取用户信息
            user = showIndexService.getUser(1);
            Weizhi weiZhiById = usersService.findWeiZhiById(1);
            //根据访问量获取排行榜
            List<Study> studyByOrderPageview = clickOrderService.getStudyByOrderPageview();
            //将获取的数据存储到域中
            model.addAttribute("studyByOrder",studyByOrderPageview);
            model.addAttribute("indexshareList",indexshareList);
            model.addAttribute("indextuijianList",indextuijianList);
            model.addAttribute("indexnewsList",indexnewsList);
            session.setAttribute("user",user);
            session.setAttribute("weizhi",weiZhiById);
            return "index";
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    @RequestMapping(value = "/about")
    public String toAbout(){
        return "about";
    }



}
