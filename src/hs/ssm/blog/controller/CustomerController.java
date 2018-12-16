package hs.ssm.blog.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import hs.ssm.blog.pojo.*;
import hs.ssm.blog.service.CustomerService;
import hs.ssm.blog.service.ShowIndexService;
import hs.ssm.blog.utils.MD5Utils;
import hs.ssm.blog.utils.UploadImage;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * @author hs
 * @date 2018/12/4 - 19:20
 */
@Controller
public class CustomerController {
    //@Autowired
    //private ShowIndexService showIndexService;

    @Autowired
    private CustomerService customerService;

    @RequestMapping("/customerLogin")
    public String toLogin(){
        return "customerLogin";
    }

    @RequestMapping("/login")
    public String login(Customer customer, Model model, HttpSession session){
        //获取用户输入的用户名
        String username = customer.getUsername();
        //判断用户名是否为空
        if(StringUtils.isNotEmpty(username)){
            //如果不为空，则根据用户名查询用户
            Customer customerByName = customerService.getCustomerByName(username);
            //判断查询的用户是否为空，如果为空则用户名不存在
            if(customerByName!=null){
                //判断用户密码是否正确
                String cust_password = customerByName.getPassword();
                //由于用户密码已经加密所以是判断加密后的密码
                String password = customer.getPassword();
                String input_password = MD5Utils.md5(password);
                if(cust_password.equals(input_password)){
                    //登录成功后跳转到留言页面
                    session.setAttribute("customer",customerByName);
                    return "redirect:/gbook";
                }else {
                    model.addAttribute("passwordCheck","输入的密码不正确");
                    return "customerLogin";
                }

            }else {
                //用户名不存在，跳转到登录界面
                model.addAttribute("usernameCheck","用户名不存在");
                return "customerLogin";
            }
        }else {
            model.addAttribute("usernameCheck","用户名不能为空");
            return "customerLogin";
        }

    }

    @RequestMapping("/logout")
    public String logout(Model model,HttpSession session){
        session.removeAttribute("customer");
        return "redirect:/";
    }

    @RequestMapping("/customerRegister")
    public String toRegister(){
        return "customerRegister";
    }

    //多表查询客户信息和客户留言
    @RequestMapping("/gbook")
    public String findGbook(Model model,@RequestParam(value = "currentPage",defaultValue = "1") Integer currentPage,
                            @RequestParam(value = "pageSize",defaultValue = "6") Integer pageSize){
        PageHelper.startPage(currentPage,pageSize);
        //多表查询的结果
        List customergbookList = customerService.getCustomergbook();
        PageInfo pageInfo = new PageInfo(customergbookList);
        model.addAttribute("pageInfo",pageInfo);
        return "gbook";
    }

    @RequestMapping("/register")
    public String register(Customer customer, @RequestParam(value = "fileName",required = true) MultipartFile fileName,
                           HttpServletRequest request){
        try {

            String image = UploadImage.uploadImage(fileName, request);
            customer.setImage(image);
            customerService.addCustomer(customer);
            return "customerLogin";
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/customerRegister";
        }
    }

    @RequestMapping("/findCustomers")
    public String findCustomers(Model model){
        List<Customer> customerList = customerService.getCustomerList();
        model.addAttribute("customerList",customerList);
        return "customerManager";
    }

    @RequestMapping("/deleteCustomer")
    public String deleteCustomer(Integer id){
        customerService.deleteCustomer(id);
        return "redirect:/findCustomers";
    }

    @RequestMapping("/customerCenter")
    public String toCustomerCenter(){
        return "customerCenter";
    }

    @RequestMapping("/toupdateCustomerPassword")
    public String toupdateCustomerPassword(){
        return "updateCustomerPassword";
    }
    @RequestMapping("/updateCustomerPassword")
    public String toupdateCustomerPassword(Customer customer){
        String password = MD5Utils.md5(customer.getPassword());
        customer.setPassword(password);
        customerService.updateCustomerPassword(customer);
        return "redirect:/customerCenter";
    }

    @RequestMapping("/updateCustomer")
    public String updateCustomer(Customer customer,@RequestParam(value = "imageFile") MultipartFile imageFile,
                                 HttpServletRequest request){
        String image = UploadImage.uploadImage(imageFile, request);
        customer.setImage(image);

        customerService.updateCustomer(customer);

        return "redirect:/customerCenter";
    }

}
