package com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.InitializingBean;
import com.entity.Cai;
import com.service.CaiService;
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
@RequestMapping(value="/cai")
public class CaiController  {

    @Autowired
    private CaiService caiService;
 
   
   @RequestMapping("search")
    public String search(HttpServletRequest request,String name){
        String key = "%" + name + "%";
        List<Cai> list = caiService.search(key);
        request.setAttribute("list",list);
        request.setAttribute("key",name);
        return "/cai-list";
    }

     @RequestMapping("add")
    public String add(HttpServletRequest request,Cai model){
        
        request.setAttribute("model",model);
        return "/cai-add";
    }
    
    
     @RequestMapping("detail")
    public String detail(HttpServletRequest request,Integer id){
        Cai model = caiService.getModel(id);
        request.setAttribute("model",model);
        return "/detail";
    }
  
  
     @RequestMapping("edit")
    public String edit(HttpServletRequest request,Integer id){
       Cai model = caiService.getModel(id);
       request.setAttribute("model",model);
        return "/cai-add";
    }
  
    @RequestMapping("save")
    @ResponseBody
    public Result save(HttpServletRequest request,Cai model){
        int i = 0;
        if (model.getId() == null) {
            i = caiService.insertModelWithoutNull(model);
        } else {
            i = caiService.updateModelWithoutNull(model);
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
        int i = caiService.deleteModel(id);
        if (i == 0) {
            return ResultUtil.error("失败");
        } else {
            return ResultUtil.success(null);
        }
    }
  
  
   @RequestMapping("list")
    public String list(HttpServletRequest request,Cai model){
        List<Cai> list = caiService.getModelList(putEntityInMap(model));
        request.setAttribute("list",list);
        return "/cai-list";
    }
  
   
    /**
     * @Author admin
     * @Description  将实体类中的值放入map
     * @Date 2019/1/25 16:45
     **/
    public Map<String,Object> putEntityInMap(Cai entity){
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