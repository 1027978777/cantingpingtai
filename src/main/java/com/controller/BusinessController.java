package com.controller;

import com.entity.Cai;
import com.entity.Tables;
import com.service.CaiService;
import com.service.TablesService;
import com.utils.MapUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.InitializingBean;
import com.entity.Business;
import com.service.BusinessService;
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
@RequestMapping(value="/web/business")
public class BusinessController  {

    @Autowired
    private BusinessService businessService;
    @Autowired
    private TablesService tablesService;
    @Autowired
    private CaiService caiService;
 
   
   @RequestMapping("search")
    public String search(HttpServletRequest request,String name){
        String key = "%" + name + "%";
        List<Business> list = businessService.search(key);
        request.setAttribute("list",list);
        request.setAttribute("key",name);
       return "/index";
    }

     @RequestMapping("add")
    public String add(HttpServletRequest request,Business model){
        
        request.setAttribute("model",model);
        return "/business-add";
    }

    /**
     * 查询餐厅所有的餐桌
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("tables")
    public String tables(HttpServletRequest request,Integer id){
        Business model = businessService.getModel(id);
        request.setAttribute("model",model);
        List<Tables> tablesList = tablesService.getModelList(MapUtil.buildMap("bid", id));//查询餐厅所有的餐桌
        request.setAttribute("tablesList",tablesList);
        return "/shop_tables";
    }


    @RequestMapping("detail")
    public String detail(HttpServletRequest request,Integer id,Integer tid){
        Business model = businessService.getModel(id);
        //查询店铺所有菜品
        List<Cai> caiList = caiService.getModelList(MapUtil.buildMap("bid", model.getId()));
        request.setAttribute("model",model);
        request.setAttribute("tid",tid);
        request.setAttribute("caiList",caiList);
        return "/shop_detail";
    }
  
  
     @RequestMapping("edit")
    public String edit(HttpServletRequest request,Integer id){
       Business model = businessService.getModel(id);
       request.setAttribute("model",model);
        return "/business-add";
    }
  
    @RequestMapping("save")
    @ResponseBody
    public Result save(HttpServletRequest request,Business model){
        int i = 0;
        if (model.getId() == null) {
            i = businessService.insertModelWithoutNull(model);
        } else {
            i = businessService.updateModelWithoutNull(model);
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
        int i = businessService.deleteModel(id);
        if (i == 0) {
            return ResultUtil.error("失败");
        } else {
            return ResultUtil.success(null);
        }
    }
  
  
   @RequestMapping("list")
    public String list(HttpServletRequest request,Business model){
        model.setType(0);
        List<Business> list = businessService.getModelList(putEntityInMap(model));

        request.setAttribute("list",list);
        return "/index";
    }
  
   
    /**
     * @Author admin
     * @Description  将实体类中的值放入map
     * @Date 2019/1/25 16:45
     **/
    public Map<String,Object> putEntityInMap(Business entity){
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