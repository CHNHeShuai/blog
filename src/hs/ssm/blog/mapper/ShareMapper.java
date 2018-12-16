package hs.ssm.blog.mapper;

import hs.ssm.blog.pojo.Indextuijian;
import hs.ssm.blog.pojo.Share;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/3 - 20:36
 */
public interface ShareMapper {
    List<Share> getShareList();

    Share getShareById(Integer id);

    void addShare(Share share);
    void deleteShare(Integer id);
    void updateShare(Share share);
    void updateSharePageview(Integer id);
    void updateShareClick(Integer id);
    List<Share> getShareByPage(Integer currentPage,Integer pageSize);

    Long getShareCount();

    List<Share> getShareByOrder();
}
