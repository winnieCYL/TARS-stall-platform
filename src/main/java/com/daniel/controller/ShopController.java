package com.daniel.controller;

import com.alibaba.fastjson.JSONObject;
import com.daniel.common.Result;
import com.daniel.common.ResultGenerator;
import com.daniel.pojo.Shop;
import com.daniel.pojo.ShopImage;
import com.daniel.pojo.MerchantUser;
import com.daniel.service.ShopImageService;
import com.daniel.service.ShopService;
import com.daniel.service.MerchantUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Map;

@RestController
@RequestMapping("/shops")
public class ShopController {

    @Autowired
    private MerchantUserService userService;
    @Autowired
    private ShopService shopService;
    @Autowired
    private ShopImageService shopImageService;

    // 日志文件
    private static final Logger log = Logger.getLogger(ShopController.class);

    /**
     * 商店详情页
     * @param id 商店ID
     * @return 该ID商店的详情页
     */
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ModelAndView getShopDetail(@PathVariable("id") String id) {
        ModelAndView mav = new ModelAndView("shopDetail");
        int intId = Integer.parseInt(id);
        Shop curShop = shopService.get(intId);
        curShop.setShopImage(shopImageService.getByShopId(intId));
        curShop.setMerchantUser(userService.get(shopService.getMerchantUserId(intId)));
        mav.addObject("shop",curShop);
        return mav;
    }

    /**
     * 上传商店
     * @param request 用于获取当前用户信息
     * @param shop 商店实体类
     * @param file 图片文件
     */
    @RequestMapping(value = "",method = RequestMethod.POST)
    public Result uploadSell(HttpServletRequest request,Shop shop,
                           @RequestParam(value = "image" , required = false) MultipartFile file){
        // 获取当前用户的信息
        MerchantUser user = (MerchantUser) request.getSession().getAttribute("user");
        try {
            if(file != null && shop != null){
                // 写入商店信息
                /** 上传时间不需要
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                long time = System.currentTimeMillis();
                String timeStr= sdf.format(time);
                book.setDate(timeStr);
                */
                shop.setMerchantUser(user);
                shopService.add(shop);
                ShopImage shopImage = new ShopImage();
                shopImage.setShop(shop);
                shopImageService.add(shopImage);
                String imageName = shopImage.getId()+".jpg";
                String imagePath = request.getServletContext().getRealPath("/img/shop-list/article/");
                File filePath = new File(imagePath,imageName);
                if (!filePath.getParentFile().exists()){
                    filePath.getParentFile().mkdir();
                }
                file.transferTo(new File(imagePath + File.separator + imageName));
                log.info("request: shop/upload , shop: " + shop.toString());
                return ResultGenerator.genSuccessResult();
            }else {
                return ResultGenerator.genFailResult("信息填写不完整或未上传图片！");
            }
        } catch (IOException e) {
            e.printStackTrace();
            return ResultGenerator.genFailResult("上传失败");
        }
    }

    /**
     * 更新商店的视图
     * @param id 商店的ID
     * @return 该ID的商店的更新界面
     */
    @RequestMapping(value = "/renewal/{id}",method = RequestMethod.GET)
    public ModelAndView goEditShop(@PathVariable String id){
        ModelAndView mav = new ModelAndView("editShop");
        int shopId = Integer.parseInt(id);
        Shop curShop = shopService.get(shopId);
        log.info("request: shop/update , shop: " + curShop.toString());
        if (curShop != null){
            curShop.setShopImage(shopImageService.getByShopId(shopId));
        }
        mav.addObject("shop",curShop);
        /** category类别不需要，对应的jsp页面也要删去/调整类别这块
        Map<Integer,String> categories = categoryService.listByMap();
        mav.addObject("categories",categories);
        */
        return mav;
    }

    /**
     * 由于不需要类别，这一块全部不要
     * 根据ID获取书的Category
     * @param book
     * 应该使用GET的，但是会产生不合法URI异常，待解决
    @RequestMapping(value = "/categories")
    public Result getCategory(@RequestBody Book book){
        JSONObject data = new JSONObject();
        Category category = bookService.get(book.getId()).getCategory();
        log.info("request: book/category/get , bookId: " + book.getId()+" , category:"+category.toString());
        if (category.getId() != 0){
            data.put("categoryId",category.getId());
            return ResultGenerator.genSuccessResult(data);
        }else {
            return ResultGenerator.genFailResult("无效的Category！");
        }
    }
    */

    /**
     * 更新商店内容
     * @param request 用于获取路径
     * @param shop 除图片外其他的商店信息
     * @param file 图片
     * @return
     * 应该使用PUT，可是需要上传图片，表单提交无法用PUT，待解决
     */
    @RequestMapping(value = "/renewal",method = RequestMethod.POST)
    public Result editShop(HttpServletRequest request, Shop shop,
                           @RequestParam(value = "image" , required = false) MultipartFile file){
        try {
            shopService.update(shop);
            if (file != null) {
                ShopImage shopImage = shopImageService.getByShopId(shop.getId());
                shopImage.setShop(shop);
                shopImageService.update(shopImage);
                String imageName = shopImage.getId() + ".jpg";
                String imagePath = request.getServletContext().getRealPath("/img/shop-list/article/");
                File filePath = new File(imagePath, imageName);
                if (!filePath.getParentFile().exists()) {
                    filePath.getParentFile().mkdir();
                }else if (filePath.exists()){
                    filePath.delete();
                }
                file.transferTo(new File(imagePath + File.separator + imageName));
            }
            log.info("request: shop/update , shop: " + shop.toString());
            return ResultGenerator.genSuccessResult();
        } catch (IOException e) {
            e.printStackTrace();
            return ResultGenerator.genFailResult("修改失败！");
        }
    }

    /**
     * 删除一个或多个商店
     * @param request 用于获取路径，删除图片
     * @param shopIds 要删除的商店ID数组
     */
    @RequestMapping(value = "",method = RequestMethod.DELETE)
    public Result deleteShop(HttpServletRequest request, @RequestParam(value = "shopIds", required = false) String[] shopIds){

        if (shopIds != null) {
            // 遍历每个ID
            for (String shopId : shopIds) {
                int id = Integer.parseInt(shopId);

                // 获取当前商店的图片名称与存放路径
                String imageName = shopImageService.getByShopId(id).getId() + ".jpg";
                String imagePath = request.getServletContext().getRealPath("/img/shop-list/article/");
                File filePath = new File(imagePath, imageName);

                // 删除图片
                if (filePath.exists()){
                    filePath.delete();
                }

                // 删除数据库中的商店
                shopImageService.deleteByShopId(id);
                shopService.delete(id);
            }
            log.info("request: shop/delete , shopIds: " + Arrays.toString(shopIds));
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult("删除失败！未选中商店");
        }
    }
}
