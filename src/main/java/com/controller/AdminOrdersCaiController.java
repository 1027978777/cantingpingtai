package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.InitializingBean;
import com.entity.OrdersCai;
import com.service.OrdersCaiService;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import com.entity.Result;
import com.utils.ResultUtil;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value="/admin/ordersCai")
public class AdminOrdersCaiController  {

    @Autowired
    private OrdersCaiService ordersCaiService;
 
   
   @RequestMapping("search")
    public String search(HttpServletRequest request,String name){
        String key = "%" + name + "%";
        List<OrdersCai> list = ordersCaiService.search(key);
        request.setAttribute("list",list);
        request.setAttribute("key",name);
        return "/admin/ordersCai-list";
    }

     @RequestMapping("add")
    public String add(HttpServletRequest request,OrdersCai model){
        
        request.setAttribute("model",model);
        return "/admin/ordersCai-add";
    }
  
  
     @RequestMapping("edit")
    public String edit(HttpServletRequest request,Integer id){
       OrdersCai model = ordersCaiService.getModel(id);
       request.setAttribute("model",model);
        return "/admin/ordersCai-add";
    }
    @RequestMapping("edit2")
    public String edit2(HttpServletRequest request,Integer id){
        OrdersCai model = ordersCaiService.getModel(id);
        request.setAttribute("model",model);
        return "/admin/ordersCai-add2";
    }
  
    @RequestMapping("save")
    @ResponseBody
    public Result save(HttpServletRequest request,OrdersCai model){
        int i = 0;
        if (model.getId() == null) {
            i = ordersCaiService.insertModelWithoutNull(model);
        } else {
            i = ordersCaiService.updateModelWithoutNull(model);
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
        int i = ordersCaiService.deleteModel(id);
        if (i == 0) {
            return ResultUtil.error("失败");
        } else {
            return ResultUtil.success(null);
        }
    }
  
  
   @RequestMapping("list")
    public String list(HttpServletRequest request,OrdersCai model){
        List<OrdersCai> list = ordersCaiService.getModelList(putEntityInMap(model));
        request.setAttribute("list",list);
        request.setAttribute("model",model);
        return "/admin/ordersCai-list";
    }
    @RequestMapping("list1")
    public String list1(HttpServletRequest request,OrdersCai model){
        List<OrdersCai> list = ordersCaiService.getModelList(putEntityInMap(model));
        request.setAttribute("list",list);
        request.setAttribute("model",model);
        return "/admin/ordersCai-list1";
    }
    @RequestMapping("list2")
    public String list2(HttpServletRequest request,OrdersCai model){
        List<OrdersCai> list = ordersCaiService.getModelList(putEntityInMap(model));
        request.setAttribute("list",list);
        request.setAttribute("model",model);
        return "/admin/ordersCai-list2";
    }
   
    /**
     * @Author admin
     * @Description  将实体类中的值放入map
     * @Date 2019/1/25 16:45
     **/
    public Map<String,Object> putEntityInMap(OrdersCai entity){
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