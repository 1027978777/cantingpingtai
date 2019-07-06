package com.service;

import com.entity.Car;
import org.springframework.beans.factory.annotation.Autowired;
import com.dao.CarDao;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.InitializingBean;

@Service
public class CarService extends BaseService<Car,Integer> implements InitializingBean {
    
    @Autowired
    private CarDao carDao;



    public void afterPropertiesSet() throws Exception {
        super.baseDao =  carDao;;
    }

    
}