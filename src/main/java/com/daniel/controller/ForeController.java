package com.daniel.controller;

import com.daniel.pojo.*;
import com.daniel.service.ShopImageService;
import com.daniel.service.ShopService;
import com.daniel.service.GoodImageService;
import com.daniel.service.GoodService;
import com.daniel.service.MerchantUserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class ForeController {

    @Autowired
    private ShopService shopService;
    @Autowired
    private GoodService goodService;

    @RequestMapping("/home.do")
    public ModelAndView goHome() {
        /**
         * 去除类别显示，jsp页面中做对应更改，更应该参考bookStore.jsp
         */
        ModelAndView mav =new ModelAndView("home");
        /*
        Map<Integer, String> categories = categoryService.listByMap();
        Map<Category,List<Book>> booksMap = bookService.listByCategory();
        mav.addObject("categories",categories);
        mav.addObject("booksMap",booksMap);
        */
        List<Shop> shops = shopService.list();
        mav.addObject("shops",shops);
        return mav;
    }

    @RequestMapping("/myShopshelf.do")
    public ModelAndView goMyShopshelf(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("myShopshelf");
        MerchantUser user = (MerchantUser) request.getSession().getAttribute("user");
        List<Shop> shops = shopService.listByUserId(user.getId());
        /**求书区不需要，jsp页面因此要做些更改
        List<Book> askBooks = bookService.listByUserId(user.getId(),0);
         */
        mav.addObject("shops",shops);
        return mav;
    }

    @RequestMapping("/myGoodshelf.do")
    public ModelAndView goMyGoodshelf(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("myGoodshelf");
        MerchantUser user = (MerchantUser) request.getSession().getAttribute("user");
        Shop shop = shopService.getByUserId(user.getId());
        List<Good> goods = goodService.listByShopId(shop.getId());
        mav.addObject("goods",goods);
        return mav;
    }

    /**
     * 由于不需要考虑类别等问题，直接返回
     * @return 商品上传页面
     */
    @RequestMapping("/goUploadGood.do")
    public ModelAndView upload(Good good){
        ModelAndView mav = new ModelAndView("uploadGood");
        return mav;
    }

    @RequestMapping("/goShopStore.do")
    public ModelAndView goShopStore(Page page){
        ModelAndView mav = new ModelAndView("shopStore");
        int total = shopService.count();
        page.calculateEnd(total);
        if (page.getStart() < 0) {
            page.setStart(0);
        }else if (page.getStart() > total){
            page.setEnd(page.getEnd());
        }
        PageHelper.offsetPage(page.getStart(),16);
        List<Shop> shops = shopService.list();
        mav.addObject("shops",shops);
        return mav;
    }

    @RequestMapping("/shop/{sid}/goGoodStore.do")
    public ModelAndView goGoodStore(Page page, @PathVariable("sid") String sid){
        ModelAndView mav = new ModelAndView("goodStore");
        int intSid = Integer.parseInt(sid);
        int total = goodService.count(intSid);
        page.calculateEnd(total);
        if (page.getStart() < 0) {
            page.setStart(0);
        }else if (page.getStart() > total){
            page.setEnd(page.getEnd());
        }
        PageHelper.offsetPage(page.getStart(),16);
        List<Good> goods = goodService.listByShopId(intSid);
        mav.addObject("goods",goods);
        return mav;
    }

    /**
     * 原本首页展示类别下的图书，而下面这个页面展示所有图书
     * 目前而言直接展示所有商店，暂时不需要这块
     *
    @RequestMapping("/goBookStore.do")
    public ModelAndView goBookStore(Page page,Category category){
        ModelAndView mav = new ModelAndView("bookStore");
        Map<Integer, String> categories = categoryService.listByMap();
        Category curCategory = category.getId() !=0?categoryService.get(category.getId()):new Category();
        String categoryName = curCategory.getName() == null?"所有二手书":curCategory.getName();
        int total = bookService.count();
        page.calculateEnd(total);
        if (page.getStart() < 0) {
            page.setStart(0);
        }else if (page.getStart() > total){
            page.setEnd(page.getEnd());
        }
        PageHelper.offsetPage(page.getStart(),16);
        List<Book> books = curCategory.getId() == 0?bookService.listByBookType(1):bookService.listByCategoryId(1,curCategory.getId());
        mav.addObject("categoryName",categoryName);
        mav.addObject("books",books);
        mav.addObject("categories",categories);
        return mav;
    }
     */

    /**
    * 下面这个页面展示求书区的所有图书
    * 目前而言直接展示所有商店，暂时不需要这块
    @RequestMapping("/goAskBookStore.do")
    public ModelAndView goAskBookStore(Page page){
        ModelAndView mav = new ModelAndView("askBookStore");
        int total = bookService.count();
        page.calculateEnd(total);
        if (page.getStart() < 0) {
            page.setStart(0);
        }else if (page.getStart() > total){
            page.setEnd(page.getEnd());
        }
        PageHelper.offsetPage(page.getStart(),16);
        List<Book> books = bookService.listByBookType(0);
        mav.addObject("books",books);
        return mav;
    }
    */
}
