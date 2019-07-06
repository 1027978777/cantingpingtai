package com.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

/* 读取表结构信息 */
public class OrdersCai {
    
    public OrdersCai() {

    }
    
    /* 编号  */
    private Integer id;
    /* 菜品编号  */
    private Integer cid;
    /* 图片  */
    private String image;
    /* 菜名  */
    private String cname;
    /* 数量  */
    private Integer num;
    /* 状态  */
    private Integer state;
    /* 状态  */
    private String no;


    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public Integer getId() {
        return this.id;
    }
    public Integer getCid() {
        return this.cid;
    }
    public String getImage() {
        return this.image;
    }
    public String getCname() {
        return this.cname;
    }
    public Integer getNum() {
        return this.num;
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
    public void setImage(String image) {
        this.image = image;
    }
    public void setCname(String cname) {
        this.cname = cname;
    }
    public void setNum(Integer num) {
        this.num = num;
    }
    public void setState(Integer state) {
        this.state = state;
    }
  
}