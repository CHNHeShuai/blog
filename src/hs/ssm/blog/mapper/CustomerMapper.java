package hs.ssm.blog.mapper;

import hs.ssm.blog.pojo.Customer;

import java.util.List;

/**
 * @author hs
 * @date 2018/12/4 - 21:55
 */
public interface CustomerMapper {

    //根据客户姓名查询客户
    Customer getCustomerByName(String username);

    //查询所有客户
    List<Customer> getCustomerList();

    //查询客户留言
    List getCustomergbook();

    //注册用户
    void addCustomer(Customer customer);

    //根据ID删除客户
    void deleteCustomer(Integer id);

    void updateCustomerPassword(Customer customer);
    void updateCustomer(Customer customer);
}
