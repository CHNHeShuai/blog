package hs.ssm.blog.controller;

import hs.ssm.blog.pojo.Category;
import hs.ssm.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/8 - 13:38
 */
@Controller
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/findCategoryList")
    @ResponseBody
    public List<Category> findCategoryList(){
        return categoryService.getCategoryList();
    }
}
