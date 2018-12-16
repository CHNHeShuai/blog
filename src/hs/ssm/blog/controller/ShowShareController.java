package hs.ssm.blog.controller;

import com.github.pagehelper.PageInfo;
import hs.ssm.blog.pojo.Share;
import hs.ssm.blog.service.ClickOrderService;
import hs.ssm.blog.service.ShowShareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/4 - 14:00
 */
@Controller
public class ShowShareController {
    @Autowired
    private ClickOrderService clickOrderService;

    @Autowired
    private ShowShareService showShareService;

    @RequestMapping(value = "/share")
    public String toShare(Model model, @RequestParam(value = "currentPage" ,defaultValue = "1") Integer currentPage,
                          @RequestParam(value = "pageSize" ,defaultValue = "6") Integer pageSize){
        //分页获取数据
        PageInfo<Share> shareByPage = showShareService.getShareByPage(currentPage, pageSize);
        //分享排行
        List<Share> shareByOrder = clickOrderService.getShareByOrder();
        model.addAttribute("shareByOrderList",shareByOrder);
        model.addAttribute("pageInfo", shareByPage);
        return "share";
    }



}
