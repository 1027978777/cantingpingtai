package com.entity;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

/* 读取表结构信息 */
public class Evaluate {
    
    public Evaluate() {

    }
    
    /* 评价  */
    private Integer id;
    /* 评价人  */
    private Integer uid;
    /* 姓名  */
    private String uname;
    /* 评价内容  */
    private String content;
    /* 回复  */
    private String reply;
    /* 订单id  */
    private Integer oid;
    /* 商家id  */
    private Integer bid;
    /* 评价时间  */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(timezone = "GMT+8", pattern = "yyyy-MM-dd HH:mm:ss")        
    private Date createtime;
    
    public Integer getId() {
        return this.id;
    }
    public Integer getUid() {
        return this.uid;
    }
    public String getUname() {
        return this.uname;
    }
    public String getContent() {
        return this.content;
    }
    public String getReply() {
        return this.reply;
    }
    public Integer getOid() {
        return this.oid;
    }
    public Integer getBid() {
        return this.bid;
    }
    public Date getCreatetime() {
        return this.createtime;
    }
   
    public void setId(Integer id) {
        this.id = id;
    }
    public void setUid(Integer uid) {
        this.uid = uid;
    }
    public void setUname(String uname) {
        this.uname = uname;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setReply(String reply) {
        this.reply = reply;
    }
    public void setOid(Integer oid) {
        this.oid = oid;
    }
    public void setBid(Integer bid) {
        this.bid = bid;
    }
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
  
}