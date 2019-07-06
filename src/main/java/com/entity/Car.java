package com.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import java.math.BigDecimal;

/* 读取表结构信息 */
public class Car {
    
    public Car() {

    }
    
    /* 编号  */
    private Integer id;
    /* 菜品  */
    private Integer cid;
    /* 用户  */
    private Integer uid;
    /* 名称  */
    private String cname;
    /* 图片  */
    private String image;
    /* 单价  */
    private BigDecimal cprice;
    /* 数量  */
    private Integer cnum;
    /* 状态  */
    private Integer state;
    
    public Integer getId() {
        return this.id;
    }
    public Integer getCid() {
        return this.cid;
    }
    public Integer getUid() {
        return this.uid;
    }
    public String getCname() {
        return this.cname;
    }
    public String getImage() {
        return this.image;
    }
    public BigDecimal getCprice() {
        return this.cprice;
    }
    public Integer getCnum() {
        return this.cnum;
    }
    public Integer getState() {
        return this.state;
    }
   
    public void setId(Integer id) {
        this.id = id;
    }
    public void setCid(Integer cid) {
        this.cid = cid;
    }
    public void setUid(Integer uid) {
        this.uid = uid;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public void setCprice(BigDecimal cprice) {
        this.cprice = cprice;
    }
    public void setCnum(Integer cnum) {
        this.cnum = cnum;
    }
    public void setState(Integer state) {
        this.state = state;
    }
  
}