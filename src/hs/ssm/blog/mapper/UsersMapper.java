package hs.ssm.blog.mapper;

import hs.ssm.blog.pojo.Indexnews;
import hs.ssm.blog.pojo.Users;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/3 - 20:36
 */
public interface UsersMapper {
    Users getUsers(Integer id);

    //根据博主ID修改博主信息
    void updateUsers(Users users);

    //查询博主信息
    Users findUsers(Integer id);

    //根据ID修改密码
    void updatePassword(String password);

    Users getUsersByName(String username);

}
