package com.utils;

import com.dao.BusinessDao;
import com.dao.UserDao;
import com.entity.Business;
import com.entity.User;
import com.service.SpringContextHolder;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;

public class TldUtil {
    private static UserDao userDao = SpringContextHolder.getBean(UserDao.class);
    private static BusinessDao businessDao = SpringContextHolder.getBean(BusinessDao.class);



    public static int getListLength(List list){
        if (list == null){
            return 0;
        }else {
            return list.size();
        }
    }



    public static boolean inArray(String[] array, String val) {
        if (array == null || val == null) {
            return false;
        }

        for (int i = 0; i < array.length; i++) {
            if (array[i].equals(val)) {
                return true;
            }
        }
        return false;
    }




    /**
     * @Author admin
     * @Description  商铺名称
     * @Date
     **/
    public static Business getProductName(Integer id){
        Business model = businessDao.getModel(id);
        return model;
    }

    /**
     * 用户名称
     */
    public static User getUser(Integer id){
        User model = userDao.getModel(id);
        return model;
    }
}
