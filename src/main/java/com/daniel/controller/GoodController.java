package com.daniel.controller;

import com.daniel.common.Result;
import com.daniel.common.ResultGenerator;
import com.daniel.pojo.MerchantUser;
import com.daniel.pojo.Shop;
import com.daniel.pojo.Good;
import com.daniel.pojo.GoodImage;
import com.daniel.service.ShopService;
import com.daniel.service.GoodImageService;
import com.daniel.service.GoodService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;

@RestController
@RequestMapping("/goods")
public class GoodController {

    @Autowired
    private ShopService shopService;
    @Autowired
    private GoodService goodService;
    @Autowired
    private GoodImageService goodImageService;

    // 日志文件
    private static final Logger log = Logger.getLogger(GoodController.class);

    /**
     * 商品详情页
     * @param id 商品ID
     * @return 该ID商品的详情页
     */
    @RequestMapping(value = "/{id}",method = RequestMethod.GET)
    public ModelAndView getGoodDetail(@PathVariable("id") String id) {
        ModelAndView mav = new ModelAndView("goodDetail");
        int intId = Integer.parseInt(id);
        Good curGood = goodService.get(intId);
        curGood.setGoodImage(goodImageService.getByGoodId(intId));
        curGood.setShop(shopService.get(goodService.getShopId(intId)));
        mav.addObject("good",curGood);
        return mav;
    }

    /**
     * 上传商品
     * @param request 用于获取当前商店信息
     * @param good 商品实体类
     * @param file 图片文件
     */
    @RequestMapping(value = "",method = RequestMethod.POST)
    public Result uploadSell(HttpServletRequest request,Good good,
                           @RequestParam(value = "image" , required = false) MultipartFile file){
        // 获取当前商店的信息
        MerchantUser user = (MerchantUser) request.getSession().getAttribute("user");
        Shop shop = shopService.getByUserId(user.getId());
        try {
            if(file != null && good != null){
                // 写入商品信息
                /** 上传时间不需要
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                long time = System.currentTimeMillis();
                String timeStr= sdf.format(time);
                book.setDate(timeStr);
                */
                good.setShop(shop);
                goodService.add(good);
                GoodImage goodImage = new GoodImage();
                goodImage.setGood(good);
                goodImageService.add(goodImage);
                String imageName = goodImage.getId()+".jpg";
                String imagePath = request.getServletContext().getRealPath("/img/good-list/article/");
                File filePath = new File(imagePath,imageName);
                if (!filePath.getParentFile().exists()){
                    filePath.getParentFile().mkdir();
                }
                file.transferTo(new File(imagePath + File.separator + imageName));
                log.info("request: good/upload , good: " + good.toString());
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
     * 更新商品的视图
     * @param id 商品的ID
     * @return 该ID的商品的更新界面
     */
    @RequestMapping(value = "/renewGood/{id}",method = RequestMethod.GET)
    public ModelAndView goEditGood(@PathVariable String id){
        ModelAndView  mav = new ModelAndView("editGood");
        int goodId = Integer.parseInt(id);
        Good curGood = goodService.get(goodId);
        log.info("request: good/update , good: " + curGood.toString());
        if (curGood != null){
            curGood.setGoodImage(goodImageService.getByGoodId(goodId));
        }
        mav.addObject("good",curGood);
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
     * 更新商品内容
     * @param request 用于获取路径
     * @param good 除图片外其他的商品信息
     * @param file 图片
     * @return
     * 应该使用PUT，可是需要上传图片，表单提交无法用PUT，待解决
     */
    @RequestMapping(value = "/renewGood",method = RequestMethod.POST)
    public Result editGood(HttpServletRequest request, Good good,
                           @RequestParam(value = "image" , required = false) MultipartFile file){
        try {
            goodService.update(good);
            if (file != null) {
                GoodImage goodImage = goodImageService.getByGoodId(good.getId());
                goodImage.setGood(good);
                goodImageService.update(goodImage);
                String imageName = goodImage.getId() + ".jpg";
                String imagePath = request.getServletContext().getRealPath("/img/good-list/article/");
                File filePath = new File(imagePath, imageName);
                if (!filePath.getParentFile().exists()) {
                    filePath.getParentFile().mkdir();
                }else if (filePath.exists()){
                    filePath.delete();
                }
                file.transferTo(new File(imagePath + File.separator + imageName));
            }
            log.info("request: good/update , good: " + good.toString());
            return ResultGenerator.genSuccessResult();
        } catch (IOException e) {
            e.printStackTrace();
            return ResultGenerator.genFailResult("修改失败！");
        }
    }

    /**
     * 删除一个或多个商品
     * @param request 用于获取路径，删除图片
     * @param goodIds 要删除的商品ID数组
     */
    @RequestMapping(value = "",method = RequestMethod.DELETE)
    public Result deleteGood(HttpServletRequest request, @RequestParam(value = "goodIds", required = false) String[] goodIds){

        if (goodIds != null) {
            // 遍历每个ID
            for (String goodId : goodIds) {
                int id = Integer.parseInt(goodId);

                // 获取当前商品的图片名称与存放路径
                String imageName = goodImageService.getByGoodId(id).getId() + ".jpg";
                String imagePath = request.getServletContext().getRealPath("/img/good-list/article/");
                File filePath = new File(imagePath, imageName);

                // 删除图片
                if (filePath.exists()){
                    filePath.delete();
                }

                // 删除数据库中的商品
                goodImageService.deleteByGoodId(id);
                goodService.delete(id);
            }
            log.info("request: good/delete , goodIds: " + Arrays.toString(goodIds));
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult("删除失败！未选中商品");
        }
    }
}
