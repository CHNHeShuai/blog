package hs.ssm.blog.controller;

import hs.ssm.blog.pojo.Users;
import hs.ssm.blog.service.ShowIndexService;
import hs.ssm.blog.service.UsersService;
import hs.ssm.blog.pojo.Weizhi;
import hs.ssm.blog.utils.MD5Utils;
import hs.ssm.blog.utils.UploadImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author hs
 * @date 2018/12/6 - 21:39
 */
@Controller
public class UserController {

    @Autowired
    private ShowIndexService showIndexService;
    @Autowired
    private UsersService usersService;

    @RequestMapping("/userLogin")
    public String toUserlogin(){
        return "userLogin";
    }

    @RequestMapping("/toWebIndex")
    public String toUserLogin(Users users, Model model){
        //根据用户名查询该用户是否存在
        Users user = showIndexService.getUserByName(users.getUsername());
        if(user!=null){
            //判断输入的密码是否正确
            String input_password = MD5Utils.md5(users.getPassword());
            String user_Password = user.getPassword();
            if(input_password.equals(user_Password)){
                return "web_index";
            }else{
                model.addAttribute("passwordCheck","密码错误");
                return "userLogin";
            }

        }else{
            model.addAttribute("usernameCheck","该用户不是系统管理员");
            return "userLogin";
        }

    }

    //更新博主信息
    @RequestMapping("/updateUser")
    public String updateUser(Model model,Users users,@RequestParam(value = "imageFile",required = false) MultipartFile imageFile
                ,@RequestParam(value = "weixinFile",required = false) MultipartFile weixinFile,HttpServletRequest request){

            String imagePath = UploadImage.uploadImage(imageFile, request);

            String weixinPath = UploadImage.uploadImage(weixinFile, request);
            users.setImage(imagePath);
            users.setWeixin(weixinPath);
            usersService.updateUsers(users);
            return "redirect:/findUser?id="+users.getId();
    }

    //查询博主信息
    @RequestMapping("/findUser")
    public String findUser(Integer id,HttpSession session){
        Users users = usersService.findUsers(id);
        session.removeAttribute("user");
        session.setAttribute("user",users);
        return "web_index";
    }

    //更新博主页面
    @RequestMapping("/toUpdateUser")
    public String toUpdateUser(){
        return "updateUser";
    }

    //单独跳往首页
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "web_index";
    }

    //单独跳往修改密码页面
    @RequestMapping("/toUpdatePassword")
    public String toUpdatePassword(){
        return "updatePassword";
    }

    //修改密码
    @RequestMapping("/updatePassword")
    public String updatePassword(String password){
        usersService.updatePassword(password);
        return "redirect:/findUser?id=1";
    }


    @RequestMapping("/findWeiZhi")
    public String findWeiZhi(Integer id,Model model){
        Weizhi weiZhiById = usersService.findWeiZhiById(id);
        model.addAttribute("weizhi",weiZhiById);
        return "findWeiZhi";
    }

    @RequestMapping("/findWeizhiById")
    @ResponseBody
    public Weizhi findWeizhiById(Integer id){
        Weizhi weiZhiById = usersService.findWeiZhiById(id);
        return weiZhiById;
    }

    @RequestMapping("/updateWeizhi")
    public String updateWeizhi(Weizhi weizhi,Model model,@RequestParam(value = "weixinimage",required = false) MultipartFile weixinimage
            ,@RequestParam(value = "zhifubaoimage",required = false) MultipartFile zhifubaoimage,HttpServletRequest request){
        String weixinPath = UploadImage.uploadImage(weixinimage, request);

        String zhifubaoPath = UploadImage.uploadImage(zhifubaoimage, request);
        weizhi.setWeixin(weixinPath);
        weizhi.setZhifubao(zhifubaoPath);

        usersService.updateWeizhi(weizhi);
        return "redirect:/findWeiZhi?id="+weizhi.getId();
    }

}