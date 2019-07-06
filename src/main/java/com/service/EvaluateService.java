package com.service;

import com.entity.Evaluate;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.EvaluateDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.InitializingBean;

@Service
public class EvaluateService extends BaseService<Evaluate,Integer> implements InitializingBean {
    
    @Autowired
    private EvaluateDao evaluateDao;



    public void afterPropertiesSet() throws Exception {
        super.baseDao =  evaluateDao;;
    }

    
}