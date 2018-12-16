package hs.ssm.blog.controller;

import hs.ssm.blog.service.CustomerService;
import hs.ssm.blog.service.CustomergbookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.ParseException;
import java.util.List;

/**
 * @author hs
 * @date 2018/12/6 - 13:14
 */
@Controller
public class CustomergbookController {
    @Autowired
    private CustomergbookService customergbookService;
    @Autowired
    private CustomerService customerService;

    @RequestMapping(value = "/writeGbook")
    public String writeGbook(String article,Integer custId) throws ParseException {
        customergbookService.insertGbook(article,custId);
        return "redirect:/gbook";
    }

    //查询客户和留言
    @RequestMapping(value = "/findGbook")
    public String findGbook(Model model){
        List customergbookList = customerService.getCustomergbook();
        model.addAttribute("customergbookList",customergbookList);
        return "selectGbook";
    }

    //根据Id删除客户留言
    @RequestMapping(value = "/deleteGbook")
    public String deleteGbook(Integer cgid){
        customergbookService.deleteGbook(cgid);
        return "redirect:/findGbook";
    }

}
