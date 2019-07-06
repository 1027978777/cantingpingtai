package com.service;

import com.entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.OrdersDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.InitializingBean;

@Service
public class OrdersService extends BaseService<Orders,Integer> implements InitializingBean {
    
    @Autowired
    private OrdersDao ordersDao;



    public void afterPropertiesSet() throws Exception {
        super.baseDao =  ordersDao;;
    }

    
}