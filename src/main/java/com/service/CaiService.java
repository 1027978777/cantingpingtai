package com.service;

import com.entity.Cai;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.CaiDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.InitializingBean;

@Service
public class CaiService extends BaseService<Cai,Integer> implements InitializingBean {
    
    @Autowired
    private CaiDao caiDao;



    public void afterPropertiesSet() throws Exception {
        super.baseDao =  caiDao;;
    }

    
}