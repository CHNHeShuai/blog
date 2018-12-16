package hs.ssm.blog.mapper;

import hs.ssm.blog.pojo.Indexnews;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/3 - 20:36
 */
public interface IndexnewsMapper {
    List<Indexnews> getIndexnewsList();

    Indexnews getIndexnewsById(Integer id);

    void addIndexnews(Indexnews indexnews);

    void deleteIndexnews(Integer id);

    void updateIndexnews(Indexnews indexnews);

    void updateIndexnewsPageview(Integer id);

    void updateIndexnewsClick(Integer id);

}
