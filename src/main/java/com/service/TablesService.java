package com.service;

import com.entity.Tables;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.TablesDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.InitializingBean;

@Service
public class TablesService extends BaseService<Tables,Integer> implements InitializingBean {
    
    @Autowired
    private TablesDao tablesDao;



    public void afterPropertiesSet() throws Exception {
        super.baseDao =  tablesDao;;
    }

    
}