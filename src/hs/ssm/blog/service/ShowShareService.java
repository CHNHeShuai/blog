package hs.ssm.blog.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hs.ssm.blog.mapper.ShareMapper;
import hs.ssm.blog.pojo.Share;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.print.Doc;
import java.util.List;

/**
 * @author hs
 * @date 2018/12/4 - 14:01
 */
@Service
public class ShowShareService {

    @Autowired
    private ShareMapper shareMapper;
    public List<Share> getShareList(){
        return shareMapper.getShareList();
    }

    public Share getShareById(Integer id){
        return shareMapper.getShareById(id);
    }

    public void addShare(Share share){
        shareMapper.addShare(share);
    }

    public void deleteShare(Integer id){
        shareMapper.deleteShare(id);
    }

    public void updateShare(Share share){
        shareMapper.updateShare(share);
    }

    public void updateSharePageview(Integer id){
        shareMapper.updateSharePageview(id);
    }
    public void updateShareClick(Integer id){
        shareMapper.updateShareClick(id);
    }

    //使用pagehelper插件进行分页查询
    public PageInfo<Share> getShareByPage(Integer currentPage,Integer pageSize){

        PageHelper.startPage(currentPage, pageSize);
        //获取所有share
        List<Share> shareByPage = shareMapper.getShareList();
        //将获得的share添加到pageInfo中并返回
        PageInfo<Share> pageInfo = new PageInfo<>(shareByPage);
        return pageInfo;
    }

    public Long getShareCount(){
        Long shareCount = shareMapper.getShareCount();
        return shareCount;
    }
}
