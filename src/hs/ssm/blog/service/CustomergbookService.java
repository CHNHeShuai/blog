package hs.ssm.blog.service;

import hs.ssm.blog.mapper.CustomergbookMapper;
import hs.ssm.blog.pojo.Customergbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author hs
 * @date 2018/12/6 - 13:21
 */
@Service
public class CustomergbookService {
    @Autowired
    private CustomergbookMapper customergbookMapper;

    Customergbook customergbook = new Customergbook();

    public void insertGbook(String article,Integer custId) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        customergbook.setArticle(article);
        customergbook.setCustId(custId);
        customergbook.setCreatetime(date);
        customergbookMapper.insertGbook(customergbook);

    }

    public void deleteGbook(Integer id){
        customergbookMapper.deleteGbook(id);
    }
}
