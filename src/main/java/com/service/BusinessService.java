package com.service;

import com.entity.Business;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.BusinessDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.InitializingBean;

@Service
public class BusinessService extends BaseService<Business,Integer> implements InitializingBean {
    
    @Autowired
    private BusinessDao businessDao;



    public void afterPropertiesSet() throws Exception {
        super.baseDao =  businessDao;;
    }

    
}