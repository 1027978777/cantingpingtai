package com.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import java.math.BigDecimal;
import java.util.Date;

/* 读取表结构信息 */
public class Cai {
    
    public Cai() {

    }
    
    /* 编号  */
    private Integer id;
    /* 图片  */
    private String image;
    /* 菜名  */
    private String name;
    /* 单价  */
    private BigDecimal price;
    /* 菜品介绍  */
    private String content;
    /* 添加时间  */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")        
    private Date careatetime;
    /* 商家  */
    private Integer bid;
    
    public Integer getId() {
        return this.id;
    }
    public String getImage() {
        return this.image;
    }
    public String getName() {
        return this.name;
    }
    public BigDecimal getPrice() {
        return this.price;
    }
    public String getContent() {
        return this.content;
    }
    public Date getCareatetime() {
        return this.careatetime;
    }
    public Integer getBid() {
        return this.bid;
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
    public void setPrice(BigDecimal price) {
        this.price = price;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setCareatetime(Date careatetime) {
        this.careatetime = careatetime;
    }
    public void setBid(Integer bid) {
        this.bid = bid;
    }
  
}