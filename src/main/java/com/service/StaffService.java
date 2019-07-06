package com.service;

import com.entity.Staff;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.StaffDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.InitializingBean;

@Service
public class StaffService extends BaseService<Staff,Integer> implements InitializingBean {
    
    @Autowired
    private StaffDao staffDao;



    public void afterPropertiesSet() throws Exception {
        super.baseDao =  staffDao;;
    }

    
}