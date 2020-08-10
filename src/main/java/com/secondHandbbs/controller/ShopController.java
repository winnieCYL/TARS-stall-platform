package com.secondHandbbs.controller;

import com.secondHandbbs.domain.User;
import com.secondHandbbs.service.ProductService;
import com.secondHandbbs.service.UserService;
import com.secondHandbbs.util.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@EnableAutoConfiguration
public class ShopController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Value("${web.upload-path}")
    private String path;

    //    使用默认
    private final Logger log= LoggerFactory.getLogger(ShopController.class);

    @RequestMapping("/shop-input")
    public String shopInput(Model model,HttpSession session) {
        model.addAttribute("user", SecurityUtils.getUser());
        return "shop/shop-input";
    }

    //修改商品信息页面
    @RequestMapping("/shop/update")
    public String shopUpdate(Model model,HttpSession session) {
        model.addAttribute("user", SecurityUtils.getUser());
        return "shop/shop-update";

    }

    //    修改商店信息操作 等价于覆盖user信息 所以saveUser
    @RequestMapping(value = "/shop/update", method = RequestMethod.POST)
    public String updateShop(User user,
                             @RequestParam("files") MultipartFile[] files,
                             Model model, HttpSession session,
                             @PageableDefault(size = 8, sort = {"createTime"}, direction = Sort.Direction.DESC) Pageable pageable)
            throws IllegalStateException, IOException{
        try{
            User currentuser = SecurityUtils.getUser();
            currentuser.setShopname(user.getShopname());
            currentuser.setLon(user.getLon());
            currentuser.setLon(user.getLon());
            userService.saveUser(currentuser,files,session);
            log.info("更新商店信息成功");
        }catch (Exception e){
            log.error(e.toString());
            log.info("更新失败");
        }
        return "redirect:/shop";
    }

    /**
     *  上传商品信息
     *@Author: qiuwenhao
     *@date: 2020/7/29
     */
    @PostMapping("/uploadShop")
    public String uploadShop(User user,
                                @RequestParam("files") MultipartFile[] files,
                                Model model, HttpSession session,
                                @PageableDefault(size = 8, sort = {"createTime"}, direction = Sort.Direction.DESC) Pageable pageable)
            throws IllegalStateException, IOException{
        try{
            userService.saveUser(user,files,session);
        }catch (Exception e){
            log.error(e.toString());
        }
        log.info("保存商店信息成功");
        return "redirect:/shop"; //返回商店详情页
    }


    //获取用户自己商店详细信息
    @RequestMapping("/shop")
    public String shop( Model model,@PageableDefault(size = 16, sort = {"createTime"},
            direction = Sort.Direction.DESC) Pageable pageable) {
        User u=SecurityUtils.getUser();

//        计算商品图片便于处理
        int imglen;
        if(u.getImgs()==null)
            imglen=0;
        else
            imglen=u.getImgs().size();
        model.addAttribute("user", SecurityUtils.getUser());
        model.addAttribute("imglength",imglen);
        model.addAttribute("page",productService.listProduct(SecurityUtils.getUser().getId(),pageable));

        return "shop/shop";
    }

    //获取某个商店详细信息
    @RequestMapping("/shop/{id}")
    public String shopId(@PathVariable Long id, Model model,@PageableDefault(size = 16, sort = {"createTime"},
            direction = Sort.Direction.DESC) Pageable pageable) {

        User u = userService.getAndConvert(id);
//        计算商品图片便于处理
        int imglength;
        if(u.getImgs()==null)
            imglength=0;
        else
            imglength=u.getImgs().size();
        model.addAttribute("user", u);
        model.addAttribute("imglength",imglength);
        model.addAttribute("page",productService.listProduct(id,pageable));

        return "shop/shop";
    }


}
