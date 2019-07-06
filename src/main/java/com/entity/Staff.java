package com.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

/* 读取表结构信息 */
public class Staff {
    
    public Staff() {

    }
    
    /* 编号  */
    private Integer id;
    /* 账号  */
    private String username;
    /* 密码  */
    private String password;
    /* 姓名  */
    private String name;
    /* 电话  */
    private String tel;
    /* 性别  */
    private Double gz;
    /* 归属店铺  */
    private Integer bid;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getId() {
        return this.id;
    }
    public String getUsername() {
        return this.username;
    }
    public String getPassword() {
        return this.password;
    }
    public String getTel() {
        return this.tel;
    }

    public Double getGz() {
        return gz;
    }

    public void setGz(Double gz) {
        this.gz = gz;
    }

    public Integer getBid() {
        return this.bid;
    }
   
    public void setId(Integer id) {
        this.id = id;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }
  
}