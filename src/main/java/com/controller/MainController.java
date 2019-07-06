package com.controller;

import com.entity.Business;
import com.entity.Result;
import com.entity.Staff;
import com.entity.User;
import com.service.BusinessService;
import com.service.StaffService;
import com.service.UserService;
import com.utils.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;

@Controller
@RequestMapping("")
public class MainController extends BaseController {

    @Autowired
    private UserService userService;
    @Autowired
    private BusinessService businessService;
    @Autowired
    private StaffService staffService;

    @RequestMapping("admin/login")
    public String adminLogin() {
        return "/admin/login";
    }

    @RequestMapping("login")
    public String login(Business user, HttpServletRequest request, Staff staff, Integer type) {

        if (type == 2){
            //员工登陆
            Staff staff1 = staffService.selectOneModel(putEntityInMap(staff));
            if (staff1 != null) {
                request.getSession().setAttribute("staff", staff1);
                return "/admin/index";
            } else {
                return "/admin/login";
            }
        }

        Business business = businessService.selectOneModel(putEntityInMap(user));
        if (business != null) {
            request.getSession().setAttribute("user", business);
            return "/admin/index";
        } else {
            return "/admin/login";
        }


    }

    @RequestMapping("welcome")
    public String welcome(HttpServletRequest request) {

        return "/admin/welcome";
    }

    @RequestMapping("logout")
    public String loout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "/admin/login";
    }

    @RequestMapping("reg/user")
    public String regUser() {
        return "/admin/reguser";
    }

    @RequestMapping("reg/driver")
    public String regdriver() {
        return "/admin/regdriver";
    }


    @RequestMapping("reg")
    @ResponseBody
    public Integer reguser(HttpServletRequest request, User user, Integer type) {

        int i = userService.insertModelWithoutNull(user);
        return i;
    }

    @RequestMapping("upload")
    @ResponseBody
    public Result songUpload(@RequestParam("file") MultipartFile path, HttpServletRequest request) {
        if (path.isEmpty()) {
            return ResultUtil.error("文件不能为空");
        } else {
            // 上传的路径
            String rootPath = this.getClass().getResource("/").getPath();
            System.out.println(rootPath);
            rootPath = rootPath.replace("WEB-INF/", "");
            rootPath = rootPath.replace("classes/", "");
            // 原始全名称
            String originalFileName = path.getOriginalFilename();
            //文件名不带后缀
            String fileName = System.currentTimeMillis() + "";
            // 后缀名
            String suffixName = originalFileName.substring(originalFileName.lastIndexOf("."));
            // 新文件
            String pathSuffix = "static/file/" + fileName + suffixName;
            File newFile = new File(rootPath + pathSuffix);
            //获取文件大小
            // 判断目标文件所在目录是否存在
            if (!newFile.getParentFile().exists()) {
                // 如果目标文件所在的目录不存在，则创建父目录
                newFile.getParentFile().mkdirs();
            }
            System.out.println(newFile);
            // 上传
            try {
                path.transferTo(newFile);
            } catch (Exception e) {
                return ResultUtil.error(e.getMessage());
            }
            return ResultUtil.success("/static/file/" + fileName + suffixName);
        }
    }

    @RequestMapping("")
    public String index() {
        return "redirect:/web/business/list";
    }

    @RequestMapping("web/logout")
    public String webLogout(HttpServletRequest request) {
        request.getSession().invalidate();
        return "redirect:/web/business/list";
    }
}
