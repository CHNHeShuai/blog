package hs.ssm.blog.mapper;

import hs.ssm.blog.pojo.Weizhi;

/**
 * @author hs
 * @date 2018/12/11 - 11:19
 */
public interface WeizhiMapper {

    Weizhi findWeiZhi(Integer id);

    void updateWeizhi(Weizhi weizhi);
}
