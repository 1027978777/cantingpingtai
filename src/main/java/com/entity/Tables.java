package com.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

/* 读取表结构信息 */
public class Tables {
    
    public Tables() {

    }
    
    /* 主键  */
    private Integer id;
    /* 编号  */
    private String no;
    /* 座位数  */
    private Integer num;
    /* 状态  */
    private Integer state;
    /* 商家  */
    private Integer bid;
    
    public Integer getId() {
        return this.id;
    }
    public String getNo() {
        return this.no;
    }
    public Integer getNum() {
        return this.num;
    }
    public Integer getState() {
        return this.state;
    }
    public Integer getBid() {
        return this.bid;
    }
   
    public void setId(Integer id) {
        this.id = id;
    }
    public void setNo(String no) {
        this.no = no;
    }
    public void setNum(Integer num) {
        this.num = num;
    }
    public void setState(Integer state) {
        this.state = state;
    }
    public void setBid(Integer bid) {
        this.bid = bid;
    }
  
}