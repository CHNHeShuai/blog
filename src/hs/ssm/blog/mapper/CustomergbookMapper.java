package hs.ssm.blog.mapper;


import hs.ssm.blog.pojo.Customergbook;

/**
 * @author hs
 * @date 2018/12/4 - 21:55
 */
public interface CustomergbookMapper {

    public void insertGbook(Customergbook customergbook);

    //根据ID删除留言
    void deleteGbook(Integer id);

}
