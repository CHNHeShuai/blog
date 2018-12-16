package hs.ssm.blog.service;

import hs.ssm.blog.mapper.StudyMapper;
import hs.ssm.blog.pojo.Study;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/4 - 13:23
 */
@Service
public class ShowStudyService {

    @Autowired
    private StudyMapper studyMapper;

    public List<Study> getStudyList(){
        return studyMapper.getStudyList();
    }

    public Study getStudyById(Integer id){
        return studyMapper.getStudyById(id);
    }

    public void addStudy(Study study){
        studyMapper.addStudy(study);
    }


    public void deleteStudy(Integer id){
        studyMapper.deleteStudy(id);
    }

    public void updateStudy(Study study){
        studyMapper.updateStudy(study);
    }

    public void updateStudyPageview(Integer id){
        studyMapper.updateStudyPageview(id);
    }
    public void updateStudyClick(Integer id){
        studyMapper.updateStudyClick(id);
    }
}
