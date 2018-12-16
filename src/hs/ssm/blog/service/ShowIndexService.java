package hs.ssm.blog.service;

import hs.ssm.blog.mapper.IndexnewsMapper;
import hs.ssm.blog.mapper.IndexshareMapper;
import hs.ssm.blog.mapper.IndextuijianMapper;
import hs.ssm.blog.mapper.UsersMapper;
import hs.ssm.blog.pojo.Indexnews;
import hs.ssm.blog.pojo.Indexshare;
import hs.ssm.blog.pojo.Indextuijian;
import hs.ssm.blog.pojo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/3 - 20:43
 */
@Service
public class ShowIndexService {

    @Autowired
    private IndexshareMapper indexshareMapper;

    @Autowired
    private IndextuijianMapper indextuijianMapper;
    @Autowired
    private IndexnewsMapper indexnewsMapper;
    @Autowired
    private UsersMapper usersMapper;

    public List<Indexshare> getIndexshare(){

        return indexshareMapper.getIndexshareList();
    }
    public List<Indextuijian> getIndextuijianList(){
        return  indextuijianMapper.getIndextuijianList();
    }

    public List<Indexnews> getIndexnewsList(){
        return indexnewsMapper.getIndexnewsList();
    }

    public Users getUser(Integer id){
        return usersMapper.getUsers(id);
    }
    public Users getUserByName(String username){
        return usersMapper.getUsersByName(username);
    }

    public Indexshare getIndexshareById(Integer indexshareId){
        return indexshareMapper.getIndexshareById(indexshareId);
    }

    public Indextuijian getIndextuijianById(Integer indextuijianId){
        return indextuijianMapper.getIndextuijianById(indextuijianId);
    }

    public Indexnews getIndexnewsById(Integer indexnewsId){
        return indexnewsMapper.getIndexnewsById(indexnewsId);
    }

    public void addIndexshare(Indexshare indexshare){
        indexshareMapper.addIndexshare(indexshare);
    }


    public void addIndextuijian(Indextuijian indextuijian){
        indextuijianMapper.addIndextuijian(indextuijian);
    }

    public void addIndexnews(Indexnews indexnews){
        indexnewsMapper.addIndexnews(indexnews);
    }

    public void deleteIndexshare(Integer id){
        indexshareMapper.deleteIndexshare(id);
    }

    public void deleteIndexnews(Integer id){
        indexnewsMapper.deleteIndexnews(id);
    }

    public void deleteIndextuijian(Integer id){
        indextuijianMapper.deleteIndextuijian(id);
    }

    public void updateIndexshare(Indexshare indexshare){
        indexshareMapper.updateIndexshare(indexshare);
    }

    public void updateIndextuijian(Indextuijian indextuijian){
        indextuijianMapper.updateIndextuijian(indextuijian);
    }

    public void updateIndexnews(Indexnews indexnews){
        indexnewsMapper.updateIndexnews(indexnews);
    }

    public void updateIndexsharePageview(Integer id){
        indexshareMapper.updateIndexsharePageview(id);
    }

    public void updateIndextuijianPageview(Integer id){
        indextuijianMapper.updateIndextuijianPageview(id);
    }

    public void updateIndexnewsPageview(Integer id){
        indexnewsMapper.updateIndexnewsPageview(id);
    }

    public void updateIndexshareClick(Integer id){
        indexshareMapper.updateIndexshareClick(id);
    }

    public void updateIndexnewsClick(Integer id){
        indexnewsMapper.updateIndexnewsClick(id);
    }

    public void updateIndextuijianClick(Integer id){
        indextuijianMapper.updateIndextuijianClick(id);
    }


}
