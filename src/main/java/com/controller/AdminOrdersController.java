package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.InitializingBean;
import com.entity.Orders;
import com.service.OrdersService;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;
import com.entity.Result;
import com.utils.ResultUtil;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value="/admin/orders")
public class AdminOrdersController  {

    @Autowired
    private OrdersService ordersService;
 
   
   @RequestMapping("search")
    public String search(HttpServletRequest request,String name){
        String key = "%" + name + "%";
        List<Orders> list = ordersService.search(key);
        request.setAttribute("list",list);
        request.setAttribute("key",name);
        return "/admin/orders-list";
    }
    @RequestMapping("search1")
    public String search1(HttpServletRequest request,String name){
        String key = "%" + name + "%";
        List<Orders> list = ordersService.search(key);
        request.setAttribute("list",list);
        request.setAttribute("key",name);
        return "/admin/orders-list1";
    }

    @RequestMapping("search2")
    public String search2(HttpServletRequest request,String name){
        String key = "%" + name + "%";
        List<Orders> list = ordersService.search(key);
        request.setAttribute("list",list);
        request.setAttribute("key",name);
        return "/admin/orders-list2";
    }
     @RequestMapping("add")
    public String add(HttpServletRequest request,Orders model){
        
        request.setAttribute("model",model);
        return "/admin/orders-add";
    }
  
  
     @RequestMapping("edit")
    public String edit(HttpServletRequest request,Integer id){
       Orders model = ordersService.getModel(id);
       request.setAttribute("model",model);
        return "/admin/orders-add";
    }
    @RequestMapping("edit2")
    public String edit2(HttpServletRequest request,Integer id){
        Orders model = ordersService.getModel(id);
        request.setAttribute("model",model);
        return "/admin/orders-add2";
    }
    @RequestMapping("save")
    @ResponseBody
    public Result save(HttpServletRequest request,Orders model){
        int i = 0;
        if (model.getId() == null) {
            i = ordersService.insertModelWithoutNull(model);
        } else {
            i = ordersService.updateModelWithoutNull(model);
        }
        if (i == 0) {
            return ResultUtil.error("失败");
        } else {
            return ResultUtil.success(null);
        }
      
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
       BigDecimal sum=new BigDecimal(0);
       int num=0;
        List<Orders> list = ordersService.getModelList(putEntityInMap(model));
       for(int i=0;i<list.size();i++)
       {
            sum=sum.add(list.get(i).getTotal());
       }
       if (list == null){
           request.setAttribute("sum",0);

       }else {
           request.setAttribute("sum",sum);
       }
       if (list == null){
           request.setAttribute("num",0);

       }else {
           request.setAttribute("num",list.size());
       }
        request.setAttribute("list",list);
        request.setAttribute("model",model);
        return "/admin/orders-list";
    }
    @RequestMapping("list1")
    public String list1(HttpServletRequest request,Orders model){
        BigDecimal sum=new BigDecimal(0);
        int num=0;
        List<Orders> list = ordersService.getModelList(putEntityInMap(model));
        for(int i=0;i<list.size();i++)
        {
            sum=sum.add(list.get(i).getTotal());
        }
        if (list == null){
            request.setAttribute("sum",0);

        }else {
            request.setAttribute("sum",sum);
        }
        if (list == null){
            request.setAttribute("num",0);

        }else {
            request.setAttribute("num",list.size());
        }
        request.setAttribute("list",list);
        request.setAttribute("model",model);
        return "/admin/orders-list1";
    }
    @RequestMapping("list2")
    public String list2(HttpServletRequest request,Orders model){
        List<Orders> list = ordersService.getModelList(putEntityInMap(model));
        request.setAttribute("list",list);
        request.setAttribute("model",model);
        return "/admin/orders-list2";
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