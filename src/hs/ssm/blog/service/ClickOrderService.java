package hs.ssm.blog.service;

import hs.ssm.blog.mapper.ShareMapper;
import hs.ssm.blog.mapper.StudyMapper;
import hs.ssm.blog.pojo.Share;
import hs.ssm.blog.pojo.Study;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/12 - 13:20
 */
@Service
public class ClickOrderService {

    @Autowired
    private ShareMapper shareMapper;
    @Autowired
    private StudyMapper studyMapper;

    public List<Share> getShareByOrder(){
        return shareMapper.getShareByOrder();
    }

    public List<Study> getStudyByOrder(){
        return studyMapper.getStudyByOrder();
    }

    public List<Study> getStudyByOrderPageview (){
        return studyMapper.getStudyByOrderPageview();
    }



}
