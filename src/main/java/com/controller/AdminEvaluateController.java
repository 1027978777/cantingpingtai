package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.InitializingBean;
import com.entity.Evaluate;
import com.service.EvaluateService;
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
@RequestMapping(value="/admin/evaluate")
public class AdminEvaluateController  {

    @Autowired
    private EvaluateService evaluateService;
 
   
   @RequestMapping("search")
    public String search(HttpServletRequest request,String name){
        String key = "%" + name + "%";
        List<Evaluate> list = evaluateService.search(key);
        request.setAttribute("list",list);
        request.setAttribute("key",name);
        return "/admin/evaluate-list";
    }

     @RequestMapping("add")
    public String add(HttpServletRequest request,Evaluate model){
        
        request.setAttribute("model",model);
        return "/admin/evaluate-add";
    }
  
  
     @RequestMapping("edit")
    public String edit(HttpServletRequest request,Integer id){
       Evaluate model = evaluateService.getModel(id);
       request.setAttribute("model",model);
        return "/admin/evaluate-add";
    }
  
    @RequestMapping("save")
    @ResponseBody
    public Result save(HttpServletRequest request,Evaluate model){
        int i = 0;
        if (model.getId() == null) {
            i = evaluateService.insertModelWithoutNull(model);
        } else {
            i = evaluateService.updateModelWithoutNull(model);
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
        int i = evaluateService.deleteModel(id);
        if (i == 0) {
            return ResultUtil.error("失败");
        } else {
            return ResultUtil.success(null);
        }
    }
  
  
   @RequestMapping("list")
    public String list(HttpServletRequest request,Evaluate model){
        List<Evaluate> list = evaluateService.getModelList(putEntityInMap(model));
        request.setAttribute("list",list);
        request.setAttribute("model",model);
        return "/admin/evaluate-list";
    }
    @RequestMapping("list1")
    public String list1(HttpServletRequest request,Evaluate model){
        List<Evaluate> list = evaluateService.getModelList(putEntityInMap(model));
        request.setAttribute("list",list);
        request.setAttribute("model",model);
        return "/admin/evaluate-list1";
    }
   
    /**
     * @Author admin
     * @Description  将实体类中的值放入map
     * @Date 2019/1/25 16:45
     **/
    public Map<String,Object> putEntityInMap(Evaluate entity){
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