package hs.ssm.blog.mapper;

import hs.ssm.blog.pojo.Indextuijian;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/3 - 20:36
 */
public interface IndextuijianMapper {
    List<Indextuijian> getIndextuijianList();

    Indextuijian getIndextuijianById(Integer id);

    void addIndextuijian(Indextuijian indextuijian);

    void deleteIndextuijian(Integer id);

    void updateIndextuijian(Indextuijian indextuijian);

    void updateIndextuijianPageview(Integer id);
    void updateIndextuijianClick(Integer id);

}
