package hs.ssm.blog.mapper;

import hs.ssm.blog.pojo.Indexshare;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/3 - 20:36
 */
public interface IndexshareMapper {
    List<Indexshare> getIndexshareList();

    Indexshare getIndexshareById(Integer id);

    void addIndexshare(Indexshare indexshare);

    void deleteIndexshare(Integer id);
    //修改indexshare
    void updateIndexshare(Indexshare indexshare);

    void updateIndexsharePageview(Integer id);

    void updateIndexshareClick(Integer id);
}
