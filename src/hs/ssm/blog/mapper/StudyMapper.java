package hs.ssm.blog.mapper;

import hs.ssm.blog.pojo.Indexnews;
import hs.ssm.blog.pojo.Study;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/3 - 20:36
 */
public interface StudyMapper {
    List<Study> getStudyList();

    Study getStudyById(Integer id);

    void addStudy(Study study);

    void deleteStudy(Integer id);

    void updateStudy(Study study);

    void updateStudyPageview(Integer id);
    void updateStudyClick(Integer id);

    List<Study> getStudyByOrder();

    List<Study> getStudyByOrderPageview();
}
