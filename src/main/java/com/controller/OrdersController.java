package com.controller;

import com.alibaba.fastjson.JSON;
import com.entity.*;
import com.service.*;
import com.utils.MapUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.utils.ResultUtil;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value="/web/orders")
public class OrdersController  {

    @Autowired
    private OrdersService ordersService;
    @Autowired
    private OrdersCaiService ordersCaiService;
    @Autowired
    private CaiService caiService;
    @Autowired
    private EvaluateService evaluateService;
 
   
   @RequestMapping("search")
    public String search(HttpServletRequest request,String name){
        String key = "%" + name + "%";
        List<Orders> list = ordersService.search(key);
        request.setAttribute("list",list);
        request.setAttribute("key",name);
        return "/orders-list";
    }

     @RequestMapping("add")
    public String add(HttpServletRequest request,Orders model){
        
        request.setAttribute("model",model);
        return "/orders-add";
    }
    
    
     @RequestMapping("detail")
    public String detail(HttpServletRequest request,Integer id){
        Orders model = ordersService.getModel(id);
        request.setAttribute("model",model);
        return "/detail";
    }
  
  
     @RequestMapping("edit")
    public String edit(HttpServletRequest request,Integer id){
       Orders model = ordersService.getModel(id);
       request.setAttribute("model",model);
        return "/orders-add";
    }
  
    @RequestMapping("save")
    @ResponseBody
    public Result save(HttpServletRequest request, Orders model, String menu_items_data, BigDecimal menu_items_total){
       User user = (User)request.getSession().getAttribute("user");

       //订单号
        String no = "" + System.currentTimeMillis();
        model.setNo(no);
        model.setCreatetime(new Date());
        if (user != null){
            model.setUid(user.getId());
        }
        model.setTotal(menu_items_total);
        List<CarBean> carBeans = JSON.parseArray(menu_items_data, CarBean.class);
        ordersService.insertModelWithoutNull(model);
        if (carBeans != null){
            for (int i = 0; i < carBeans.size(); i++) {
                Cai cai = caiService.getModel(carBeans.get(i).getId());
                OrdersCai ordersCai = new OrdersCai();
                ordersCai.setCid(cai.getId());
                ordersCai.setCname(cai.getName());
                ordersCai.setImage(cai.getImage());
                ordersCai.setNum(carBeans.get(i).getQ());
                ordersCai.setNo(no);

                ordersCaiService.insertModelWithoutNull(ordersCai);
            }
        }
        return ResultUtil.success(null);
    }


    @RequestMapping("delete")
    @ResponseBody
    public Result delete(HttpServletRequest request,Integer id){
        int i = ordersService.deleteModel(id);
        if (i == 0) {
            return ResultUtil.error("失败");
        } else {
            return ResultUtil.success(null);
        }
    }
  
  
   @RequestMapping("list")
    public String list(HttpServletRequest request,Orders model){
        List<Orders> list = ordersService.getModelList(putEntityInMap(model));
        if (list != null){
            for (int i = 0; i < list.size(); i++) {
                Evaluate evaluate = evaluateService.selectOneModel(MapUtil.buildMap("oid", list.get(i).getId()));
                list.get(i).setEvaluate(evaluate);
            }

        }



       request.setAttribute("list",list);
        return "/member_order";
    }
  
   
    /**
     * @Author admin
     * @Description  将实体类中的值放入map
     * @Date 2019/1/25 16:45
     **/
    public Map<String,Object> putEntityInMap(Orders entity){
        Class<?> aClass = entity.getClass();//获取类对象
        Field[] fields = aClass.getDeclaredFields();//获取对象的属性名数组
        Map<String,Object> query = new HashMap<>();//查询map
        try{
            for (int i = 0; i <fields.length ; i++) {
                String name = fields[i].getName();
                String firstLetter = name.substring(0, 1).toUpperCase();
                String getter = "get" + firstLetter + name.substring(1);//构造get方法的方法名
                Method method = aClass.getMethod(getter, new Class[]{});
                Object value = method.invoke(entity, new Object[] {});//获取属性的值
                if (value != null){
                    query.put(name,value);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return query;
    }

}