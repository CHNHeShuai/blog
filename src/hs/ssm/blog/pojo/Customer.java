package hs.ssm.blog.pojo;

import java.util.Date;
import java.util.List;

/**
 * @author hs
 * @date 2018/12/4 - 21:53
 */
public class Customer {
    private int id;
    private String username;
    private String password;
    private String image;
    private String telephone;
    private List<Customergbook> customergbooks;

    public List<Customergbook> getCustomergbooks() {
        return customergbooks;
    }

    public void setCustomergbooks(List<Customergbook> customergbooks) {
        this.customergbooks = customergbooks;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

}
