package hs.ssm.blog.service;

import hs.ssm.blog.mapper.UsersMapper;
import hs.ssm.blog.mapper.WeizhiMapper;
import hs.ssm.blog.pojo.Users;
import hs.ssm.blog.pojo.Weizhi;
import hs.ssm.blog.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author hs
 * @date 2018/12/7 - 19:53
 */
@Service
public class UsersService {

    @Autowired
    private WeizhiMapper weizhiMapper;

    @Autowired
    private UsersMapper usersMapper;

    public void updateUsers(Users users){
        //加密密码
        //String password = MD5Utils.md5(users.getPassword());
        //users.setPassword(password);

        usersMapper.updateUsers(users);
    }

    public Users findUsers(Integer id){
        return usersMapper.findUsers(id);
    }

    public void updatePassword(String password){
        password = MD5Utils.md5(password);
        usersMapper.updatePassword(password);
    }

    public Weizhi findWeiZhiById(Integer id){
       return weizhiMapper.findWeiZhi(id);
    }

    public void updateWeizhi(Weizhi weizhi){
        weizhiMapper.updateWeizhi(weizhi);
    }
}
