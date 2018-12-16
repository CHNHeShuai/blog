package hs.ssm.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hs.ssm.blog.pojo.Study;
import hs.ssm.blog.service.ClickOrderService;
import hs.ssm.blog.service.ShowStudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author hs
 * @date 2018/12/4 - 13:22
 */
@Controller
public class ShowStudyController {
    @Autowired
    private ShowStudyService showStudyService;
    @Autowired
    private ClickOrderService clickOrderService;

    @RequestMapping(value = "/list")
    public String toList(Model model,@RequestParam(value = "currentPage" ,defaultValue = "1") Integer currentPage,
                         @RequestParam(value = "pageSize" ,defaultValue = "6") Integer pageSize) throws ParseException {
        //分页获取数据
        PageHelper.startPage(currentPage,pageSize);
        List<Study> studyList = showStudyService.getStudyList();
        PageInfo<Study> pageInfo = new PageInfo<Study>(studyList);
        //学无止境排行
        List<Study> studyByOrder = clickOrderService.getStudyByOrder();
        model.addAttribute("studyByOrderList",studyByOrder);
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }


}
