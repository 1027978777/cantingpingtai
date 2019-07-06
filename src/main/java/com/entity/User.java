package com.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import java.math.BigDecimal;

/* 读取表结构信息 */
public class User {
    
    public User() {

    }
    
    /* id  */
    private Integer id;
    /* 用户名  */
    private String username;
    /* 密码  */
    private String password;
    /* 姓名  */
    private String realname;
    /* 账户余额  */
    private BigDecimal money;
    /* 电话号  */
    private String phone;
    
    public Integer getId() {
        return this.id;
    }
    public String getUsername() {
        return this.username;
    }
    public String getPassword() {
        return this.password;
    }
    public String getRealname() {
        return this.realname;
    }
    public BigDecimal getMoney() {
        return this.money;
    }
    public String getPhone() {
        return this.phone;
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
    public void setRealname(String realname) {
        this.realname = realname;
    }
    public void setMoney(BigDecimal money) {
        this.money = money;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
  
}