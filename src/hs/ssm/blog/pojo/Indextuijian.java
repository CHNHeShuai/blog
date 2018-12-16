package hs.ssm.blog.pojo;

import java.util.Date;

/**
 * @author hs
 * @date 2018/12/3 - 20:36
 */
public class Indextuijian {
    private String title;
    private String image;
    private String des;
    private String  createtime;
    private int id;
    private int cid;
    private String article;
    private int pageview=0;
    private int click=0;
    private String tab="indextuijian";

    public String getTab() {
        return tab;
    }
    public void setTab(String tab) {
        this.tab = tab;
    }

    public int getPageview() {
        return pageview;
    }

    public void setPageview(int pageview) {
        this.pageview = pageview;
    }

    public int getClick() {
        return click;
    }

    public void setClick(int click) {
        this.click = click;
    }

    public String getArticle() {
        return article;
    }

    public void setArticle(String article) {
        this.article = article;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }
}
