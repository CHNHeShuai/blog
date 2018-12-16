package hs.ssm.blog.service;

import hs.ssm.blog.mapper.CategoryMapper;
import hs.ssm.blog.pojo.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/8 - 14:00
 */
@Service
public class CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    public List<Category> getCategoryList(){
        return categoryMapper.getCategoryList();
    }
}
