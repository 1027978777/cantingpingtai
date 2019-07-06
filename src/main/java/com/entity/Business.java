package com.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

/* 读取表结构信息 */
public class Business {
    
    public Business() {

    }
    
    /* 商家编号  */
    private Integer id;
    /* 图片  */
    private String image;
    /* 商家名  */
    private String name;
    /* 地址  */
    private String address;
    /* 电话  */
    private String tel;
    /* 营业时间  */
    private String opentime;
    /* 店铺类型  */
    private String shopType;
    /* 登陆账号  */
    private String username;
    /* 登陆密码  */
    private String password;
    /* 账号类型  */
    private Integer type;
    
    public Integer getId() {
        return this.id;
    }
    public String getImage() {
        return this.image;
    }
    public String getName() {
        return this.name;
    }
    public String getAddress() {
        return this.address;
    }
    public String getTel() {
        return this.tel;
    }
    public String getOpentime() {
        return this.opentime;
    }
    public String getShopType() {
        return this.shopType;
    }
    public String getUsername() {
        return this.username;
    }
    public String getPassword() {
        return this.password;
    }
    public Integer getType() {
        return this.type;
    }
   
    public void setId(Integer id) {
        this.id = id;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public void setOpentime(String opentime) {
        this.opentime = opentime;
    }
    public void setShopType(String shopType) {
        this.shopType = shopType;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setType(Integer type) {
        this.type = type;
    }
  
}