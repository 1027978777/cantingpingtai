package com.service;

import com.entity.OrdersCai;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.OrdersCaiDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.InitializingBean;

@Service
public class OrdersCaiService extends BaseService<OrdersCai,Integer> implements InitializingBean {
    
    @Autowired
    private OrdersCaiDao ordersCaiDao;



    public void afterPropertiesSet() throws Exception {
        super.baseDao =  ordersCaiDao;;
    }

    
}