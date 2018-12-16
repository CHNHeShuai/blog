package hs.ssm.blog.service;

import hs.ssm.blog.mapper.CustomerMapper;
import hs.ssm.blog.mapper.CustomergbookMapper;
import hs.ssm.blog.pojo.Customer;
import hs.ssm.blog.pojo.Customergbook;
import hs.ssm.blog.utils.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/5 - 14:57
 */
@Service
public class CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    //@Autowired
    //private CustomergbookMapper customergbookMapper;

    public Customer getCustomerByName(String username){
        return customerMapper.getCustomerByName(username);
    }

    //获取所有客户
    public List<Customer> getCustomerList(){
        return customerMapper.getCustomerList();
    }

    public List getCustomergbook(){
        return customerMapper.getCustomergbook();
    }

    //注册用户
    public void addCustomer(Customer customer){
        //获取输入的密码，用MD5加密后存储在customer中
        String inputPassword = customer.getPassword();
        String password = MD5Utils.md5(inputPassword);
        customer.setPassword(password);
        customerMapper.addCustomer(customer);
    }

    //根据ID删除客户
    public void deleteCustomer(Integer id){
        customerMapper.deleteCustomer(id);
    }

    //根据用户id修改密码
    public void updateCustomerPassword(Customer customer){
        customerMapper.updateCustomerPassword(customer);
    }

    public void updateCustomer(Customer customer){
        customerMapper.updateCustomer(customer);
    }
}
